From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Jun 2018 15:01:03 +0000
Subject: [PATCH] CIFS: Fix error code in smb311_posix_mkdir()
Message-Id: <20180621150103.2zl7be4yzzotnqgw@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The error assignment needs to go before the goto.

Fixes: 5539e9b24a38 ("CIFS: fix memory leak and remove dead code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index 062a2a59beb3..c9489b1160f0 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -1946,8 +1946,8 @@ int smb311_posix_mkdir(const unsigned int xid, struct inode *inode,
 	if (ses && (ses->server))
 		server = ses->server;
 	else {
-		goto err_free_path;
 		rc = -EIO;
+		goto err_free_path;
 	}
 
 	/* resource #2: request */
