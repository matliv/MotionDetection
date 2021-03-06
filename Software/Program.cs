﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace imageDiffs
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Params.ParamsManager paramsManager = new Params.ParamsManager();
            BackEnd.CameraDevice cameraDevice = new BackEnd.CameraDevice(paramsManager);
            BridgeNs.Bridge bridge = new BridgeNs.Bridge(cameraDevice);

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FrontEnd.Form1(paramsManager, bridge));
        }
    }
}
