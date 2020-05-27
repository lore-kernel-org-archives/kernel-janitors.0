From: Colin King <colin.king@canonical.com>
Date: Wed, 27 May 2020 12:50:31 +0000
Subject: [PATCH] cifs: remove redundant initialization of variable rc
Message-Id: <20200527125031.173987-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rc is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/cifs/cifssmb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
index 5014a82391ff..d62f9175c546 100644
--- a/fs/cifs/cifssmb.c
+++ b/fs/cifs/cifssmb.c
@@ -2375,7 +2375,7 @@ int
 CIFSSMBWrite2(const unsigned int xid, struct cifs_io_parms *io_parms,
 	      unsigned int *nbytes, struct kvec *iov, int n_vec)
 {
-	int rc = -EACCES;
+	int rc;
 	WRITE_REQ *pSMB = NULL;
 	int wct;
 	int smb_hdr_len;
-- 
2.25.1
