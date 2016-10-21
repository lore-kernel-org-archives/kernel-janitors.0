From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Oct 2016 05:10:36 +0000
Subject: [PATCH 5/6] FRV-setup: Fix indentation in two lines
Message-Id: <81f557b2-40f3-0625-331d-c5b115f1971c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
In-Reply-To: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Oct 2016 22:25:18 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: please, no spaces at the start of a line

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/frv/kernel/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/frv/kernel/setup.c b/arch/frv/kernel/setup.c
index 35a23fc..9a44cbe 100644
--- a/arch/frv/kernel/setup.c
+++ b/arch/frv/kernel/setup.c
@@ -818,9 +818,9 @@ void __init setup_arch(char **cmdline_p)
 
 #ifdef CONFIG_VT
 #if defined(CONFIG_VGA_CONSOLE)
-        conswitchp = &vga_con;
+	conswitchp = &vga_con;
 #elif defined(CONFIG_DUMMY_CONSOLE)
-        conswitchp = &dummy_con;
+	conswitchp = &dummy_con;
 #endif
 #endif
 
-- 
2.10.1

