From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Dec 2020 11:01:48 +0000
Subject: [PATCH 1/3] cifs: Delete a stray unlock in cifs_swn_reconnect()
Message-Id: <X9s6nGDLt4xreaYN@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>
Cc: Aurelien Aptel <aaptel@suse.com>, Samuel Cabrero <scabrero@suse.de>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The unlock is done in the caller, this is a stray which leads to a
double unlock bug.

Fixes: bf80e5d4259a ("cifs: Send witness register and unregister commands to userspace daemon")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/cifs_swn.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/cifs/cifs_swn.c b/fs/cifs/cifs_swn.c
index c594e588a8b5..b2ef082d6438 100644
--- a/fs/cifs/cifs_swn.c
+++ b/fs/cifs/cifs_swn.c
@@ -285,8 +285,6 @@ static struct cifs_swn_reg *cifs_find_swn_reg(struct cifs_tcon *tcon)
 			continue;
 		}
 
-		mutex_unlock(&cifs_swnreg_idr_mutex);
-
 		cifs_dbg(FYI, "Existing swn registration for %s:%s found\n", swnreg->net_name,
 				swnreg->share_name);
 
-- 
2.29.2
