From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 01 Mar 2014 13:51:36 +0000
Subject: [patch] [media] av7110_hw: fix a sanity check in av7110_fw_cmd()
Message-Id: <20140301135136.GA23929@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

ARRAY_SIZE(buf) (8 elements) was intended instead of sizeof(buf) (16
bytes).  But this is just a sanity check and the callers always pass
valid values so this doesn't cause a problem.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/pci/ttpci/av7110_hw.c b/drivers/media/pci/ttpci/av7110_hw.c
index 6299d5dadb82..300bd3c94738 100644
--- a/drivers/media/pci/ttpci/av7110_hw.c
+++ b/drivers/media/pci/ttpci/av7110_hw.c
@@ -501,7 +501,7 @@ int av7110_fw_cmd(struct av7110 *av7110, int type, int com, int num, ...)
 
 //	dprintk(4, "%p\n", av7110);
 
-	if (2 + num > sizeof(buf)) {
+	if (2 + num > ARRAY_SIZE(buf)) {
 		printk(KERN_WARNING
 		       "%s: %s len=%d is too big!\n",
 		       KBUILD_MODNAME, __func__, num);
