From: Colin King <colin.king@canonical.com>
Date: Mon, 19 Feb 2018 17:13:10 +0000
Subject: [PATCH][next] CIFS: fix copy-n-paste on new sha512 secmech
Message-Id: <20180219171310.10515-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for the sha512 crypto secmech is checking .md5 rather
than .sha512, this looks like a copy-paste error when adding
in this code.  Fix this by using the correct .sha512 field.

Detected by CoverityScan, CID#1465358 ("Copy-paste error")

Fixes: 1c6614d229e7 ("CIFS: add sha512 secmech")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/cifs/cifsencrypt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/cifsencrypt.c b/fs/cifs/cifsencrypt.c
index 6fa6d459678e..a6ef088e057b 100644
--- a/fs/cifs/cifsencrypt.c
+++ b/fs/cifs/cifsencrypt.c
@@ -829,7 +829,7 @@ cifs_crypto_secmech_release(struct TCP_Server_Info *server)
 		server->secmech.md5 = NULL;
 	}
 
-	if (server->secmech.md5) {
+	if (server->secmech.sha512) {
 		crypto_free_shash(server->secmech.sha512);
 		server->secmech.sha512 = NULL;
 	}
-- 
2.15.1

