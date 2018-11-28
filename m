From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Nov 2018 15:08:09 +0000
Subject: [PATCH] staging: rtl8188eu: fix spelling mistake "inferface" -> "interface"
Message-Id: <20181128150809.13027-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180926133405.31199-1-colin.king@canonical.com>
In-Reply-To: <20180926133405.31199-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Fix spelling mistake in module description text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/os_dep/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/os_intfs.c b/drivers/staging/rtl8188eu/os_dep/os_intfs.c
index fb213a90ed1b..abcce2240f15 100644
--- a/drivers/staging/rtl8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8188eu/os_dep/os_intfs.c
@@ -131,7 +131,7 @@ MODULE_PARM_DESC(debug, "Set debug level (1-9) (default 1)");
 
 static bool rtw_monitor_enable;
 module_param_named(monitor_enable, rtw_monitor_enable, bool, 0444);
-MODULE_PARM_DESC(monitor_enable, "Enable monitor inferface (default: false)");
+MODULE_PARM_DESC(monitor_enable, "Enable monitor interface (default: false)");
 
 static int netdev_close(struct net_device *pnetdev);
 
-- 
2.19.1
