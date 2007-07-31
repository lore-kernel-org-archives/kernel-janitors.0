From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:03:51 +0000
Subject: [PATCH 07] drivers/block/cciss.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311903.52301.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, iss_storagedev@hp.com, axboe@kernel.dk

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/block/cciss.c | 104285 -> 104168 (-117 bytes)
 drivers/block/cciss.o | 277400 -> 277124 (-276 bytes)

 drivers/block/cciss.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/block/cciss.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/block/cciss.c	2007-07-31 12:57:50.000000000 +0200
@@ -1977,12 +1977,13 @@ cciss_read_capacity(int ctlr, int logvol
 {
 	ReadCapdata_struct *buf;
 	int return_code;
-	buf = kmalloc(sizeof(ReadCapdata_struct), GFP_KERNEL);
-	if (buf = NULL) {
+
+	buf = kzalloc(sizeof(ReadCapdata_struct), GFP_KERNEL);
+	if (!buf) {
 		printk(KERN_WARNING "cciss: out of memory\n");
 		return;
 	}
-	memset(buf, 0, sizeof(ReadCapdata_struct));
+
 	if (withirq)
 		return_code = sendcmd_withirq(CCISS_READ_CAPACITY,
 				ctlr, buf, sizeof(ReadCapdata_struct),
@@ -2003,7 +2004,6 @@ cciss_read_capacity(int ctlr, int logvol
 		printk(KERN_INFO "      blocks= %llu block_size= %d\n",
 		(unsigned long long)*total_size+1, *block_size);
 	kfree(buf);
-	return;
 }

 static void
@@ -2011,12 +2011,13 @@ cciss_read_capacity_16(int ctlr, int log
 {
 	ReadCapdata_struct_16 *buf;
 	int return_code;
-	buf = kmalloc(sizeof(ReadCapdata_struct_16), GFP_KERNEL);
-	if (buf = NULL) {
+
+	buf = kzalloc(sizeof(ReadCapdata_struct_16), GFP_KERNEL);
+	if (!buf) {
 		printk(KERN_WARNING "cciss: out of memory\n");
 		return;
 	}
-	memset(buf, 0, sizeof(ReadCapdata_struct_16));
+
 	if (withirq) {
 		return_code = sendcmd_withirq(CCISS_READ_CAPACITY_16,
 			ctlr, buf, sizeof(ReadCapdata_struct_16),
@@ -2038,7 +2039,6 @@ cciss_read_capacity_16(int ctlr, int log
 	printk(KERN_INFO "      blocks= %llu block_size= %d\n",
 	       (unsigned long long)*total_size+1, *block_size);
 	kfree(buf);
-	return;
 }

 static int cciss_revalidate(struct gendisk *disk)
