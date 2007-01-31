From: Stefan Huehner <stefan@huehner.org>
Date: Wed, 31 Jan 2007 20:52:57 +0000
Subject: [KJ] [PATCH] Constify several char* variables
Message-Id: <20070131205257.GE1177@pro4u.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Patch changes char* variables to const char* when they are
initialized with constant values in the source.

Signed-off-by: Stefan Huehner <stefan@huehner.org>
---
 drivers/net/3c59x.c                      |    2 +-
 drivers/net/arcnet/com20020.c            |    2 +-
 drivers/net/irda/ali-ircc.c              |    2 +-
 drivers/net/irda/nsc-ircc.c              |    4 ++--
 drivers/net/irda/via-ircc.c              |    2 +-
 drivers/net/irda/w83977af_ir.c           |    2 +-
 drivers/net/pcmcia/3c589_cs.c            |    2 +-
 drivers/net/pcmcia/fmvj18x_cs.c          |    2 +-
 drivers/net/r8169.c                      |    2 +-
 drivers/net/tokenring/olympic.c          |   22 +++++++++++-----------
 drivers/net/tokenring/tmspci.c           |    2 +-
 drivers/net/typhoon.c                    |    2 +-
 drivers/net/wan/farsync.c                |    2 +-
 drivers/net/wireless/airo.c              |    2 +-
 drivers/net/wireless/atmel.c             |   10 +++++-----
 drivers/net/wireless/hostap/hostap_ap.c  |    4 ++--
 drivers/net/wireless/hostap/hostap_cs.c  |    2 +-
 drivers/net/wireless/hostap/hostap_pci.c |    4 ++--
 drivers/net/wireless/hostap/hostap_plx.c |    4 ++--
 drivers/net/wireless/ray_cs.c            |    6 +++---
 20 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/net/3c59x.c b/drivers/net/3c59x.c
index 80bdcf8..c413e8b 100644
--- a/drivers/net/3c59x.c
+++ b/drivers/net/3c59x.c
@@ -671,7 +671,7 @@ enum xcvr_types {
 };
 
 static const struct media_table {
-	char *name;
+	const char *name;
 	unsigned int media_bits:16,		/* Bits to set in Wn4_Media register. */
 		mask:8,						/* The transceiver-present bit in Wn3_Config.*/
 		next:8;						/* The media type to try next. */
diff --git a/drivers/net/arcnet/com20020.c b/drivers/net/arcnet/com20020.c
index aa9dd8f..9db8f38 100644
--- a/drivers/net/arcnet/com20020.c
+++ b/drivers/net/arcnet/com20020.c
@@ -41,7 +41,7 @@
 
 #define VERSION "arcnet: COM20020 chipset support (by David Woodhouse et al.)\n"
 
-static char *clockrates[] +static const char *clockrates[]  {"10 Mb/s", "Reserved", "5 Mb/s",
  "2.5 Mb/s", "1.25Mb/s", "625 Kb/s", "312.5 Kb/s",
  "156.25 Kb/s", "Reserved", "Reserved", "Reserved"};
diff --git a/drivers/net/irda/ali-ircc.c b/drivers/net/irda/ali-ircc.c
index cebf8c3..d4ddeee 100644
--- a/drivers/net/irda/ali-ircc.c
+++ b/drivers/net/irda/ali-ircc.c
@@ -90,7 +90,7 @@ static ali_chip_t chips[]  static struct ali_ircc_cb *dev_self[] = { NULL, NULL, NULL, NULL };
 
 /* Dongle Types */
-static char *dongle_types[] = {
+static const char *dongle_types[] = {
 	"TFDS6000",
 	"HP HSDL-3600",
 	"HP HSDL-1100",	
diff --git a/drivers/net/irda/nsc-ircc.c b/drivers/net/irda/nsc-ircc.c
index 29b5ccd..a389fd2 100644
--- a/drivers/net/irda/nsc-ircc.c
+++ b/drivers/net/irda/nsc-ircc.c
@@ -70,7 +70,7 @@
 #define CHIP_IO_EXTENT 8
 #define BROKEN_DONGLE_ID
 
-static char *driver_name = "nsc-ircc";
+static const char *driver_name = "nsc-ircc";
 
 /* Power Management */
 #define NSC_IRCC_DRIVER_NAME                  "nsc-ircc"
@@ -126,7 +126,7 @@ static nsc_chip_t chips[] = {
 
 static struct nsc_ircc_cb *dev_self[] = { NULL, NULL, NULL, NULL, NULL };
 
-static char *dongle_types[] = {
+static const char *dongle_types[] = {
 	"Differential serial interface",
 	"Differential serial interface",
 	"Reserved",
diff --git a/drivers/net/irda/via-ircc.c b/drivers/net/irda/via-ircc.c
index c3ed9b3..ac04795 100644
--- a/drivers/net/irda/via-ircc.c
+++ b/drivers/net/irda/via-ircc.c
@@ -66,7 +66,7 @@ F02 Oct/28/02: Add SB device ID for 3147 and 3177.
 #define VIA_MODULE_NAME "via-ircc"
 #define CHIP_IO_EXTENT 0x40
 
-static char *driver_name = VIA_MODULE_NAME;
+static const char *driver_name = VIA_MODULE_NAME;
 
 /* Module parameters */
 static int qos_mtt_bits = 0x07;	/* 1 ms or more */
diff --git a/drivers/net/irda/w83977af_ir.c b/drivers/net/irda/w83977af_ir.c
index 4212657..6f8c567 100644
--- a/drivers/net/irda/w83977af_ir.c
+++ b/drivers/net/irda/w83977af_ir.c
@@ -69,7 +69,7 @@
 #define CONFIG_USE_W977_PNP        /* Currently needed */
 #define PIO_MAX_SPEED       115200 
 
-static char *driver_name = "w83977af_ir";
+static const char *driver_name = "w83977af_ir";
 static int  qos_mtt_bits = 0x07;   /* 1 ms or more */
 
 #define CHIP_IO_EXTENT 8
diff --git a/drivers/net/pcmcia/3c589_cs.c b/drivers/net/pcmcia/3c589_cs.c
index 461e827..e6e21a8 100644
--- a/drivers/net/pcmcia/3c589_cs.c
+++ b/drivers/net/pcmcia/3c589_cs.c
@@ -255,7 +255,7 @@ static int tc589_config(struct pcmcia_device *link)
     u16 buf[32], *phys_addr;
     int last_fn, last_ret, i, j, multi = 0, fifo;
     kio_addr_t ioaddr;
-    char *ram_split[] = {"5:3", "3:1", "1:1", "3:5"};
+    const char *ram_split[] = {"5:3", "3:1", "1:1", "3:5"};
     
     DEBUG(0, "3c589_config(0x%p)\n", link);
 
diff --git a/drivers/net/pcmcia/fmvj18x_cs.c b/drivers/net/pcmcia/fmvj18x_cs.c
index 0d7de61..0eedfe8 100644
--- a/drivers/net/pcmcia/fmvj18x_cs.c
+++ b/drivers/net/pcmcia/fmvj18x_cs.c
@@ -345,7 +345,7 @@ static int fmvj18x_config(struct pcmcia_device *link)
     int i, last_fn = 0, last_ret = 0, ret;
     kio_addr_t ioaddr;
     cardtype_t cardtype;
-    char *card_name = "unknown";
+    const char *card_name = "unknown";
     u_char *node_id;
 
     DEBUG(0, "fmvj18x_config(0x%p)\n", link);
diff --git a/drivers/net/r8169.c b/drivers/net/r8169.c
index 577babd..19e8630 100644
--- a/drivers/net/r8169.c
+++ b/drivers/net/r8169.c
@@ -1215,7 +1215,7 @@ static void rtl8169_print_phy_version(struct rtl8169_private *tp)
 {
 	struct {
 		int version;
-		char *msg;
+		const char *msg;
 		u32 reg;
 	} phy_print[] = {
 		{ RTL_GIGA_PHY_VER_G, "RTL_GIGA_PHY_VER_G", 0x0002 },
diff --git a/drivers/net/tokenring/olympic.c b/drivers/net/tokenring/olympic.c
index 8f4ecc1..4d77e1e 100644
--- a/drivers/net/tokenring/olympic.c
+++ b/drivers/net/tokenring/olympic.c
@@ -119,17 +119,17 @@
 static char version[] __devinitdata = 
 "Olympic.c v1.0.5 6/04/02 - Peter De Schrijver & Mike Phillips" ; 
 
-static char *open_maj_error[]  = {"No error", "Lobe Media Test", "Physical Insertion",
-				   "Address Verification", "Neighbor Notification (Ring Poll)",
-				   "Request Parameters","FDX Registration Request",
-				   "FDX Duplicate Address Check", "Station registration Query Wait",
-				   "Unknown stage"};
-
-static char *open_min_error[] = {"No error", "Function Failure", "Signal Lost", "Wire Fault",
-				   "Ring Speed Mismatch", "Timeout","Ring Failure","Ring Beaconing",
-				   "Duplicate Node Address","Request Parameters","Remove Received",
-				   "Reserved", "Reserved", "No Monitor Detected for RPL", 
-				   "Monitor Contention failer for RPL", "FDX Protocol Error"};
+static const char *open_maj_error[]  = {"No error", "Lobe Media Test", "Physical Insertion",
+					 "Address Verification", "Neighbor Notification (Ring Poll)",
+					 "Request Parameters","FDX Registration Request",
+					 "FDX Duplicate Address Check", "Station registration Query Wait",
+					 "Unknown stage"};
+
+static const char *open_min_error[] = {"No error", "Function Failure", "Signal Lost", "Wire Fault",
+					"Ring Speed Mismatch", "Timeout","Ring Failure","Ring Beaconing",
+					"Duplicate Node Address","Request Parameters","Remove Received",
+					"Reserved", "Reserved", "No Monitor Detected for RPL", 
+					"Monitor Contention failer for RPL", "FDX Protocol Error"};
 
 /* Module paramters */
 
diff --git a/drivers/net/tokenring/tmspci.c b/drivers/net/tokenring/tmspci.c
index 3b2f00b..ab5cdb9 100644
--- a/drivers/net/tokenring/tmspci.c
+++ b/drivers/net/tokenring/tmspci.c
@@ -47,7 +47,7 @@ static char version[] __devinitdata  
 struct card_info {
 	unsigned char nselout[2]; /* NSELOUT vals for 4mb([0]) and 16mb([1]) */
-	char *name;
+	const char *name;
 };
 
 static struct card_info card_info_table[] = {
diff --git a/drivers/net/typhoon.c b/drivers/net/typhoon.c
index 9781b16..295dfea 100644
--- a/drivers/net/typhoon.c
+++ b/drivers/net/typhoon.c
@@ -159,7 +159,7 @@ module_param(use_mmio, int, 0);
 #endif
 
 struct typhoon_card_info {
-	char *name;
+	const char *name;
 	int capabilities;
 };
 
diff --git a/drivers/net/wan/farsync.c b/drivers/net/wan/farsync.c
index c45d6a8..aee7242 100644
--- a/drivers/net/wan/farsync.c
+++ b/drivers/net/wan/farsync.c
@@ -2396,7 +2396,7 @@ fst_start_xmit(struct sk_buff *skb, struct net_device *dev)
  *      via a printk and leave the corresponding interface and all that follow
  *      disabled.
  */
-static char *type_strings[] __devinitdata = {
+static const char *type_strings[] __devinitdata = {
 	"no hardware",		/* Should never be seen */
 	"FarSync T2P",
 	"FarSync T4P",
diff --git a/drivers/net/wireless/airo.c b/drivers/net/wireless/airo.c
index 44a2270..6d8a9ee 100644
--- a/drivers/net/wireless/airo.c
+++ b/drivers/net/wireless/airo.c
@@ -101,7 +101,7 @@ static struct pci_driver airo_driver = {
    of statistics in the /proc filesystem */
 
 #define IGNLABEL(comment) NULL
-static char *statsLabels[] = {
+static const char *statsLabels[] = {
 	"RxOverrun",
 	IGNLABEL("RxPlcpCrcErr"),
 	IGNLABEL("RxPlcpFormatErr"),
diff --git a/drivers/net/wireless/atmel.c b/drivers/net/wireless/atmel.c
index 10bcb48..6480447 100644
--- a/drivers/net/wireless/atmel.c
+++ b/drivers/net/wireless/atmel.c
@@ -547,7 +547,7 @@ static u8 atmel_basic_rates[4] = {0x82,0x84,0x0b,0x16};
 static const struct {
 	int reg_domain;
 	int min, max;
-	char *name;
+	const char *name;
 } channel_table[] = { { REG_DOMAIN_FCC, 1, 11, "USA" },
 		      { REG_DOMAIN_DOC, 1, 11, "Canada" },
 		      { REG_DOMAIN_ETSI, 1, 13, "Europe" },
@@ -1408,7 +1408,7 @@ static int atmel_proc_output (char *buf, struct atmel_private *priv)
 {
 	int i;
 	char *p = buf;
-	char *s, *r, *c;
+	const char *s, *r, *c;
 
 	p += sprintf(p, "Driver version:\t\t%d.%d\n",
 		     DRIVER_MAJOR, DRIVER_MINOR);
@@ -2655,10 +2655,10 @@ static int atmel_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 		rc = -EINVAL;
 		for (i = 0; i < ARRAY_SIZE(channel_table); i++) {
 			/* strcasecmp doesn't exist in the library */
-			char *a = channel_table[i].name;
+			const char *a = channel_table[i].name;
 			char *b = domain;
 			while (*a) {
-				char c1 = *a++;
+				const char c1 = *a++;
 				char c2 = *b++;
 				if (tolower(c1) != tolower(c2))
 					break;
@@ -3842,7 +3842,7 @@ static int reset_atmel_card(struct net_device *dev)
 	/* data to add to the firmware names, in priority order
 	   this implemenents firmware versioning */
 
-	static char *firmware_modifier[] = {
+	static const char *firmware_modifier[] = {
 		"-wpa",
 		"",
 		NULL
diff --git a/drivers/net/wireless/hostap/hostap_ap.c b/drivers/net/wireless/hostap/hostap_ap.c
index efb8cf3..1bd4ed9 100644
--- a/drivers/net/wireless/hostap/hostap_ap.c
+++ b/drivers/net/wireless/hostap/hostap_ap.c
@@ -1298,7 +1298,7 @@ static void handle_authen(local_info_t *local, struct sk_buff *skb,
 	u16 resp = WLAN_STATUS_SUCCESS, fc;
 	struct sta_info *sta = NULL;
 	struct ieee80211_crypt_data *crypt;
-	char *txt = "";
+	const char *txt = "";
 
 	len = skb->len - IEEE80211_MGMT_HDR_LEN;
 
@@ -1509,7 +1509,7 @@ static void handle_assoc(local_info_t *local, struct sk_buff *skb,
 	u16 resp = WLAN_STATUS_SUCCESS;
 	struct sta_info *sta = NULL;
 	int send_deauth = 0;
-	char *txt = "";
+	const char *txt = "";
 	u8 prev_ap[ETH_ALEN];
 
 	left = len = skb->len - IEEE80211_MGMT_HDR_LEN;
diff --git a/drivers/net/wireless/hostap/hostap_cs.c b/drivers/net/wireless/hostap/hostap_cs.c
index 8d8f4b9..e24c816 100644
--- a/drivers/net/wireless/hostap/hostap_cs.c
+++ b/drivers/net/wireless/hostap/hostap_cs.c
@@ -22,7 +22,7 @@
 #include "hostap_wlan.h"
 
 
-static char *version = PRISM2_VERSION " (Jouni Malinen <jkmaline@cc.hut.fi>)";
+static const char *version = PRISM2_VERSION " (Jouni Malinen <jkmaline@cc.hut.fi>)";
 static dev_info_t dev_info = "hostap_cs";
 
 MODULE_AUTHOR("Jouni Malinen");
diff --git a/drivers/net/wireless/hostap/hostap_pci.c b/drivers/net/wireless/hostap/hostap_pci.c
index c4f6020..4b400da 100644
--- a/drivers/net/wireless/hostap/hostap_pci.c
+++ b/drivers/net/wireless/hostap/hostap_pci.c
@@ -20,8 +20,8 @@
 #include "hostap_wlan.h"
 
 
-static char *version = PRISM2_VERSION " (Jouni Malinen <jkmaline@cc.hut.fi>)";
-static char *dev_info = "hostap_pci";
+static const char *version = PRISM2_VERSION " (Jouni Malinen <jkmaline@cc.hut.fi>)";
+static const char *dev_info = "hostap_pci";
 
 
 MODULE_AUTHOR("Jouni Malinen");
diff --git a/drivers/net/wireless/hostap/hostap_plx.c b/drivers/net/wireless/hostap/hostap_plx.c
index e235e06..59208f4 100644
--- a/drivers/net/wireless/hostap/hostap_plx.c
+++ b/drivers/net/wireless/hostap/hostap_plx.c
@@ -23,8 +23,8 @@
 #include "hostap_wlan.h"
 
 
-static char *version = PRISM2_VERSION " (Jouni Malinen <jkmaline@cc.hut.fi>)";
-static char *dev_info = "hostap_plx";
+static const char *version = PRISM2_VERSION " (Jouni Malinen <jkmaline@cc.hut.fi>)";
+static const char *dev_info = "hostap_plx";
 
 
 MODULE_AUTHOR("Jouni Malinen");
diff --git a/drivers/net/wireless/ray_cs.c b/drivers/net/wireless/ray_cs.c
index 47b2ccb..dbc6b38 100644
--- a/drivers/net/wireless/ray_cs.c
+++ b/drivers/net/wireless/ray_cs.c
@@ -2578,7 +2578,7 @@ static void clear_interrupt(ray_dev_t *local)
 #ifdef CONFIG_PROC_FS
 #define MAXDATA (PAGE_SIZE - 80)
 
-static char *card_status[] = {
+static const char *card_status[] = {
     "Card inserted - uninitialized",     /* 0 */
     "Card not downloaded",               /* 1 */
     "Waiting for download parameters",   /* 2 */
@@ -2595,8 +2595,8 @@ static char *card_status[] = {
     "Association failed"                 /* 16 */
 };
 
-static char *nettype[] = {"Adhoc", "Infra "};
-static char *framing[] = {"Encapsulation", "Translation"}
+static const char *nettype[] = {"Adhoc", "Infra "};
+static const char *framing[] = {"Encapsulation", "Translation"}
 ;
 /*======================================*/
 static int ray_cs_proc_read(char *buf, char **start, off_t offset, int len)
-- 
1.4.4.4

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
