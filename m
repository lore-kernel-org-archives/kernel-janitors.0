From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Oct 2010 10:25:42 +0000
Subject: [PATCH 13/14] drivers/scsi/be2iscsi/be_main.c: delete double assignment
Message-Id: <1288088743-3725-14-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jayamohan Kallickal <jayamohank@serverengines.com>
Cc: kernel-janitors@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Delete successive assignments to the same location.  Initialize the
pwrb_handle field instead of initializing the psgl_handle field twice.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression i;
@@

*i = ...;
 i = ...;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This changes the semantics and has not been tested.

 drivers/scsi/be2iscsi/be_main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
index 75a85aa..9e1878f 100644
--- a/drivers/scsi/be2iscsi/be_main.c
+++ b/drivers/scsi/be2iscsi/be_main.c
@@ -3794,7 +3794,7 @@ static int beiscsi_alloc_pdu(struct iscsi_task *task, uint8_t opcode)
 
 	task->hdr = (struct iscsi_hdr *)&io_task->cmd_bhs->iscsi_hdr;
 	task->hdr_max = sizeof(struct be_cmd_bhs);
-	io_task->psgl_handle = NULL;
+	io_task->pwrb_handle = NULL;
 	io_task->psgl_handle = NULL;
 
 	if (task->sc) {

