From: Dan Carpenter <error27@gmail.com>
Date: Fri, 13 Aug 2010 21:03:50 +0000
Subject: [patch] qla4xxx: initialize some variables for gcc
Message-Id: <20100813210350.GT645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ravi Anand <ravi.anand@qlogic.com>
Cc: Vikas Chaudhary <vikas.chaudhary@qlogic.com>, iscsi-driver@qlogic.com, "James E.J. Bottomley" <James.Bottomley@suse.de>, Karen Higgins <karen.higgins@qlogic.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Gcc complains because these variables aren't initialized.

drivers/scsi/qla4xxx/ql4_nx.c: In function ‘qla4_8xxx_get_flash_info’:
drivers/scsi/qla4xxx/ql4_nx.c:1952: warning: ‘fid’ may be used uninitialized in this function
drivers/scsi/qla4xxx/ql4_nx.c:1952: note: ‘fid’ was declared here
drivers/scsi/qla4xxx/ql4_nx.c:1952: warning: ‘mid’ may be used uninitialized in this function
drivers/scsi/qla4xxx/ql4_nx.c:1952: note: ‘mid’ was declared here

It's not a big deal.  We only print the uninitialized value on error
paths when debugging is enabled.  Still it's nice to clean it up and to
stop gcc from grumbling.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/scsi/qla4xxx/ql4_nx.c b/drivers/scsi/qla4xxx/ql4_nx.c
index 3e119ae..e443fa6 100644
--- a/drivers/scsi/qla4xxx/ql4_nx.c
+++ b/drivers/scsi/qla4xxx/ql4_nx.c
@@ -1949,7 +1949,8 @@ qla4_8xxx_get_fdt_info(struct scsi_qla_host *ha)
 	uint16_t cnt, chksum;
 	uint16_t *wptr;
 	struct qla_fdt_layout *fdt;
-	uint16_t mid, fid;
+	uint16_t mid = -1;
+	uint16_t fid = -1;
 	struct ql82xx_hw_data *hw = &ha->hw;
 
 	hw->flash_conf_off = FARX_ACCESS_FLASH_CONF;
