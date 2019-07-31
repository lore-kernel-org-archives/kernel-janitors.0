From: Colin King <colin.king@canonical.com>
Date: Wed, 31 Jul 2019 09:05:26 +0000
Subject: [PATCH] cifs: remove redundant assignment to variable rc
Message-Id: <20190731090526.27245-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable rc is being initialized with a value that is never read
and rc is being re-assigned a little later on. The assignment is
redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/cifs/smb2pdu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index ee5d74988a9f..a653c429e8dc 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -3617,7 +3617,7 @@ SMB2_read(const unsigned int xid, struct cifs_io_parms *io_parms,
 	  unsigned int *nbytes, char **buf, int *buf_type)
 {
 	struct smb_rqst rqst;
-	int resp_buftype, rc = -EACCES;
+	int resp_buftype, rc;
 	struct smb2_read_plain_req *req = NULL;
 	struct smb2_read_rsp *rsp = NULL;
 	struct kvec iov[1];
-- 
2.20.1
