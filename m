From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Jul 2019 12:04:21 +0000
Subject: [PATCH] intel_th: msu: fix missing allocation failure check on a kstrndup
Message-Id: <20190726120421.9650-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

kstrndup can potentially return NULL, so add a null memory check to
avoid a null pointer reference later on.

Addresses-Coverity: ("Dereference null return")
Fixes: 615c164da0eb ("intel_th: msu: Introduce buffer interface")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwtracing/intel_th/msu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index 4892ac446c01..dd7e3c304ee5 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -1848,6 +1848,8 @@ mode_store(struct device *dev, struct device_attribute *attr, const char *buf,
 		len = cp - buf;
 
 	mode = kstrndup(buf, len, GFP_KERNEL);
+	if (!mode)
+		return -ENOMEM;
 	i = match_string(msc_mode, ARRAY_SIZE(msc_mode), mode);
 	if (i >= 0)
 		goto found;
-- 
2.20.1
