From: Julia Lawall <julia@diku.dk>
Date: Tue, 16 Dec 2008 15:15:08 +0000
Subject: [PATCH 9/11] drivers/scsi: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0812161614500.20444@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@HansenPartnership.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In each case, if the NULL test is necessary, then the dereference should be
moved below the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/lpfc/lpfc_init.c       |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 909be33..9a01cf0 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -1736,12 +1736,13 @@ lpfc_block_mgmt_io(struct lpfc_hba * phba)
 int
 lpfc_online(struct lpfc_hba *phba)
 {
-	struct lpfc_vport *vport = phba->pport;
+	struct lpfc_vport *vport;
 	struct lpfc_vport **vports;
 	int i;
 
 	if (!phba)
 		return 0;
+	vport = phba->pport;
 
 	if (!(vport->fc_flag & FC_OFFLINE_MODE))
 		return 0;
