From: Colin King <colin.king@canonical.com>
Date: Wed, 03 May 2017 15:49:24 +0000
Subject: [PATCH] firmware: Google VPD: fix error handling on allocation failures
Message-Id: <20170503154924.1659-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wei-Ning Huang <wnhuang@google.com>, Thierry Escande <thierry.escande@collabora.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Fix two allocation failure checks. Firstly, ensure info is checked
for a failed allocation; this fixes a potential null pointer
dereference issue on info->key.  Secondly, free info is info->key
fails to allocate to fix a memory leak.

Detected by CoverityScan, CID#1430064 ("Resource Leak")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/firmware/google/vpd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
index 3ce813110d5e..2eb15b1dabcc 100644
--- a/drivers/firmware/google/vpd.c
+++ b/drivers/firmware/google/vpd.c
@@ -116,9 +116,13 @@ static int vpd_section_attrib_add(const u8 *key, s32 key_len,
 		return VPD_OK;
 
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
 	info->key = kzalloc(key_len + 1, GFP_KERNEL);
-	if (!info->key)
+	if (!info->key) {
+		kfree(info);
 		return -ENOMEM;
+	}
 
 	memcpy(info->key, key, key_len);
 
-- 
2.11.0

