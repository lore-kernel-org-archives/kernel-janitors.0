From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Oct 2016 05:11:57 +0000
Subject: [PATCH 6/6] FRV-setup: Move statements for "case" to separate lines
Message-Id: <a9aeef64-18e2-3cd4-dc1a-61ad3f207770@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
In-Reply-To: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Oct 2016 22:33:56 +0200

The script "checkpatch.pl" pointed information out like the following.

ERROR: trailing statements should be on next line

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/frv/kernel/setup.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/frv/kernel/setup.c b/arch/frv/kernel/setup.c
index 9a44cbe..df44dbd 100644
--- a/arch/frv/kernel/setup.c
+++ b/arch/frv/kernel/setup.c
@@ -474,8 +474,12 @@ static void __init determine_cpu(void)
 		pdm_suspend_mode = HSR0_PDM_PLL_STOP;
 
 		switch (PSR_VERSION(psr)) {
-		case PSR_VERSION_FR501_MB93501:  cpu_silicon = "mb93501";   break;
-		case PSR_VERSION_FR501_MB93501A: cpu_silicon = "mb93501/A"; break;
+		case PSR_VERSION_FR501_MB93501:
+			cpu_silicon = "mb93501";
+			break;
+		case PSR_VERSION_FR501_MB93501A:
+			cpu_silicon = "mb93501/A";
+			break;
 		default:
 			break;
 		}
-- 
2.10.1

