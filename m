From: Domen Puncer <domen@coderock.org>
Date: Tue, 16 Nov 2004 18:10:44 +0000
Subject: [KJ] [patch] net/3c59x: module_param conversions
Message-Id: <20041116181044.GA8698@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98973816821962102=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98973816821962102==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert 3c59x.c to new module parameter api.
Variables are moved before module_param*.

Compile and run tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/net/3c59x.c	2004-11-15 13:42:11.000000000 +0100
+++ a/drivers/net/3c59x.c	2004-11-16 13:33:30.000000000 +0100
@@ -273,26 +273,48 @@ static int vortex_debug = 1;
 static char version[] __devinitdata =
 DRV_NAME ": Donald Becker and others. www.scyld.com/network/vortex.html\n";
 
+
+/* This driver uses 'options' to pass the media type, full-duplex flag, etc. */
+/* Option count limit only -- unlimited interfaces are supported. */
+#define MAX_UNITS 8
+static int options[MAX_UNITS] = { -1, -1, -1, -1, -1, -1, -1, -1,};
+static int full_duplex[MAX_UNITS] = {-1, -1, -1, -1, -1, -1, -1, -1};
+static int hw_checksums[MAX_UNITS] = {-1, -1, -1, -1, -1, -1, -1, -1};
+static int flow_ctrl[MAX_UNITS] = {-1, -1, -1, -1, -1, -1, -1, -1};
+static int enable_wol[MAX_UNITS] = {-1, -1, -1, -1, -1, -1, -1, -1};
+static int global_options = -1;
+static int global_full_duplex = -1;
+static int global_enable_wol = -1;
+
+/* #define dev_alloc_skb dev_alloc_skb_debug */
+
+/* Variables to work-around the Compaq PCI BIOS32 problem. */
+static int compaq_ioaddr, compaq_irq, compaq_device_id = 0x5900;
+static struct net_device *compaq_net_device;
+
+static int vortex_cards_found;
+
+
 MODULE_AUTHOR("Donald Becker <becker@scyld.com>");
 MODULE_DESCRIPTION("3Com 3c59x/3c9xx ethernet driver "
 					DRV_VERSION " " DRV_RELDATE);
 MODULE_LICENSE("GPL");
 
-MODULE_PARM(debug, "i");
-MODULE_PARM(global_options, "i");
-MODULE_PARM(options, "1-" __MODULE_STRING(8) "i");
-MODULE_PARM(global_full_duplex, "i");
-MODULE_PARM(full_duplex, "1-" __MODULE_STRING(8) "i");
-MODULE_PARM(hw_checksums, "1-" __MODULE_STRING(8) "i");
-MODULE_PARM(flow_ctrl, "1-" __MODULE_STRING(8) "i");
-MODULE_PARM(global_enable_wol, "i");
-MODULE_PARM(enable_wol, "1-" __MODULE_STRING(8) "i");
-MODULE_PARM(rx_copybreak, "i");
-MODULE_PARM(max_interrupt_work, "i");
-MODULE_PARM(compaq_ioaddr, "i");
-MODULE_PARM(compaq_irq, "i");
-MODULE_PARM(compaq_device_id, "i");
-MODULE_PARM(watchdog, "i");
+module_param(debug, int, 0644);
+module_param(global_options, int, 0);
+module_param_array(options, int, NULL, 0);
+module_param(global_full_duplex, int, 0);
+module_param_array(full_duplex, int, NULL, 0);
+module_param_array(hw_checksums, int, NULL, 0);
+module_param_array(flow_ctrl, int, NULL, 0);
+module_param(global_enable_wol, int, 0);
+module_param_array(enable_wol, int, NULL, 0);
+module_param(rx_copybreak, int, 0);
+module_param(max_interrupt_work, int, 0);
+module_param(compaq_ioaddr, int, 0);
+module_param(compaq_irq, int, 0);
+module_param(compaq_device_id, int, 0);
+module_param(watchdog, int, 0);
 MODULE_PARM_DESC(debug, "3c59x debug level (0-6)");
 MODULE_PARM_DESC(options, "3c59x: Bits 0-3: media type, bit 4: bus mastering, bit 9: full duplex");
 MODULE_PARM_DESC(global_options, "3c59x: same as options, but applies to all NICs if options is unset");
@@ -909,26 +931,6 @@ static void acpi_set_WOL(struct net_devi
 static struct ethtool_ops vortex_ethtool_ops;
 static void set_8021q_mode(struct net_device *dev, int enable);
 
-
-/* This driver uses 'options' to pass the media type, full-duplex flag, etc. */
-/* Option count limit only -- unlimited interfaces are supported. */
-#define MAX_UNITS 8
-static int options[MAX_UNITS] = { -1, -1, -1, -1, -1, -1, -1, -1,};
-static int full_duplex[MAX_UNITS] = {-1, -1, -1, -1, -1, -1, -1, -1};
-static int hw_checksums[MAX_UNITS] = {-1, -1, -1, -1, -1, -1, -1, -1};
-static int flow_ctrl[MAX_UNITS] = {-1, -1, -1, -1, -1, -1, -1, -1};
-static int enable_wol[MAX_UNITS] = {-1, -1, -1, -1, -1, -1, -1, -1};
-static int global_options = -1;
-static int global_full_duplex = -1;
-static int global_enable_wol = -1;
-
-/* #define dev_alloc_skb dev_alloc_skb_debug */
-
-/* Variables to work-around the Compaq PCI BIOS32 problem. */
-static int compaq_ioaddr, compaq_irq, compaq_device_id = 0x5900;
-static struct net_device *compaq_net_device;
-
-static int vortex_cards_found;
 
 #ifdef CONFIG_NET_POLL_CONTROLLER
 static void poll_vortex(struct net_device *dev)

--===============98973816821962102==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98973816821962102==--
