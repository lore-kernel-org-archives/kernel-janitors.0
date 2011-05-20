From: matt mooney <mfm@muteddisk.com>
Date: Fri, 20 May 2011 04:36:57 +0000
Subject: [PATCH 03/12] staging: usbip: stub_main.c: reorder functions
Message-Id: <90bf8151c9cdbd53fd40b53e1d0c9466fae815a5.1305866084.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305866084.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305866084.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Reorder functions so sysfs_ops, show() and store(), are adjacent, and
init_busid_table() is at the beginning of the file.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/stub_main.c |   48 ++++++++++++++++++------------------
 1 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/usbip/stub_main.c b/drivers/staging/usbip/stub_main.c
index 44671ee..0ca1462 100644
--- a/drivers/staging/usbip/stub_main.c
+++ b/drivers/staging/usbip/stub_main.c
@@ -35,6 +35,21 @@ struct kmem_cache *stub_priv_cache;
 static struct bus_id_priv busid_table[MAX_BUSID];
 static spinlock_t busid_table_lock;
 
+static void init_busid_table(void)
+{
+	int i;
+
+	for (i = 0; i < MAX_BUSID; i++) {
+		memset(busid_table[i].name, 0, BUSID_SIZE);
+		busid_table[i].status = STUB_BUSID_OTHER;
+		busid_table[i].interf_count = 0;
+		busid_table[i].sdev = NULL;
+		busid_table[i].shutdown_busid = 0;
+	}
+
+	spin_lock_init(&busid_table_lock);
+}
+
 int match_busid(const char *busid)
 {
 	int i;
@@ -69,21 +84,6 @@ struct bus_id_priv *get_busid_priv(const char *busid)
 	return NULL;
 }
 
-static ssize_t show_match_busid(struct device_driver *drv, char *buf)
-{
-	int i;
-	char *out = buf;
-
-	spin_lock(&busid_table_lock);
-	for (i = 0; i < MAX_BUSID; i++)
-		if (busid_table[i].name[0])
-			out += sprintf(out, "%s ", busid_table[i].name);
-	spin_unlock(&busid_table_lock);
-
-	out += sprintf(out, "\n");
-	return out - buf;
-}
-
 static int add_match_busid(char *busid)
 {
 	int i;
@@ -128,19 +128,19 @@ int del_match_busid(char *busid)
 	return -1;
 }
 
-static void init_busid_table(void)
+static ssize_t show_match_busid(struct device_driver *drv, char *buf)
 {
 	int i;
+	char *out = buf;
 
-	for (i = 0; i < MAX_BUSID; i++) {
-		memset(busid_table[i].name, 0, BUSID_SIZE);
-		busid_table[i].status = STUB_BUSID_OTHER;
-		busid_table[i].interf_count = 0;
-		busid_table[i].sdev = NULL;
-		busid_table[i].shutdown_busid = 0;
-	}
+	spin_lock(&busid_table_lock);
+	for (i = 0; i < MAX_BUSID; i++)
+		if (busid_table[i].name[0])
+			out += sprintf(out, "%s ", busid_table[i].name);
+	spin_unlock(&busid_table_lock);
 
-	spin_lock_init(&busid_table_lock);
+	out += sprintf(out, "\n");
+	return out - buf;
 }
 
 static ssize_t store_match_busid(struct device_driver *dev, const char *buf,
-- 
1.7.5.1

