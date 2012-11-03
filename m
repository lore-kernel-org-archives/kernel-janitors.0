From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 03 Nov 2012 10:58:26 +0000
Subject: [PATCH 5/16] drivers/scsi: use WARN
Message-Id: <1351940317-14812-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use WARN rather than printk followed by WARN_ON(1), for conciseness.

A simplified version of the semantic patch that makes this transformation
is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression list es;
@@

-printk(
+WARN(1,
  es);
-WARN_ON(1);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/scsi/initio.c   |    3 +--
 drivers/scsi/scsi_lib.c |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/initio.c b/drivers/scsi/initio.c
index dd741bc..1572860 100644
--- a/drivers/scsi/initio.c
+++ b/drivers/scsi/initio.c
@@ -2774,8 +2774,7 @@ static void i91uSCBPost(u8 * host_mem, u8 * cblk_mem)
 	host = (struct initio_host *) host_mem;
 	cblk = (struct scsi_ctrl_blk *) cblk_mem;
 	if ((cmnd = cblk->srb) = NULL) {
-		printk(KERN_ERR "i91uSCBPost: SRB pointer is empty\n");
-		WARN_ON(1);
+		WARN(1, KERN_ERR "i91uSCBPost: SRB pointer is empty\n");
 		initio_release_scb(host, cblk);	/* Release SCB for current channel */
 		return;
 	}
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index da36a3a..e5fdcae 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -2573,10 +2573,9 @@ void *scsi_kmap_atomic_sg(struct scatterlist *sgl, int sg_count,
 	}
 
 	if (unlikely(i = sg_count)) {
-		printk(KERN_ERR "%s: Bytes in sg: %zu, requested offset %zu, "
+		WARN(1, KERN_ERR "%s: Bytes in sg: %zu, requested offset %zu, "
 			"elements %d\n",
 		       __func__, sg_len, *offset, sg_count);
-		WARN_ON(1);
 		return NULL;
 	}
 

