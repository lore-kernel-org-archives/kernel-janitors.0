From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Sep 2018 11:12:07 +0000
Subject: [PATCH] cifs: integer overflow in in SMB2_ioctl()
Message-Id: <20180910111207.r2uqce4ie7ee7fsh@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "le32_to_cpu(rsp->OutputOffset) + *plen" addition can overflow and
wrap around to a smaller value which looks like it would lead to an
information leak.

Fixes: 4a72dafa19ba ("SMB2 FSCTL and IOCTL worker function")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index c08acfc77abc..8b54cd282d9c 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -2459,14 +2459,14 @@ SMB2_ioctl(const unsigned int xid, struct cifs_tcon *tcon, u64 persistent_fid,
 	/* We check for obvious errors in the output buffer length and offset */
 	if (*plen = 0)
 		goto ioctl_exit; /* server returned no data */
-	else if (*plen > 0xFF00) {
+	else if (*plen > rsp_iov.iov_len || *plen > 0xFF00) {
 		cifs_dbg(VFS, "srv returned invalid ioctl length: %d\n", *plen);
 		*plen = 0;
 		rc = -EIO;
 		goto ioctl_exit;
 	}
 
-	if (rsp_iov.iov_len < le32_to_cpu(rsp->OutputOffset) + *plen) {
+	if (rsp_iov.iov_len - *plen < le32_to_cpu(rsp->OutputOffset)) {
 		cifs_dbg(VFS, "Malformed ioctl resp: len %d offset %d\n", *plen,
 			le32_to_cpu(rsp->OutputOffset));
 		*plen = 0;
