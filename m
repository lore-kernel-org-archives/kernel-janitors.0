From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 00:48:07 +0000
Subject: [PATCH] ARM: rockchip: fix spelling mistake "to" -> "too"
Message-Id: <20200123004807.2833556-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/arm/mach-rockchip/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/platsmp.c
index 649e0a54784c..d60856898d97 100644
--- a/arch/arm/mach-rockchip/platsmp.c
+++ b/arch/arm/mach-rockchip/platsmp.c
@@ -180,7 +180,7 @@ static int __init rockchip_smp_prepare_sram(struct device_node *node)
 
 	rsize = resource_size(&res);
 	if (rsize < trampoline_sz) {
-		pr_err("%s: reserved block with size 0x%x is to small for trampoline size 0x%x\n",
+		pr_err("%s: reserved block with size 0x%x is too small for trampoline size 0x%x\n",
 		       __func__, rsize, trampoline_sz);
 		return -EINVAL;
 	}
-- 
2.24.0
