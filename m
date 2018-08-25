From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 25 Aug 2018 17:16:42 +0000
Subject: [PATCH] scsi: libiscsi: Fix an error handling path in 'iscsi_session_setup()'
Message-Id: <20180825171642.29010-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lduncan-IBi9RG/b67k@public.gmane.org, cleech-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jejb-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, martin.petersen-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Cc: open-iscsi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>

All error handling paths in this function go through
'iscsi_host_dec_session_cnt()' except this one.
Fix it and properly decrement the number of active sessions in such a case.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/libiscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/libiscsi.c b/drivers/scsi/libiscsi.c
index 93c66ebad907..1fa7d6b77761 100644
--- a/drivers/scsi/libiscsi.c
+++ b/drivers/scsi/libiscsi.c
@@ -2803,7 +2803,7 @@ iscsi_session_setup(struct iscsi_transport *iscsit, struct Scsi_Host *shost,
 		       "must be a power of 2.\n", total_cmds);
 		total_cmds = rounddown_pow_of_two(total_cmds);
 		if (total_cmds < ISCSI_TOTAL_CMDS_MIN)
-			return NULL;
+			goto dec_session_count;
 		printk(KERN_INFO "iscsi: Rounding can_queue to %d.\n",
 		       total_cmds);
 	}
-- 
2.17.1
