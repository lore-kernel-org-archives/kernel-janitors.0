From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 02 Oct 2017 18:00:27 +0000
Subject: [PATCH 3/6] ARM: s3c2410: Fix a typo in a comment line
Message-Id: <b93ca267-88d2-b68a-1570-dc8fc71f3888@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
In-Reply-To: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Oct 2017 19:34:36 +0200

Adjust a word in this function description.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/mach-s3c24xx/iotiming-s3c2410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/iotiming-s3c2410.c b/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
index c18769b5f15a..d5f1f06e4811 100644
--- a/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
@@ -206,7 +206,7 @@ static int calc_tacc(unsigned int cyc, int nwait_en,
 }
 
 /**
- * s3c2410_calc_bank - calculate bank timing infromation
+ * s3c2410_calc_bank - calculate bank timing information
  * @cfg: The configuration we need to calculate for.
  * @bt: The bank timing information.
  *
-- 
2.14.2

