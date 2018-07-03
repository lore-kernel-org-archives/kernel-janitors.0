From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Jul 2018 07:14:43 +0000
Subject: [PATCH] misc: genwqe: remove several redundant variables
Message-Id: <20180703071443.28921-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Haverkamp <haver@linux.vnet.ibm.com>, "Guilherme G . Piccoli" <gpiccoli@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variables val16, type, pci_dev and type are set but are never used
hence they are redundant and can be removed.

Cleans up clang warnings:
warning: variable 'type' set but not used [-Wunused-but-set-variable]
warning: variable 'val16' set but not used [-Wunused-but-set-variable]
warning: variable 'pci_dev' set but not used [-Wunused-but-set-variable]
warning: variable 'type' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/genwqe/card_debugfs.c | 4 ----
 drivers/misc/genwqe/card_dev.c     | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/drivers/misc/genwqe/card_debugfs.c b/drivers/misc/genwqe/card_debugfs.c
index f921dd590271..c6b82f09b3ba 100644
--- a/drivers/misc/genwqe/card_debugfs.c
+++ b/drivers/misc/genwqe/card_debugfs.c
@@ -305,7 +305,6 @@ GENWQE_DEBUGFS_RO(ddcb_info, genwqe_ddcb_info_show);
 static int genwqe_info_show(struct seq_file *s, void *unused)
 {
 	struct genwqe_dev *cd = s->private;
-	u16 val16, type;
 	u64 app_id, slu_id, bitstream = -1;
 	struct pci_dev *pci_dev = cd->pci_dev;
 
@@ -315,9 +314,6 @@ static int genwqe_info_show(struct seq_file *s, void *unused)
 	if (genwqe_is_privileged(cd))
 		bitstream = __genwqe_readq(cd, IO_SLU_BITSTREAM);
 
-	val16 = (u16)(slu_id & 0x0fLLU);
-	type  = (u16)((slu_id >> 20) & 0xffLLU);
-
 	seq_printf(s, "%s driver version: %s\n"
 		   "    Device Name/Type: %s %s CardIdx: %d\n"
 		   "    SLU/APP Config  : 0x%016llx/0x%016llx\n"
diff --git a/drivers/misc/genwqe/card_dev.c b/drivers/misc/genwqe/card_dev.c
index 0dd6b5ef314a..f453ab82f0d7 100644
--- a/drivers/misc/genwqe/card_dev.c
+++ b/drivers/misc/genwqe/card_dev.c
@@ -304,14 +304,12 @@ static int genwqe_open(struct inode *inode, struct file *filp)
 {
 	struct genwqe_dev *cd;
 	struct genwqe_file *cfile;
-	struct pci_dev *pci_dev;
 
 	cfile = kzalloc(sizeof(*cfile), GFP_KERNEL);
 	if (cfile = NULL)
 		return -ENOMEM;
 
 	cd = container_of(inode->i_cdev, struct genwqe_dev, cdev_genwqe);
-	pci_dev = cd->pci_dev;
 	cfile->cd = cd;
 	cfile->filp = filp;
 	cfile->client = NULL;
@@ -864,7 +862,6 @@ static int ddcb_cmd_fixups(struct genwqe_file *cfile, struct ddcb_requ *req)
 	struct genwqe_dev *cd = cfile->cd;
 	struct genwqe_ddcb_cmd *cmd = &req->cmd;
 	struct dma_mapping *m;
-	const char *type = "UNKNOWN";
 
 	for (i = 0, asiv_offs = 0x00; asiv_offs <= 0x58;
 	     i++, asiv_offs += 0x08) {
@@ -933,11 +930,9 @@ static int ddcb_cmd_fixups(struct genwqe_file *cfile, struct ddcb_requ *req)
 
 			m = genwqe_search_pin(cfile, u_addr, u_size, NULL);
 			if (m != NULL) {
-				type = "PINNING";
 				page_offs = (u_addr -
 					     (u64)m->u_vaddr)/PAGE_SIZE;
 			} else {
-				type = "MAPPING";
 				m = &req->dma_mappings[i];
 
 				genwqe_mapping_init(m,
-- 
2.17.1

