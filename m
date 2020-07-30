From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jul 2020 11:46:13 +0000
Subject: [PATCH] drm/amd/display: fix dp_dsc_clock_en_read() debugfs function
Message-Id: <20200730114613.GA59409@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Eryk Brol <eryk.brol@amd.com>
Cc: Stylon Wang <stylon.wang@amd.com>, kernel-janitors@vger.kernel.org, Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>, Alex Deucher <alexander.deucher@amd.com>, Mikita Lipski <mikita.lipski@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

There are problems with the dp_dsc_clock_en_read() function.  Only one
of the memory leak is a runtime bug.

1)  It leaks memory on the -ENXIO and -EFAULT error paths.
2)  There is a discrepency between rd_buf_size (10) and str_len (30).
    Static analysis complain that this could lead to a buffer overflow,
    but actually the buffer overflow is prevented by other factors.
3)  The "rd_buf_ptr" is assigned "+= str_len" but the result is not used.
    This leads to static checker warnings as well.  Also the "str_len"
    is misleading because it's not the strlen() and in fact is beyond
    the end of the buffer.
4)  This code re-implements the simple_read_from_buffer() function.

This code can be cleaned up by removing the allocation and using the
simple_read_from_buffer() function.

Fixes: c06e09b76639 ("drm/amd/display: Add DSC parameters logging to debugfs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 38 +++----------------
 1 file changed, 5 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index e5a6d9115949..114962922ff3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -983,22 +983,13 @@ static ssize_t dp_dpcd_data_read(struct file *f, char __user *buf,
 static ssize_t dp_dsc_clock_en_read(struct file *f, char __user *buf,
 				    size_t size, loff_t *pos)
 {
-	char *rd_buf = NULL;
-	char *rd_buf_ptr = NULL;
 	struct amdgpu_dm_connector *aconnector = file_inode(f)->i_private;
 	struct display_stream_compressor *dsc;
 	struct dcn_dsc_state dsc_state = {0};
-	const uint32_t rd_buf_size = 10;
 	struct pipe_ctx *pipe_ctx;
-	ssize_t result = 0;
-	int i, r, str_len = 30;
-
-	rd_buf = kcalloc(rd_buf_size, sizeof(char), GFP_KERNEL);
-
-	if (!rd_buf)
-		return -ENOMEM;
-
-	rd_buf_ptr = rd_buf;
+	char rd_buf[10];
+	int len;
+	int i;
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
@@ -1014,27 +1005,8 @@ static ssize_t dp_dsc_clock_en_read(struct file *f, char __user *buf,
 	if (dsc)
 		dsc->funcs->dsc_read_state(dsc, &dsc_state);
 
-	snprintf(rd_buf_ptr, str_len,
-		"%d\n",
-		dsc_state.dsc_clock_en);
-	rd_buf_ptr += str_len;
-
-	while (size) {
-		if (*pos >= rd_buf_size)
-			break;
-
-		r = put_user(*(rd_buf + result), buf);
-		if (r)
-			return r; /* r = -EFAULT */
-
-		buf += 1;
-		size -= 1;
-		*pos += 1;
-		result += 1;
-	}
-
-	kfree(rd_buf);
-	return result;
+	len = snprintf(rd_buf, sizeof(rd_buf), "%d\n", dsc_state.dsc_clock_en);
+	return simple_read_from_buffer(buf, size, pos, rd_buf, len);
 }
 
 static ssize_t dp_dsc_slice_width_read(struct file *f, char __user *buf,
-- 
2.27.0
