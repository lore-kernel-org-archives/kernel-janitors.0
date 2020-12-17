From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Dec 2020 11:03:35 +0000
Subject: [PATCH 3/3] cifs: Re-indent cifs_swn_reconnect()
Message-Id: <X9s7By4IDIcG4D+w@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <X9s6nGDLt4xreaYN@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, Samuel Cabrero <scabrero@suse.de>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

This code is slightly nicer if we flip the cifs_sockaddr_equal()
around and pull all the code in one tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/cifs_swn.c | 64 ++++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/fs/cifs/cifs_swn.c b/fs/cifs/cifs_swn.c
index 91163d3cf8b7..d35f599aa00e 100644
--- a/fs/cifs/cifs_swn.c
+++ b/fs/cifs/cifs_swn.c
@@ -484,41 +484,43 @@ static int cifs_swn_reconnect(struct cifs_tcon *tcon, struct sockaddr_storage *a
 
 	/* Store the reconnect address */
 	mutex_lock(&tcon->ses->server->srv_mutex);
-	if (!cifs_sockaddr_equal(&tcon->ses->server->dstaddr, addr)) {
-		ret = cifs_swn_store_swn_addr(addr, &tcon->ses->server->dstaddr,
-				&tcon->ses->server->swn_dstaddr);
-		if (ret < 0) {
-			cifs_dbg(VFS, "%s: failed to store address: %d\n", __func__, ret);
-			goto unlock;
-		}
-		tcon->ses->server->use_swn_dstaddr = true;
+	if (cifs_sockaddr_equal(&tcon->ses->server->dstaddr, addr))
+		goto unlock;
 
-		/*
-		 * Unregister to stop receiving notifications for the old IP address.
-		 */
-		ret = cifs_swn_unregister(tcon);
-		if (ret < 0) {
-			cifs_dbg(VFS, "%s: Failed to unregister for witness notifications: %d\n",
-					__func__, ret);
-			goto unlock;
-		}
+	ret = cifs_swn_store_swn_addr(addr, &tcon->ses->server->dstaddr,
+				      &tcon->ses->server->swn_dstaddr);
+	if (ret < 0) {
+		cifs_dbg(VFS, "%s: failed to store address: %d\n", __func__, ret);
+		goto unlock;
+	}
+	tcon->ses->server->use_swn_dstaddr = true;
 
-		/*
-		 * And register to receive notifications for the new IP address now that we have
-		 * stored the new address.
-		 */
-		ret = cifs_swn_register(tcon);
-		if (ret < 0) {
-			cifs_dbg(VFS, "%s: Failed to register for witness notifications: %d\n",
-					__func__, ret);
-			goto unlock;
-		}
+	/*
+	 * Unregister to stop receiving notifications for the old IP address.
+	 */
+	ret = cifs_swn_unregister(tcon);
+	if (ret < 0) {
+		cifs_dbg(VFS, "%s: Failed to unregister for witness notifications: %d\n",
+			 __func__, ret);
+		goto unlock;
+	}
 
-		spin_lock(&GlobalMid_Lock);
-		if (tcon->ses->server->tcpStatus != CifsExiting)
-			tcon->ses->server->tcpStatus = CifsNeedReconnect;
-		spin_unlock(&GlobalMid_Lock);
+	/*
+	 * And register to receive notifications for the new IP address now that we have
+	 * stored the new address.
+	 */
+	ret = cifs_swn_register(tcon);
+	if (ret < 0) {
+		cifs_dbg(VFS, "%s: Failed to register for witness notifications: %d\n",
+			 __func__, ret);
+		goto unlock;
 	}
+
+	spin_lock(&GlobalMid_Lock);
+	if (tcon->ses->server->tcpStatus != CifsExiting)
+		tcon->ses->server->tcpStatus = CifsNeedReconnect;
+	spin_unlock(&GlobalMid_Lock);
+
 unlock:
 	mutex_unlock(&tcon->ses->server->srv_mutex);
 
-- 
2.29.2
