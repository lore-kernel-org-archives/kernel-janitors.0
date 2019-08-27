From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Aug 2019 10:59:17 +0000
Subject: [PATCH] cifs: Use kzfree() to zero out the password
Message-Id: <20190827105917.GA23038@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, Ronnie Sahlberg <lsahlber@redhat.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

It's safer to zero out the password so that it can never be disclosed.

Fixes: 0c219f5799c7 ("cifs: set domainName when a domain-key is used in multiuser")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/connect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index e6cc5c4b0f19..642bbb5bee3a 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -3101,7 +3101,7 @@ cifs_set_cifscreds(struct smb_vol *vol, struct cifs_ses *ses)
 			rc = -ENOMEM;
 			kfree(vol->username);
 			vol->username = NULL;
-			kfree(vol->password);
+			kzfree(vol->password);
 			vol->password = NULL;
 			goto out_key_put;
 		}
-- 
2.20.1
