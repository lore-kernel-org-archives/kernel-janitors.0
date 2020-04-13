From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 13 Apr 2020 07:22:21 +0000
Subject: [PATCH v2] MAINTAINERS: rectify MMP SUPPORT after moving cputype.h
Message-Id: <20200413072221.8061-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lubomir Rintel <lkundrak@v3.sk>, Olof Johansson <olof@lixom.net>
Cc: Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Commit 32adcaa010fa ("ARM: mmp: move cputype.h to include/linux/soc/")
added a file entry that does not point to the intended file location.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: linux/soc/mmp/

Rectify the MAINTAINERS entry now.

Fixes: 32adcaa010fa ("ARM: mmp: move cputype.h to include/linux/soc/")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Lubomir, please pick this patch.

v1 & v1-RESEND: was ignored.

v1 -> v2:
  - v1 does not apply after reordering MAINTAINERS, i.e., commit 4400b7d68f6e
  ("MAINTAINERS: sort entries by entry name") and commit 3b50142d8528
  ("MAINTAINERS: sort field names for all entries").
  - PATCH v2 applies on v5.7-rc1 now. Please pick v2 instead of v1.


 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..a0fef0c33ba5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11327,7 +11327,7 @@ S:	Odd Fixes
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lkundrak/linux-mmp.git
 F:	arch/arm/boot/dts/mmp*
 F:	arch/arm/mach-mmp/
-F:	linux/soc/mmp/
+F:	include/linux/soc/mmp/
 
 MMP USB PHY DRIVERS
 R:	Lubomir Rintel <lkundrak@v3.sk>
-- 
2.17.1
