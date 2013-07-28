From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 28 Jul 2013 20:26:09 +0000
Subject: [patch] cifs: arrays are never NULL
Message-Id: <20130728202609.GB8684@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

It causes a static analysis warning when check to see if an array is
NULL.  I have removed the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Or perhaps the intent was to check

	} else if (strlen(ses->serverName)) {

I am not very familiar with this code.

diff --git a/fs/cifs/cifsencrypt.c b/fs/cifs/cifsencrypt.c
index bb84d7c..16f4908 100644
--- a/fs/cifs/cifsencrypt.c
+++ b/fs/cifs/cifsencrypt.c
@@ -514,7 +514,7 @@ static int calc_ntlmv2_hash(struct cifs_ses *ses, char *ntlmv2_hash,
 				 __func__);
 			return rc;
 		}
-	} else if (ses->serverName) {
+	} else {
 		len = strlen(ses->serverName);
 
 		server = kmalloc(2 + (len * 2), GFP_KERNEL);
