From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Nov 2011 07:28:31 +0000
Subject: [patch] USB: whci-hcd: fix endian conversion in qset_clear()
Message-Id: <20111122072830.GA25051@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

qset->qh.link is an __le64 field and we should be using cpu_to_le64()
to fill it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker bug.  Untested.

diff --git a/drivers/usb/host/whci/qset.c b/drivers/usb/host/whci/qset.c
index d6e1754..a403b53 100644
--- a/drivers/usb/host/whci/qset.c
+++ b/drivers/usb/host/whci/qset.c
@@ -124,7 +124,7 @@ void qset_clear(struct whc *whc, struct whc_qset *qset)
 {
 	qset->td_start = qset->td_end = qset->ntds = 0;
 
-	qset->qh.link = cpu_to_le32(QH_LINK_NTDS(8) | QH_LINK_T);
+	qset->qh.link = cpu_to_le64(QH_LINK_NTDS(8) | QH_LINK_T);
 	qset->qh.status = qset->qh.status & QH_STATUS_SEQ_MASK;
 	qset->qh.err_count = 0;
 	qset->qh.scratch[0] = 0;
