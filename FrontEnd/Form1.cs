﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Threading;
using System.Windows.Forms;

namespace imageDiffs
{
    public partial class Form1 : Form
    {
        private BridgeNs.Bridge m_bridge;
        private bool m_isVideoRunning;

        public Form1(BridgeNs.Bridge bridge)
        {
            InitializeComponent();
            m_bridge = bridge;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            List<string> availableCameras = m_bridge.getAvailableCameraNames();

            foreach (string deviceName in availableCameras)
            {
                comboBox1.Items.Add(deviceName);
            }

            comboBox1.SelectedIndex = comboBox1.Items.Count-1;
            m_isVideoRunning = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(m_isVideoRunning)
            {
                m_bridge.StopVideo();
                m_bridge.UnregisterFromNewFrameEvent();
            }
            else
            {
                m_bridge.ConnectToCamera(comboBox1.SelectedIndex);
                m_bridge.RegisterToNewFrameEvent(UpdateImage);
            }
            m_isVideoRunning = !m_isVideoRunning;
        }

        private void UpdateImage(Bitmap capturedImage, Bitmap averageImage)
        {
            //we create a copy of the images since both the backend and the UI need to lock their bits, which can't be done on one object from 2 places at the same time
            Bitmap capturedImage2 = (Bitmap)capturedImage.Clone();
            Bitmap averageImage2 = (Bitmap)averageImage.Clone();

            try
            {
                Invoke((MethodInvoker)delegate
                {
                        pictureBox1.Image = capturedImage2;
                    averagePictureBox.Image = averageImage2;
                });
            }
            catch (Exception)
            {
                //due to thread race, it Form1(this) may be already disposed when closing the app. We ignore this exception.
            }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            m_bridge.UnregisterFromNewFrameEvent();
            m_bridge.StopVideo();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*if (m_isVideoRunning)
            {
                m_bridge.StopVideo();
                m_bridge.UnregisterFromNewFrameEvent();
            }

            //Thread.Sleep(1500);

            m_bridge.ConnectToCamera(comboBox1.SelectedIndex);
            m_bridge.RegisterToNewFrameEvent(UpdateImage);

            m_isVideoRunning = true;*/
        }
    }
}