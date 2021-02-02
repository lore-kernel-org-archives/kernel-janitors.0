From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Feb 2021 05:56:36 +0000
Subject: [PATCH] drm/amdgpu: Prevent shift wrapping in amdgpu_read_mask()
Message-Id: <YBjplLOof9J1E2o5@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Kevin Wang <kevin1.wang@amd.com>, Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Eric Huang <JinHuiEric.Huang@amd.com>, Evan Quan <evan.quan@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

If the user passes a "level" value which is higher than 31 then that
leads to shift wrapping.  The undefined behavior will lead to a
syzkaller stack dump.

Fixes: 5632708f4452 ("drm/amd/powerplay: add dpm force multiple levels on cz/tonga/fiji/polaris (v2)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index e9b569b76716..1a4010fcf561 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -1094,7 +1094,7 @@ static ssize_t amdgpu_get_pp_dpm_sclk(struct device *dev,
 static ssize_t amdgpu_read_mask(const char *buf, size_t count, uint32_t *mask)
 {
 	int ret;
-	long level;
+	unsigned long level;
 	char *sub_str = NULL;
 	char *tmp;
 	char buf_cpy[AMDGPU_MASK_BUF_MAX + 1];
@@ -1109,9 +1109,9 @@ static ssize_t amdgpu_read_mask(const char *buf, size_t count, uint32_t *mask)
 	tmp = buf_cpy;
 	while (tmp[0]) {
 		sub_str = strsep(&tmp, delimiter);
-		if (strlen(sub_str)) {
-			ret = kstrtol(sub_str, 0, &level);
-			if (ret)
+		if (sub_str[0]) {
+			ret = kstrtoul(sub_str, 0, &level);
+			if (ret || level > 31)
 				return -EINVAL;
 			*mask |= 1 << level;
 		} else
-- 
2.29.2
