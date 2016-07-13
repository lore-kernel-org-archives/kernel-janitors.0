From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jul 2016 10:35:29 +0000
Subject: [patch] drm/msm: return -EFAULT instead of bytes remaining
Message-Id: <20160713103529.GL29468@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org

copy_to/from_user returns the number of bytes remaining to be copied but
we want to return -EFAULT.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/msm/msm_perf.c b/drivers/gpu/drm/msm/msm_perf.c
index 830857c..17fe4e5 100644
--- a/drivers/gpu/drm/msm/msm_perf.c
+++ b/drivers/gpu/drm/msm/msm_perf.c
@@ -132,7 +132,7 @@ static ssize_t perf_read(struct file *file, char __user *buf,
 		size_t sz, loff_t *ppos)
 {
 	struct msm_perf_state *perf = file->private_data;
-	int n = 0, ret;
+	int n = 0, ret = 0;
 
 	mutex_lock(&perf->read_lock);
 
@@ -143,9 +143,10 @@ static ssize_t perf_read(struct file *file, char __user *buf,
 	}
 
 	n = min((int)sz, perf->buftot - perf->bufpos);
-	ret = copy_to_user(buf, &perf->buf[perf->bufpos], n);
-	if (ret)
+	if (copy_to_user(buf, &perf->buf[perf->bufpos], n)) {
+		ret = -EFAULT;
 		goto out;
+	}
 
 	perf->bufpos += n;
 	*ppos += n;
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 24254e0..3a5fdfc 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -149,9 +149,10 @@ static ssize_t rd_read(struct file *file, char __user *buf,
 		goto out;
 
 	n = min_t(int, sz, circ_count_to_end(&rd->fifo));
-	ret = copy_to_user(buf, fptr, n);
-	if (ret)
+	if (copy_to_user(buf, fptr, n)) {
+		ret = -EFAULT;
 		goto out;
+	}
 
 	fifo->tail = (fifo->tail + n) & (BUF_SZ - 1);
 	*ppos += n;
