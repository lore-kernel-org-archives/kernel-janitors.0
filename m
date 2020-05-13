From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 May 2020 15:08:55 +0000
Subject: [PATCH v3] ovl: potential crash in ovl_fid_to_fh()
Message-Id: <20200513150855.GD3041@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200513102346.6c04d912@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>
Cc: linux-unionfs@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

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

Fixes: cbe7fba8edfc ("ovl: make sure that real fid is 32bit aligned in memory")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---
v2: Move the check after the other checks
v3: Fix Fixes tag

 fs/overlayfs/export.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
index 475c61f53f0fe..ed5c1078919cc 100644
--- a/fs/overlayfs/export.c
+++ b/fs/overlayfs/export.c
@@ -783,6 +783,9 @@ static struct ovl_fh *ovl_fid_to_fh(struct fid *fid, int buflen, int fh_type)
 	if (fh_type != OVL_FILEID_V0)
 		return ERR_PTR(-EINVAL);
 
+	if (buflen <= OVL_FH_WIRE_OFFSET)
+		return ERR_PTR(-EINVAL);
+
 	fh = kzalloc(buflen, GFP_KERNEL);
 	if (!fh)
 		return ERR_PTR(-ENOMEM);
-- 
2.26.2
