From: Colin King <colin.king@canonical.com>
Date: Wed, 29 Aug 2018 15:53:50 +0000
Subject: [PATCH] char: agp: remove several redundant variables
Message-Id: <20180829155350.1713-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Several variables are being assigned but never used hence they
are redundant and can be removed.

Cleans up clang warnings:
variable 'num_segments' set but not used [-Wunused-but-set-variable]
variable 'arqsz' set but not used [-Wunused-but-set-variable]
variable 'mcapndx' set but not used [-Wunused-but-set-variable]
variable 'current_size' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/agp/frontend.c | 3 +--
 drivers/char/agp/isoch.c    | 9 +--------
 drivers/char/agp/via-agp.c  | 3 ---
 3 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/char/agp/frontend.c b/drivers/char/agp/frontend.c
index f6955888e676..47098648502d 100644
--- a/drivers/char/agp/frontend.c
+++ b/drivers/char/agp/frontend.c
@@ -102,14 +102,13 @@ agp_segment_priv *agp_find_seg_in_client(const struct agp_client *client,
 					    int size, pgprot_t page_prot)
 {
 	struct agp_segment_priv *seg;
-	int num_segments, i;
+	int i;
 	off_t pg_start;
 	size_t pg_count;
 
 	pg_start = offset / 4096;
 	pg_count = size / 4096;
 	seg = *(client->segments);
-	num_segments = client->num_segments;
 
 	for (i = 0; i < client->num_segments; i++) {
 		if ((seg[i].pg_start = pg_start) &&
diff --git a/drivers/char/agp/isoch.c b/drivers/char/agp/isoch.c
index 31c374b1b91b..7ecf20a6d19c 100644
--- a/drivers/char/agp/isoch.c
+++ b/drivers/char/agp/isoch.c
@@ -84,7 +84,6 @@ static int agp_3_5_isochronous_node_enable(struct agp_bridge_data *bridge,
 	unsigned int cdev = 0;
 	u32 mnistat, tnistat, tstatus, mcmd;
 	u16 tnicmd, mnicmd;
-	u8 mcapndx;
 	u32 tot_bw = 0, tot_n = 0, tot_rq = 0, y_max, rq_isoch, rq_async;
 	u32 step, rem, rem_isoch, rem_async;
 	int ret = 0;
@@ -138,8 +137,6 @@ static int agp_3_5_isochronous_node_enable(struct agp_bridge_data *bridge,
 		cur = list_entry(pos, struct agp_3_5_dev, list);
 		dev = cur->dev;
 
-		mcapndx = cur->capndx;
-
 		pci_read_config_dword(dev, cur->capndx+AGPNISTAT, &mnistat);
 
 		master[cdev].maxbw = (mnistat >> 16) & 0xff;
@@ -251,8 +248,6 @@ static int agp_3_5_isochronous_node_enable(struct agp_bridge_data *bridge,
 		cur = master[cdev].dev;
 		dev = cur->dev;
 
-		mcapndx = cur->capndx;
-
 		master[cdev].rq += (cdev = ndevs - 1)
 		              ? (rem_async + rem_isoch) : step;
 
@@ -319,7 +314,7 @@ int agp_3_5_enable(struct agp_bridge_data *bridge)
 {
 	struct pci_dev *td = bridge->dev, *dev = NULL;
 	u8 mcapndx;
-	u32 isoch, arqsz;
+	u32 isoch;
 	u32 tstatus, mstatus, ncapid;
 	u32 mmajor;
 	u16 mpstat;
@@ -334,8 +329,6 @@ int agp_3_5_enable(struct agp_bridge_data *bridge)
 	if (isoch = 0)	/* isoch xfers not available, bail out. */
 		return -ENODEV;
 
-	arqsz     = (tstatus >> 13) & 0x7;
-
 	/*
 	 * Allocate a head for our AGP 3.5 device list
 	 * (multiple AGP v3 devices are allowed behind a single bridge).
diff --git a/drivers/char/agp/via-agp.c b/drivers/char/agp/via-agp.c
index a4961d35e940..48cbea8d5c7a 100644
--- a/drivers/char/agp/via-agp.c
+++ b/drivers/char/agp/via-agp.c
@@ -127,9 +127,6 @@ static int via_fetch_size_agp3(void)
 static int via_configure_agp3(void)
 {
 	u32 temp;
-	struct aper_size_info_16 *current_size;
-
-	current_size = A_SIZE_16(agp_bridge->current_size);
 
 	/* address to map to */
 	agp_bridge->gart_bus_addr = pci_bus_address(agp_bridge->dev,
-- 
2.17.1
