From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 18 Dec 2018 02:51:51 +0000
Subject: [PATCH -next] cifs: remove set but not used variable 'server'
Message-Id: <1545101511-73531-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536198643-6123-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536198643-6123-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

fs/cifs/smb2pdu.c: In function 'smb311_posix_mkdir':
fs/cifs/smb2pdu.c:2040:26: warning:
 variable 'server' set but not used [-Wunused-but-set-variable]

fs/cifs/smb2pdu.c: In function 'build_qfs_info_req':
fs/cifs/smb2pdu.c:4067:26: warning:
 variable 'server' set but not used [-Wunused-but-set-variable]

The first 'server' never used since commit bea851b8babe ("smb3: Fix mode on
mkdir on smb311 mounts")
And the second not used since commit 1fc6ad2f10ad ("cifs: remove
header_preamble_size where it is always 0")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/cifs/smb2pdu.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index 69e99b6..e283590 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -2037,7 +2037,6 @@ int smb311_posix_mkdir(const unsigned int xid, struct inode *inode,
 	struct smb_rqst rqst;
 	struct smb2_create_req *req;
 	struct smb2_create_rsp *rsp = NULL;
-	struct TCP_Server_Info *server;
 	struct cifs_ses *ses = tcon->ses;
 	struct kvec iov[3]; /* make sure at least one for each open context */
 	struct kvec rsp_iov = {NULL, 0};
@@ -2060,9 +2059,7 @@ int smb311_posix_mkdir(const unsigned int xid, struct inode *inode,
 	if (!utf16_path)
 		return -ENOMEM;
 
-	if (ses && (ses->server))
-		server = ses->server;
-	else {
+	if (!ses || !(ses->server)) {
 		rc = -EIO;
 		goto err_free_path;
 	}
@@ -4064,7 +4061,6 @@ void smb2_reconnect_server(struct work_struct *work)
 build_qfs_info_req(struct kvec *iov, struct cifs_tcon *tcon, int level,
 		   int outbuf_len, u64 persistent_fid, u64 volatile_fid)
 {
-	struct TCP_Server_Info *server;
 	int rc;
 	struct smb2_query_info_req *req;
 	unsigned int total_len;
@@ -4074,8 +4070,6 @@ void smb2_reconnect_server(struct work_struct *work)
 	if ((tcon->ses = NULL) || (tcon->ses->server = NULL))
 		return -EIO;
 
-	server = tcon->ses->server;
-
 	rc = smb2_plain_req_init(SMB2_QUERY_INFO, tcon, (void **) &req,
 			     &total_len);
 	if (rc)
