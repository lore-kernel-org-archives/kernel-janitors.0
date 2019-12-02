From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Dec 2019 18:59:42 +0000
Subject: [PATCH] cifs: remove redundant assignment to pointer pneg_ctxt
Message-Id: <20191202185942.81854-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer pneg_ctxt is being initialized with a value that is never
read and it is being updated later with a new value.  The assignment
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/cifs/smb2pdu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index ed77f94dbf1d..be0de8a63e57 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -554,7 +554,7 @@ static void
 assemble_neg_contexts(struct smb2_negotiate_req *req,
 		      struct TCP_Server_Info *server, unsigned int *total_len)
 {
-	char *pneg_ctxt = (char *)req;
+	char *pneg_ctxt;
 	unsigned int ctxt_len;
 
 	if (*total_len > 200) {
-- 
2.24.0
