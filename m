From: Colin King <colin.king@canonical.com>
Date: Fri, 09 Feb 2018 11:59:36 +0000
Subject: [PATCH] CIFS: SMBD: fix spelling mistake: "faield" -> "failed"
Message-Id: <20180209115936.32569-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in log_rdma_mr message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/cifs/smbdirect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index 91710eb571fb..5405856a4c8e 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -2295,7 +2295,7 @@ static void smbd_mr_recovery_work(struct work_struct *work)
 				rc = ib_dereg_mr(smbdirect_mr->mr);
 				if (rc) {
 					log_rdma_mr(ERR,
-						"ib_dereg_mr faield rc=%x\n",
+						"ib_dereg_mr failed rc=%x\n",
 						rc);
 					smbd_disconnect_rdma_connection(info);
 				}
-- 
2.15.1

