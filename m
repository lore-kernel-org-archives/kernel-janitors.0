From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 28 Jun 2020 18:02:29 +0000
Subject: [PATCH] MAINTAINERS: remove obsolete entry after file renaming
Message-Id: <20200628180229.5068-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Seth Forshee <seth.forshee@canonical.com>, Mark Brown <broonie@kernel.org>
Cc: Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit f16861b12fa0 ("regulator: rename da903x to da903x-regulator") missed
to adjust the DIALOG SEMICONDUCTOR DRIVERS section in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    drivers/regulator/da903x.c

The da903x-regulator.c file is already covered by the pattern
drivers/regulator/da9???-regulator.[ch] in the section.

So, simply remove the non-matching file entry in MAINTAINERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20200626

Seth, please ack.
Mark, please pick this minor non-urgent patch into your -next tree.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 04fceaee5200..970136e262c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5021,7 +5021,6 @@ F:	drivers/mfd/da91??-*.c
 F:	drivers/pinctrl/pinctrl-da90??.c
 F:	drivers/power/supply/da9052-battery.c
 F:	drivers/power/supply/da91??-*.c
-F:	drivers/regulator/da903x.c
 F:	drivers/regulator/da9???-regulator.[ch]
 F:	drivers/regulator/slg51000-regulator.[ch]
 F:	drivers/rtc/rtc-da90??.c
-- 
2.17.1
