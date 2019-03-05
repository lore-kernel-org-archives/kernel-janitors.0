From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Mar 2019 11:46:55 +0000
Subject: [bug report] misc: rtsx: Enable OCP for rts522a rts524a rts525a rts5260
Message-Id: <20190305114655.GA17506@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello RickyWu,

The patch bede03a579b3: "misc: rtsx: Enable OCP for rts522a rts524a
rts525a rts5260" from Feb 19, 2019, leads to the following static
checker warning:

	drivers/misc/cardreader/rts5260.c:707 rts5260_init_params()
	'0x50 | 0x50' has '0x50' set on both sides

drivers/misc/cardreader/rts5260.c
    694 	/* init latency of active, idle, L1OFF to 60us, 300us, 3ms */
    695 	option->ltr_active_latency = LTR_ACTIVE_LATENCY_DEF;
    696 	option->ltr_idle_latency = LTR_IDLE_LATENCY_DEF;
    697 	option->ltr_l1off_latency = LTR_L1OFF_LATENCY_DEF;
    698 	option->dev_aspm_mode = DEV_ASPM_DYNAMIC;
    699 	option->l1_snooze_delay = L1_SNOOZE_DELAY_DEF;
    700 	option->ltr_l1off_sspwrgate = LTR_L1OFF_SSPWRGATE_5250_DEF;
    701 	option->ltr_l1off_snooze_sspwrgate     702 		LTR_L1OFF_SNOOZE_SSPWRGATE_5250_DEF;
    703 
    704 	option->ocp_en = 1;
    705 	if (option->ocp_en)
    706 		hw_param->interrupt_en |= SD_OC_INT_EN;
--> 707 	hw_param->ocp_glitch =  SDVIO_OCP_GLITCH_800U | SDVIO_OCP_GLITCH_800U;
                                        ^^^^^^^^^^^^^^^^^^^^^
This used to be SD_OCP_GLITCH_10M but now it's SDVIO_OCP_GLITCH_800U
on both sides.

    708 	option->sd_400mA_ocp_thd = RTS5260_DVCC_OCP_THD_550;
    709 	option->sd_800mA_ocp_thd = RTS5260_DVCC_OCP_THD_970;
    710 }

regards,
dan carpenter
