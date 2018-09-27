From: Colin King <colin.king@canonical.com>
Date: Thu, 27 Sep 2018 12:17:49 +0000
Subject: [PATCH][staging-next] staging: wilc1000: fix incorrect allocation size for structure
Message-Id: <20180927121749.13229-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aditya Shankar <aditya.shankar@microchip.com>, Ganesh Krishna <ganesh.krishna@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the allocation for str_vals is for the sizeof the pointer
rather than the size of the structure.  Fix this.

Detected by smatch
"wilc_wlan_cfg_init() error: not allocating enough data 392 vs 8"

Fixes: acceb12a9f8b ("staging: wilc1000: refactor code to avoid static variables for config parameters")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wilc1000/wilc_wlan_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wilc1000/wilc_wlan_cfg.c b/drivers/staging/wilc1000/wilc_wlan_cfg.c
index 930a3896f4ae..faa001c75681 100644
--- a/drivers/staging/wilc1000/wilc_wlan_cfg.c
+++ b/drivers/staging/wilc1000/wilc_wlan_cfg.c
@@ -457,7 +457,7 @@ int wilc_wlan_cfg_init(struct wilc *wl)
 	if (!wl->cfg.s)
 		goto out_w;
 
-	str_vals = kzalloc(sizeof(str_vals), GFP_KERNEL);
+	str_vals = kzalloc(sizeof(*str_vals), GFP_KERNEL);
 	if (!str_vals)
 		goto out_s;
 
-- 
2.17.1
