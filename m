From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 May 2020 18:07:34 +0000
Subject: [PATCH] ovl: potential crash in ovl_fid_to_fh()
Message-Id: <20200505180734.GA47680@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <CAOQ4uxj0F9V=FOUANKSATR2E==BoLr6OJMqsJe5QCbOLNR0k0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>
Cc: linux-unionfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The "buflen" value comes from the user and there is a potential that it
could be zero.  In do_handle_to_path() we know that "handle->handle_bytes"
is non-zero and we do:

	handle_dwords = handle->handle_bytes >> 2;

So values 1-3 become zero.  Then in ovl_fh_to_dentry() we do:

	int len = fh_len << 2;

So now len is in the "0,4-128" range and a multiple of 4.  But if
"buflen" is zero it will try to copy negative bytes when we do the
memcpy in ovl_fid_to_fh().

	memcpy(&fh->fb, fid, buflen - OVL_FH_WIRE_OFFSET);

And that will lead to a crash.  Thanks to Amir Goldstein for his help
with this patch.

Fixes: cbe7fba8edfc: ("ovl: make sure that real fid is 32bit aligned in memory")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/overlayfs/export.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
index 475c61f53f0fe..0e58213ace6d7 100644
--- a/fs/overlayfs/export.c
+++ b/fs/overlayfs/export.c
@@ -776,6 +776,9 @@ static struct ovl_fh *ovl_fid_to_fh(struct fid *fid, int buflen, int fh_type)
 {
 	struct ovl_fh *fh;
 
+	if (buflen <= OVL_FH_WIRE_OFFSET)
+		return ERR_PTR(-EINVAL);
+
 	/* If on-wire inner fid is aligned - nothing to do */
 	if (fh_type = OVL_FILEID_V1)
 		return (struct ovl_fh *)fid;
-- 
2.26.2
