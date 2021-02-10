From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 10 Feb 2021 07:59:47 +0000
Subject: [PATCH] MAINTAINERS: replace non-matching patterns for loongson{2,3}
Message-Id: <20210210075947.15604-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keguang Zhang <keguang.zhang@gmail.com>, Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@linux-mips.org
Cc: Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit ffe1f9356fbe ("MAINTAINERS: Add Loongson-2/Loongson-3 maintainers")
adds quite generic file entries for drivers/*/*loongson{2,3}* and
drivers/*/*/*loongson{2,3}* to be informed on changes to all loongson{2,3}
files in drivers.

However, only the pattern 'drivers/*/*loongson2*' matches to one file in
the repository, i.e., drivers/cpufreq/loongson2_cpufreq.c; all other
patterns have no file matches.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    drivers/*/*/*loongson2*
  warning: no file matches    F:    drivers/*/*/*loongson3*
  warning: no file matches    F:    drivers/*/*loongson3*

As in the last two and half years, no further files and drivers have
showed up to match those patterns, just name the one file that matches
explicitly and delete the others without a match.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201102

Keguang, Huacai, Jiaxun, please ack.

Thomas, please pick this minor non-urgent cleanup patch.

 MAINTAINERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b4197e9da495..fc08f628e196 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11719,8 +11719,7 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/include/asm/mach-loongson2ef/
 F:	arch/mips/loongson2ef/
-F:	drivers/*/*/*loongson2*
-F:	drivers/*/*loongson2*
+F:	drivers/cpufreq/loongson2_cpufreq.c
 
 MIPS/LOONGSON64 ARCHITECTURE
 M:	Huacai Chen <chenhc@lemote.com>
@@ -11729,8 +11728,6 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/include/asm/mach-loongson64/
 F:	arch/mips/loongson64/
-F:	drivers/*/*/*loongson3*
-F:	drivers/*/*loongson3*
 F:	drivers/irqchip/irq-loongson*
 F:	drivers/platform/mips/cpu_hwmon.c
 
-- 
2.17.1
