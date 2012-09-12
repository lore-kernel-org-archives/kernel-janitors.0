From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 12 Sep 2012 17:03:16 +0000
Subject: [PATCH 9/15] arch/arm/mach-s3c24xx/mach-h1940.c: removes unnecessary semicolon
Message-Id: <1347469402-27557-9-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 arch/arm/mach-s3c24xx/mach-h1940.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index bb8d008..02ef7d5 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -460,7 +460,7 @@ static void h1940_set_mmc_power(unsigned char power_mode, unsigned short vdd)
 		break;
 	default:
 		break;
-	};
+	}
 }
 
 static struct s3c24xx_mci_pdata h1940_mmc_cfg __initdata = {

