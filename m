From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Dec 2020 11:02:29 +0000
Subject: [PATCH 2/2] cifs: Unlock on errors in cifs_swn_reconnect()
Message-Id: <X9s6xZZISL/SRoZm@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <X9s6nGDLt4xreaYN@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, Samuel Cabrero <scabrero@suse.de>
Cc: Aurelien Aptel <aaptel@suse.com>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

There are three error paths which need to unlock before returning.

Fixes: 121d947d4fe1 ("cifs: Handle witness client move notification")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/cifs_swn.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/cifs/cifs_swn.c b/fs/cifs/cifs_swn.c
index b2ef082d6438..91163d3cf8b7 100644
--- a/fs/cifs/cifs_swn.c
+++ b/fs/cifs/cifs_swn.c
@@ -480,16 +480,16 @@ static int cifs_swn_store_swn_addr(const struct sockaddr_storage *new,
 
 static int cifs_swn_reconnect(struct cifs_tcon *tcon, struct sockaddr_storage *addr)
 {
+	int ret = 0;
+
 	/* Store the reconnect address */
 	mutex_lock(&tcon->ses->server->srv_mutex);
 	if (!cifs_sockaddr_equal(&tcon->ses->server->dstaddr, addr)) {
-		int ret;
-
 		ret = cifs_swn_store_swn_addr(addr, &tcon->ses->server->dstaddr,
 				&tcon->ses->server->swn_dstaddr);
 		if (ret < 0) {
 			cifs_dbg(VFS, "%s: failed to store address: %d\n", __func__, ret);
-			return ret;
+			goto unlock;
 		}
 		tcon->ses->server->use_swn_dstaddr = true;
 
@@ -500,7 +500,7 @@ static int cifs_swn_reconnect(struct cifs_tcon *tcon, struct sockaddr_storage *a
 		if (ret < 0) {
 			cifs_dbg(VFS, "%s: Failed to unregister for witness notifications: %d\n",
 					__func__, ret);
-			return ret;
+			goto unlock;
 		}
 
 		/*
@@ -511,7 +511,7 @@ static int cifs_swn_reconnect(struct cifs_tcon *tcon, struct sockaddr_storage *a
 		if (ret < 0) {
 			cifs_dbg(VFS, "%s: Failed to register for witness notifications: %d\n",
 					__func__, ret);
-			return ret;
+			goto unlock;
 		}
 
 		spin_lock(&GlobalMid_Lock);
@@ -519,9 +519,10 @@ static int cifs_swn_reconnect(struct cifs_tcon *tcon, struct sockaddr_storage *a
 			tcon->ses->server->tcpStatus = CifsNeedReconnect;
 		spin_unlock(&GlobalMid_Lock);
 	}
+unlock:
 	mutex_unlock(&tcon->ses->server->srv_mutex);
 
-	return 0;
+	return ret;
 }
 
 static int cifs_swn_client_move(struct cifs_swn_reg *swnreg, struct sockaddr_storage *addr)
-- 
2.29.2
