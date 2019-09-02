From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Sep 2019 15:01:52 +0000
Subject: [PATCH][cifs-next] cifs: fix dereference on ses before it is null checked
Message-Id: <20190902150152.21550-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of pointer server dereferences pointer ses, however,
this dereference occurs before ses is null checked and hence we
have a potential null pointer dereference.  Fix this by only
dereferencing ses after it has been null checked.

Addresses-Coverity: ("Dereference before null check")
Fixes: 2808c6639104 ("cifs: add new debugging macro cifs_server_dbg")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/cifs/transport.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
index 0d60bd2f4dca..a90bd4d75b4d 100644
--- a/fs/cifs/transport.c
+++ b/fs/cifs/transport.c
@@ -1242,12 +1242,13 @@ SendReceive(const unsigned int xid, struct cifs_ses *ses,
 	struct kvec iov = { .iov_base = in_buf, .iov_len = len };
 	struct smb_rqst rqst = { .rq_iov = &iov, .rq_nvec = 1 };
 	struct cifs_credits credits = { .value = 1, .instance = 0 };
-	struct TCP_Server_Info *server = ses->server;
+	struct TCP_Server_Info *server;
 
 	if (ses = NULL) {
 		cifs_dbg(VFS, "Null smb session\n");
 		return -EIO;
 	}
+	server = ses->server;
 	if (server = NULL) {
 		cifs_dbg(VFS, "Null tcp session\n");
 		return -EIO;
-- 
2.20.1
