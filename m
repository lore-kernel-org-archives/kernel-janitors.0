From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 01 Jun 2019 03:31:10 +0000
Subject: [PATCH -next] cifs: Use kmemdup in SMB2_ioctl_init()
Message-Id: <20190601033110.81011-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

Use kmemdup rather than duplicating its implementation

This was reported by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/cifs/smb2pdu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index 710ceb875161..02f0c2e41fcb 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -2549,12 +2549,11 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct smb_rqst *rqst,
 		 * indatalen is usually small at a couple of bytes max, so
 		 * just allocate through generic pool
 		 */
-		in_data_buf = kmalloc(indatalen, GFP_NOFS);
+		in_data_buf = kmemdup(in_data, indatalen, GFP_NOFS);
 		if (!in_data_buf) {
 			cifs_small_buf_release(req);
 			return -ENOMEM;
 		}
-		memcpy(in_data_buf, in_data, indatalen);
 	}
 
 	req->CtlCode = cpu_to_le32(opcode);
