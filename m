From: Henne <henne@nachtwindheim.de>
Date: Wed, 26 Apr 2006 11:49:34 +0000
Subject: [KJ] [PATCH] __devinitdata for net-subsys (1/2)
Message-Id: <444F5E4E.1030700@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of net-subsys as __devinitdata (1/2).
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -ruN linux-2.6.17-rc2/drivers/net/arcnet/com20020-pci.c linux/drivers/=
net/arcnet/com20020-pci.c
--- linux-2.6.17-rc2/drivers/net/arcnet/com20020-pci.c	2006-03-20 06:53:29.=
000000000 +0100
+++ linux/drivers/net/arcnet/com20020-pci.c	2006-04-26 13:28:38.000000000 +=
0200
@@ -141,7 +141,7 @@
  	free_netdev(dev);
  }

-static struct pci_device_id com20020pci_id_table[] =3D {
+static struct pci_device_id com20020pci_id_table[] __devinitdata =3D {
  	{ 0x1571, 0xa001, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ 0x1571, 0xa002, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ 0x1571, 0xa003, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
diff -ruN linux-2.6.17-rc2/drivers/net/e1000/e1000_main.c linux/drivers/net=
/e1000/e1000_main.c
--- linux-2.6.17-rc2/drivers/net/e1000/e1000_main.c	2006-04-24 13:30:58.000=
000000 +0200
+++ linux/drivers/net/e1000/e1000_main.c	2006-04-26 13:08:35.000000000 +0200
@@ -85,7 +85,7 @@
   * Macro expands to...
   *   {PCI_DEVICE(PCI_VENDOR_ID_INTEL, device_id)}
   */
-static struct pci_device_id e1000_pci_tbl[] =3D {
+static struct pci_device_id e1000_pci_tbl[] __devinitdata =3D {
  	INTEL_E1000_ETHERNET_DEVICE(0x1000),
  	INTEL_E1000_ETHERNET_DEVICE(0x1001),
  	INTEL_E1000_ETHERNET_DEVICE(0x1004),
diff -ruN linux-2.6.17-rc2/drivers/net/irda/donauboe.c linux/drivers/net/ir=
da/donauboe.c
--- linux-2.6.17-rc2/drivers/net/irda/donauboe.c	2006-04-24 13:30:58.000000=
000 +0200
+++ linux/drivers/net/irda/donauboe.c	2006-04-26 13:10:49.000000000 +0200
@@ -188,7 +188,7 @@
  #define CONFIG0H_DMA_ON_NORX CONFIG0H_DMA_OFF| OBOE_CONFIG0H_ENDMAC
  #define CONFIG0H_DMA_ON CONFIG0H_DMA_ON_NORX | OBOE_CONFIG0H_ENRX

-static struct pci_device_id toshoboe_pci_tbl[] =3D {
+static struct pci_device_id toshoboe_pci_tbl[] __devinitdata =3D {
  	{ PCI_VENDOR_ID_TOSHIBA, PCI_DEVICE_ID_FIR701, PCI_ANY_ID, PCI_ANY_ID, },
  	{ PCI_VENDOR_ID_TOSHIBA, PCI_DEVICE_ID_FIRD01, PCI_ANY_ID, PCI_ANY_ID, },
  	{ }			/* Terminating entry */
diff -ruN linux-2.6.17-rc2/drivers/net/irda/via-ircc.c linux/drivers/net/ir=
da/via-ircc.c
--- linux-2.6.17-rc2/drivers/net/irda/via-ircc.c	2006-03-20 06:53:29.000000=
000 +0100
+++ linux/drivers/net/irda/via-ircc.c	2006-04-26 13:11:29.000000000 +0200
@@ -124,7 +124,7 @@
  	}
  }

-static struct pci_device_id via_pci_tbl[] =3D {
+static struct pci_device_id via_pci_tbl[] __devinitdata =3D {
  	{ PCI_VENDOR_ID_VIA, 0x8231, PCI_ANY_ID, PCI_ANY_ID,0,0,0 },
  	{ PCI_VENDOR_ID_VIA, 0x3109, PCI_ANY_ID, PCI_ANY_ID,0,0,1 },
  	{ PCI_VENDOR_ID_VIA, 0x3074, PCI_ANY_ID, PCI_ANY_ID,0,0,2 },
diff -ruN linux-2.6.17-rc2/drivers/net/irda/vlsi_ir.c linux/drivers/net/ird=
a/vlsi_ir.c
--- linux-2.6.17-rc2/drivers/net/irda/vlsi_ir.c	2006-04-24 13:30:58.0000000=
00 +0200
+++ linux/drivers/net/irda/vlsi_ir.c	2006-04-26 13:12:48.000000000 +0200
@@ -60,7 +60,7 @@

  static /* const */ char drivername[] =3D DRIVER_NAME;

-static struct pci_device_id vlsi_irda_table [] =3D {
+static struct pci_device_id vlsi_irda_table[] __devinitdata =3D {
  	{
  		.class =3D        PCI_CLASS_WIRELESS_IRDA << 8,
  		.class_mask =3D	PCI_CLASS_SUBCLASS_MASK << 8,
diff -ruN linux-2.6.17-rc2/drivers/net/ixgb/ixgb_main.c linux/drivers/net/i=
xgb/ixgb_main.c
--- linux-2.6.17-rc2/drivers/net/ixgb/ixgb_main.c	2006-04-24 13:30:58.00000=
0000 +0200
+++ linux/drivers/net/ixgb/ixgb_main.c	2006-04-26 13:13:48.000000000 +0200
@@ -64,7 +64,7 @@
   * { Vendor ID, Device ID, SubVendor ID, SubDevice ID,
   *   Class, Class Mask, private data (not used) }
   */
-static struct pci_device_id ixgb_pci_tbl[] =3D {
+static struct pci_device_id ixgb_pci_tbl[] __devinitdata =3D {
  	{INTEL_VENDOR_ID, IXGB_DEVICE_ID_82597EX,
  	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{INTEL_VENDOR_ID, IXGB_DEVICE_ID_82597EX_SR,
diff -ruN linux-2.6.17-rc2/drivers/net/sk98lin/skge.c linux/drivers/net/sk9=
8lin/skge.c
--- linux-2.6.17-rc2/drivers/net/sk98lin/skge.c	2006-04-24 13:30:59.0000000=
00 +0200
+++ linux/drivers/net/sk98lin/skge.c	2006-04-26 13:15:53.000000000 +0200
@@ -5104,7 +5104,7 @@
  #define skge_resume NULL
  #endif

-static struct pci_device_id skge_pci_tbl[] =3D {
+static struct pci_device_id skge_pci_tbl[] __devinitdata =3D {
  	{ PCI_VENDOR_ID_3COM, 0x1700, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ PCI_VENDOR_ID_3COM, 0x80eb, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ PCI_VENDOR_ID_SYSKONNECT, 0x4300, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
diff -ruN linux-2.6.17-rc2/drivers/net/skfp/skfddi.c linux/drivers/net/skfp=
/skfddi.c
--- linux-2.6.17-rc2/drivers/net/skfp/skfddi.c	2006-04-24 13:30:59.00000000=
0 +0200
+++ linux/drivers/net/skfp/skfddi.c	2006-04-26 13:26:32.000000000 +0200
@@ -150,7 +150,7 @@
  extern void mac_drv_clear_rx_queue(struct s_smc *smc);
  extern void enable_tx_irq(struct s_smc *smc, u_short queue);

-static struct pci_device_id skfddi_pci_tbl[] =3D {
+static struct pci_device_id skfddi_pci_tbl[] __devinitdata =3D {
  	{ PCI_VENDOR_ID_SK, PCI_DEVICE_ID_SK_FP, PCI_ANY_ID, PCI_ANY_ID, },
  	{ }			/* Terminating entry */
  };
diff -ruN linux-2.6.17-rc2/drivers/net/tokenring/3c359.c linux/drivers/net/=
tokenring/3c359.c
--- linux-2.6.17-rc2/drivers/net/tokenring/3c359.c	2006-03-20 06:53:29.0000=
00000 +0100
+++ linux/drivers/net/tokenring/3c359.c	2006-04-26 13:18:14.000000000 +0200
@@ -116,7 +116,7 @@

  #include "3c359_microcode.h"

-static struct pci_device_id xl_pci_tbl[] +static struct pci_device_id xl_p=
ci_tbl[] __devinitdata   {
  	{PCI_VENDOR_ID_3COM,PCI_DEVICE_ID_3COM_3C359, PCI_ANY_ID, PCI_ANY_ID, },
  	{ }			/* terminate list */
diff -ruN linux-2.6.17-rc2/drivers/net/tokenring/abyss.c linux/drivers/net/=
tokenring/abyss.c
--- linux-2.6.17-rc2/drivers/net/tokenring/abyss.c	2006-04-24 13:30:59.0000=
00000 +0200
+++ linux/drivers/net/tokenring/abyss.c	2006-04-26 13:19:06.000000000 +0200
@@ -45,7 +45,7 @@

  #define ABYSS_IO_EXTENT 64

-static struct pci_device_id abyss_pci_tbl[] =3D {
+static struct pci_device_id abyss_pci_tbl[] __devinitdata =3D {
  	{ PCI_VENDOR_ID_MADGE, PCI_DEVICE_ID_MADGE_MK2,
  	  PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_NETWORK_TOKEN_RING << 8, 0x00ffffff,=
 },
  	{ }			/* Terminating entry */
diff -ruN linux-2.6.17-rc2/drivers/net/tokenring/lanstreamer.c linux/driver=
s/net/tokenring/lanstreamer.c
--- linux-2.6.17-rc2/drivers/net/tokenring/lanstreamer.c	2006-04-24 13:30:5=
9.000000000 +0200
+++ linux/drivers/net/tokenring/lanstreamer.c	2006-04-26 13:19:22.000000000=
 +0200
@@ -147,7 +147,7 @@
  static char version[] =3D "LanStreamer.c v0.4.0 03/08/01 - Mike Sullivan\=
n"
                          "              v0.5.3 11/13/02 - Kent Yoder";

-static struct pci_device_id streamer_pci_tbl[] =3D {
+static struct pci_device_id streamer_pci_tbl[] __devinitdata =3D {
  	{ PCI_VENDOR_ID_IBM, PCI_DEVICE_ID_IBM_TR, PCI_ANY_ID, PCI_ANY_ID,},
  	{}	/* terminating entry */
  };
diff -ruN linux-2.6.17-rc2/drivers/net/tokenring/olympic.c linux/drivers/ne=
t/tokenring/olympic.c
--- linux-2.6.17-rc2/drivers/net/tokenring/olympic.c	2006-04-24 13:30:59.00=
0000000 +0200
+++ linux/drivers/net/tokenring/olympic.c	2006-04-26 13:19:38.000000000 +02=
00
@@ -172,7 +172,7 @@
  static int network_monitor[OLYMPIC_MAX_ADAPTERS] =3D {0,};
  module_param_array(network_monitor, int, NULL, 0);

-static struct pci_device_id olympic_pci_tbl[] =3D {
+static struct pci_device_id olympic_pci_tbl[] __devinitdata =3D {
  	{PCI_VENDOR_ID_IBM,PCI_DEVICE_ID_IBM_TR_WAKE,PCI_ANY_ID,PCI_ANY_ID,},
  	{ } 	/* Terminating Entry */
  };
diff -ruN linux-2.6.17-rc2/drivers/net/tokenring/tmspci.c linux/drivers/net=
/tokenring/tmspci.c
--- linux-2.6.17-rc2/drivers/net/tokenring/tmspci.c	2006-03-20 06:53:29.000=
000000 +0100
+++ linux/drivers/net/tokenring/tmspci.c	2006-04-26 13:20:07.000000000 +0200
@@ -57,7 +57,7 @@
  	{ {0x03, 0x01}, "3Com Token Link Velocity"},
  };

-static struct pci_device_id tmspci_pci_tbl[] =3D {
+static struct pci_device_id tmspci_pci_tbl[] __devinitdata =3D {
  	{ PCI_VENDOR_ID_COMPAQ, PCI_DEVICE_ID_COMPAQ_TOKENRING, PCI_ANY_ID, PCI_=
ANY_ID, 0, 0, 0 },
  	{ PCI_VENDOR_ID_SYSKONNECT, PCI_DEVICE_ID_SYSKONNECT_TR, PCI_ANY_ID, PCI=
_ANY_ID, 0, 0, 1 },
  	{ PCI_VENDOR_ID_TCONRAD, PCI_DEVICE_ID_TCONRAD_TOKENRING, PCI_ANY_ID, PC=
I_ANY_ID, 0, 0, 2 },
diff -ruN linux-2.6.17-rc2/drivers/net/tulip/de2104x.c linux/drivers/net/tu=
lip/de2104x.c
--- linux-2.6.17-rc2/drivers/net/tulip/de2104x.c	2006-04-24 13:30:59.000000=
000 +0200
+++ linux/drivers/net/tulip/de2104x.c	2006-04-26 13:30:53.000000000 +0200
@@ -329,7 +329,7 @@
  static unsigned int de_ok_to_advertise (struct de_private *de, u32 new_me=
dia);


-static struct pci_device_id de_pci_tbl[] =3D {
+static struct pci_device_id de_pci_tbl[] __devinitdata =3D {
  	{ PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_DEC_TULIP,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_DEC_TULIP_PLUS,
diff -ruN linux-2.6.17-rc2/drivers/net/tulip/de4x5.c linux/drivers/net/tuli=
p/de4x5.c
--- linux-2.6.17-rc2/drivers/net/tulip/de4x5.c	2006-04-24 13:30:59.00000000=
0 +0200
+++ linux/drivers/net/tulip/de4x5.c	2006-04-26 13:31:26.000000000 +0200
@@ -2352,7 +2352,7 @@
  	pci_disable_device (pdev);
  }

-static struct pci_device_id de4x5_pci_tbl[] =3D {
+static struct pci_device_id de4x5_pci_tbl[] __devinitdata =3D {
          { PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_DEC_TULIP,
            PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
          { PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_DEC_TULIP_PLUS,
diff -ruN linux-2.6.17-rc2/drivers/net/tulip/dmfe.c linux/drivers/net/tulip=
/dmfe.c
--- linux-2.6.17-rc2/drivers/net/tulip/dmfe.c	2006-03-20 06:53:29.000000000=
 +0100
+++ linux/drivers/net/tulip/dmfe.c	2006-04-26 13:31:54.000000000 +0200
@@ -1964,7 +1964,7 @@



-static struct pci_device_id dmfe_pci_tbl[] =3D {
+static struct pci_device_id dmfe_pci_tbl[] __devinitdata =3D {
  	{ 0x1282, 0x9132, PCI_ANY_ID, PCI_ANY_ID, 0, 0, PCI_DM9132_ID },
  	{ 0x1282, 0x9102, PCI_ANY_ID, PCI_ANY_ID, 0, 0, PCI_DM9102_ID },
  	{ 0x1282, 0x9100, PCI_ANY_ID, PCI_ANY_ID, 0, 0, PCI_DM9100_ID },
diff -ruN linux-2.6.17-rc2/drivers/net/tulip/tulip_core.c linux/drivers/net=
/tulip/tulip_core.c
--- linux-2.6.17-rc2/drivers/net/tulip/tulip_core.c	2006-03-20 06:53:29.000=
000000 +0100
+++ linux/drivers/net/tulip/tulip_core.c	2006-04-26 13:32:27.000000000 +0200
@@ -202,7 +202,7 @@
  };


-static struct pci_device_id tulip_pci_tbl[] =3D {
+static struct pci_device_id tulip_pci_tbl[] __devinitdata =3D {
  	{ 0x1011, 0x0009, PCI_ANY_ID, PCI_ANY_ID, 0, 0, DC21140 },
  	{ 0x1011, 0x0019, PCI_ANY_ID, PCI_ANY_ID, 0, 0, DC21143 },
  	{ 0x11AD, 0x0002, PCI_ANY_ID, PCI_ANY_ID, 0, 0, LC82C168 },
diff -ruN linux-2.6.17-rc2/drivers/net/tulip/uli526x.c linux/drivers/net/tu=
lip/uli526x.c
--- linux-2.6.17-rc2/drivers/net/tulip/uli526x.c	2006-03-20 06:53:29.000000=
000 +0100
+++ linux/drivers/net/tulip/uli526x.c	2006-04-26 13:33:07.000000000 +0200
@@ -1670,7 +1670,7 @@
  }


-static struct pci_device_id uli526x_pci_tbl[] =3D {
+static struct pci_device_id uli526x_pci_tbl[] __devinitdata =3D {
  	{ 0x10B9, 0x5261, PCI_ANY_ID, PCI_ANY_ID, 0, 0, PCI_ULI5261_ID },
  	{ 0x10B9, 0x5263, PCI_ANY_ID, PCI_ANY_ID, 0, 0, PCI_ULI5263_ID },
  	{ 0, }
diff -ruN linux-2.6.17-rc2/drivers/net/tulip/winbond-840.c linux/drivers/ne=
t/tulip/winbond-840.c
--- linux-2.6.17-rc2/drivers/net/tulip/winbond-840.c	2006-04-24 13:30:59.00=
0000000 +0200
+++ linux/drivers/net/tulip/winbond-840.c	2006-04-26 13:34:05.000000000 +02=
00
@@ -227,7 +227,7 @@
  #define W840_FLAGS (PCI_USES_MEM | PCI_ADDR1 | PCI_USES_MASTER)
  #endif

-static struct pci_device_id w840_pci_tbl[] =3D {
+static struct pci_device_id w840_pci_tbl[] __devinitdata =3D {
  	{ 0x1050, 0x0840, PCI_ANY_ID, 0x8153,     0, 0, 0 },
  	{ 0x1050, 0x0840, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1 },
  	{ 0x11f6, 0x2011, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 2 },
diff -ruN linux-2.6.17-rc2/drivers/net/tulip/xircom_cb.c linux/drivers/net/=
tulip/xircom_cb.c
--- linux-2.6.17-rc2/drivers/net/tulip/xircom_cb.c	2006-04-24 13:30:59.0000=
00000 +0200
+++ linux/drivers/net/tulip/xircom_cb.c	2006-04-26 13:34:23.000000000 +0200
@@ -146,7 +146,7 @@



-static struct pci_device_id xircom_pci_table[] =3D {
+static struct pci_device_id xircom_pci_table[] __devinitdata =3D {
  	{0x115D, 0x0003, PCI_ANY_ID, PCI_ANY_ID,},
  	{0,},
  };
diff -ruN linux-2.6.17-rc2/drivers/net/tulip/xircom_tulip_cb.c linux/driver=
s/net/tulip/xircom_tulip_cb.c
--- linux-2.6.17-rc2/drivers/net/tulip/xircom_tulip_cb.c	2006-03-20 06:53:2=
9.000000000 +0100
+++ linux/drivers/net/tulip/xircom_tulip_cb.c	2006-04-26 13:34:51.000000000=
 +0200
@@ -1647,7 +1647,7 @@
  }


-static struct pci_device_id xircom_pci_table[] =3D {
+static struct pci_device_id xircom_pci_table[] __devinitdata =3D {
    { 0x115D, 0x0003, PCI_ANY_ID, PCI_ANY_ID, 0, 0, X3201_3 },
    {0},
  };
diff -ruN linux-2.6.17-rc2/drivers/net/wan/dscc4.c linux/drivers/net/wan/ds=
cc4.c
--- linux-2.6.17-rc2/drivers/net/wan/dscc4.c	2006-04-24 13:30:59.000000000 =
+0200
+++ linux/drivers/net/wan/dscc4.c	2006-04-26 13:36:08.000000000 +0200
@@ -2046,7 +2046,7 @@
  __setup("dscc4.setup=3D", dscc4_setup);
  #endif

-static struct pci_device_id dscc4_pci_tbl[] =3D {
+static struct pci_device_id dscc4_pci_tbl[] __devinitdata =3D {
  	{ PCI_VENDOR_ID_SIEMENS, PCI_DEVICE_ID_SIEMENS_DSCC4,
  	        PCI_ANY_ID, PCI_ANY_ID, },
  	{ 0,}
diff -ruN linux-2.6.17-rc2/drivers/net/wan/lmc/lmc_main.c linux/drivers/net=
/wan/lmc/lmc_main.c
--- linux-2.6.17-rc2/drivers/net/wan/lmc/lmc_main.c	2006-03-20 06:53:29.000=
000000 +0100
+++ linux/drivers/net/wan/lmc/lmc_main.c	2006-04-26 13:36:24.000000000 +0200
@@ -82,7 +82,7 @@

  static int LMC_PKT_BUF_SZ =3D 1542;

-static struct pci_device_id lmc_pci_tbl[] =3D {
+static struct pci_device_id lmc_pci_tbl[] __devinitdata =3D {
  	{ PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_DEC_TULIP_FAST,
  	  PCI_VENDOR_ID_LMC, PCI_ANY_ID },
  	{ PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_DEC_TULIP_FAST,
diff -ruN linux-2.6.17-rc2/drivers/net/wireless/airo.c linux/drivers/net/wi=
reless/airo.c
--- linux-2.6.17-rc2/drivers/net/wireless/airo.c	2006-04-24 13:31:00.000000=
000 +0200
+++ linux/drivers/net/wireless/airo.c	2006-04-26 13:38:03.000000000 +0200
@@ -51,7 +51,7 @@
  #include "airo.h"

  #ifdef CONFIG_PCI
-static struct pci_device_id card_ids[] =3D {
+static struct pci_device_id card_ids[] __devinitdata =3D {
  	{ 0x14b9, 1, PCI_ANY_ID, PCI_ANY_ID, },
  	{ 0x14b9, 0x4500, PCI_ANY_ID, PCI_ANY_ID },
  	{ 0x14b9, 0x4800, PCI_ANY_ID, PCI_ANY_ID, },
diff -ruN linux-2.6.17-rc2/drivers/net/wireless/atmel_pci.c linux/drivers/n=
et/wireless/atmel_pci.c
--- linux-2.6.17-rc2/drivers/net/wireless/atmel_pci.c	2006-03-20 06:53:29.0=
00000000 +0100
+++ linux/drivers/net/wireless/atmel_pci.c	2006-04-26 13:38:37.000000000 +0=
200
@@ -32,7 +32,7 @@
  MODULE_LICENSE("GPL");
  MODULE_SUPPORTED_DEVICE("Atmel at76c506 PCI wireless cards");

-static struct pci_device_id card_ids[] =3D {
+static struct pci_device_id card_ids[] __devinitdata =3D {
  	{ 0x1114, 0x0506, PCI_ANY_ID, PCI_ANY_ID },
  	{ 0, }
  };
diff -ruN linux-2.6.17-rc2/drivers/net/wireless/bcm43xx/bcm43xx_main.c linu=
x/drivers/net/wireless/bcm43xx/bcm43xx_main.c
--- linux-2.6.17-rc2/drivers/net/wireless/bcm43xx/bcm43xx_main.c	2006-04-24=
 13:31:00.000000000 +0200
+++ linux/drivers/net/wireless/bcm43xx/bcm43xx_main.c	2006-04-26 13:42:42.0=
00000000 +0200
@@ -124,7 +124,7 @@
  /* Detailed list maintained at:
   * http://openfacts.berlios.de/index-en.phtml?title=BCm43xxDevices
   */
-	static struct pci_device_id bcm43xx_pci_tbl[] =3D {
+	static struct pci_device_id bcm43xx_pci_tbl[] __devinitdata =3D {
  	/* Broadcom 4303 802.11b */
  	{ PCI_VENDOR_ID_BROADCOM, 0x4301, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  		/* Broadcom 4307 802.11b */
diff -ruN linux-2.6.17-rc2/drivers/net/wireless/ipw2200.c linux/drivers/net=
/wireless/ipw2200.c
--- linux-2.6.17-rc2/drivers/net/wireless/ipw2200.c	2006-04-24 13:31:00.000=
000000 +0200
+++ linux/drivers/net/wireless/ipw2200.c	2006-04-26 13:39:16.000000000 +0200
@@ -10810,7 +10810,7 @@
  }

  /* PCI driver stuff */
-static struct pci_device_id card_ids[] =3D {
+static struct pci_device_id card_ids[] __devinitdata =3D {
  	{PCI_VENDOR_ID_INTEL, 0x1043, 0x8086, 0x2701, 0, 0, 0},
  	{PCI_VENDOR_ID_INTEL, 0x1043, 0x8086, 0x2702, 0, 0, 0},
  	{PCI_VENDOR_ID_INTEL, 0x1043, 0x8086, 0x2711, 0, 0, 0},
diff -ruN linux-2.6.17-rc2/drivers/net/wireless/orinoco_nortel.c linux/driv=
ers/net/wireless/orinoco_nortel.c
--- linux-2.6.17-rc2/drivers/net/wireless/orinoco_nortel.c	2006-03-20 06:53=
:29.000000000 +0100
+++ linux/drivers/net/wireless/orinoco_nortel.c	2006-04-26 13:39:43.0000000=
00 +0200
@@ -264,7 +264,7 @@
  }


-static struct pci_device_id nortel_pci_id_table[] =3D {
+static struct pci_device_id nortel_pci_id_table[] __devinitdata =3D {
  	/* Nortel emobility PCI */
  	{0x126c, 0x8030, PCI_ANY_ID, PCI_ANY_ID,},
  	/* Symbol LA-4123 PCI */
diff -ruN linux-2.6.17-rc2/drivers/net/wireless/orinoco_pci.c linux/drivers=
/net/wireless/orinoco_pci.c
--- linux-2.6.17-rc2/drivers/net/wireless/orinoco_pci.c	2006-03-20 06:53:29=
.000000000 +0100
+++ linux/drivers/net/wireless/orinoco_pci.c	2006-04-26 13:39:59.000000000 =
+0200
@@ -347,7 +347,7 @@
  	return 0;
  }

-static struct pci_device_id orinoco_pci_pci_id_table[] =3D {
+static struct pci_device_id orinoco_pci_pci_id_table[] __devinitdata =3D {
  	/* Intersil Prism 3 */
  	{0x1260, 0x3872, PCI_ANY_ID, PCI_ANY_ID,},
  	/* Intersil Prism 2.5 */
diff -ruN linux-2.6.17-rc2/drivers/net/wireless/orinoco_plx.c linux/drivers=
/net/wireless/orinoco_plx.c
--- linux-2.6.17-rc2/drivers/net/wireless/orinoco_plx.c	2006-03-20 06:53:29=
.000000000 +0100
+++ linux/drivers/net/wireless/orinoco_plx.c	2006-04-26 13:40:29.000000000 =
+0200
@@ -344,7 +344,7 @@
  }


-static struct pci_device_id orinoco_plx_pci_id_table[] =3D {
+static struct pci_device_id orinoco_plx_pci_id_table[] __devinitdata =3D {
  	{0x111a, 0x1023, PCI_ANY_ID, PCI_ANY_ID,},	/* Siemens SpeedStream SS1023=
 */
  	{0x1385, 0x4100, PCI_ANY_ID, PCI_ANY_ID,},	/* Netgear MA301 */
  	{0x15e8, 0x0130, PCI_ANY_ID, PCI_ANY_ID,},	/* Correga  - does this work?=
 */
diff -ruN linux-2.6.17-rc2/drivers/net/wireless/orinoco_tmd.c linux/drivers=
/net/wireless/orinoco_tmd.c
--- linux-2.6.17-rc2/drivers/net/wireless/orinoco_tmd.c	2006-03-20 06:53:29=
.000000000 +0100
+++ linux/drivers/net/wireless/orinoco_tmd.c	2006-04-26 13:40:58.000000000 =
+0200
@@ -216,7 +216,7 @@
  }


-static struct pci_device_id orinoco_tmd_pci_id_table[] =3D {
+static struct pci_device_id orinoco_tmd_pci_id_table[] __devinitdata =3D {
  	{0x15e8, 0x0131, PCI_ANY_ID, PCI_ANY_ID,},      /* NDC and OEMs, e.g. ph=
eecom */
  	{0,},
  };
diff -ruN linux-2.6.17-rc2/drivers/net/wireless/prism54/islpci_hotplug.c li=
nux/drivers/net/wireless/prism54/islpci_hotplug.c
--- linux-2.6.17-rc2/drivers/net/wireless/prism54/islpci_hotplug.c	2006-04-=
24 13:31:00.000000000 +0200
+++ linux/drivers/net/wireless/prism54/islpci_hotplug.c	2006-04-26 13:41:52=
.000000000 +0200
@@ -43,7 +43,7 @@
   * driver_data
   * If you have an update for this please contact prism54-devel@prism54.org
   * The latest list can be found at http://prism54.org/supported_cards.php=
 */
-static const struct pci_device_id prism54_id_tbl[] =3D {
+static const struct pci_device_id prism54_id_tbl[] __devinitdata =3D {
  	/* Intersil PRISM Duette/Prism GT Wireless LAN adapter */
  	{
  	 0x1260, 0x3890,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
