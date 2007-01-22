From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Mon, 22 Jan 2007 14:57:26 +0000
Subject: [KJ] Replacing check_region with request_region
Message-Id: <1169477126.3554.18.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
  I found the following instances of check_region in the 2.6.20-rc5
code.
  I also found that these files also have request_region in some parts.
So I was just wondering if they were left there for some reason....but
as part of the deprecated API they have to be removed at some point of
time right?
  If they need to be changed then I would go ahead and make a patch.
Thanks...

drivers/cdrom/sbpcd.c

                if (check_region(addr[1],4))
                {
                        msg(DBG_INF,"check_region: %03X is not
free.\n",addr[1]);
                        continue;
                }
------------------------------------------------------------------
drivers/scsi/BusLogic.c

        /*
           Append the list of standard BusLogic MultiMaster ISA I/O
Addresses.
         */
        if (BusLogic_ProbeOptions.LimitedProbeISA ?
BusLogic_ProbeOptions.Probe330 : check_region(0x330,
BusLogic_MultiMasterAddressCount) = 0)
                BusLogic_AppendProbeAddressISA(0x330);
        if (BusLogic_ProbeOptions.LimitedProbeISA ?
BusLogic_ProbeOptions.Probe334 : check_region(0x334,
BusLogic_MultiMasterAddressCount) = 0)
                BusLogic_AppendProbeAddressISA(0x334);
        if (BusLogic_ProbeOptions.LimitedProbeISA ?
BusLogic_ProbeOptions.Probe230 : check_region(0x230,
BusLogic_MultiMasterAddressCount) = 0)
                BusLogic_AppendProbeAddressISA(0x230);
        if (BusLogic_ProbeOptions.LimitedProbeISA ?
BusLogic_ProbeOptions.Probe234 : check_region(0x234,
BusLogic_MultiMasterAddressCount) = 0)
                BusLogic_AppendProbeAddressISA(0x234);
        if (BusLogic_ProbeOptions.LimitedProbeISA ?
BusLogic_ProbeOptions.Probe130 : check_region(0x130,
BusLogic_MultiMasterAddressCount) = 0)
                BusLogic_AppendProbeAddressISA(0x130);
        if (BusLogic_ProbeOptions.LimitedProbeISA ?
BusLogic_ProbeOptions.Probe134 : check_region(0x134,
BusLogic_MultiMasterAddressCount) = 0)
                BusLogic_AppendProbeAddressISA(0x134);
----------------------------------------------------------------
drivers/scsi/advansys.c

                        if (check_region(iop, ASC_IOADR_GAP) != 0) {
                            printk(
"AdvanSys SCSI: specified I/O Port 0x%X is busy\n", iop);
-----------------------------------------------------------------
sound/oss/pss.c

        else if(check_region(pss_cdrom_port, 2))
        {
                printk(KERN_ERR "PSS: CDROM I/O port conflict.\n");
        }
-----------------------------------------------------------------
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
