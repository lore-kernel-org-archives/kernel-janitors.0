From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 19 Dec 2020 16:24:56 +0000
Subject: [PATCH] MAINTAINERS: adjust GCC PLUGINS after gcc-plugin.sh removal
Message-Id: <20201219162456.19790-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 1e860048c53e ("gcc-plugins: simplify GCC plugin-dev capability test")
removed ./scripts/gcc-plugin.sh, but missed to adjust MAINTAINERS.

Hence, ./scripts/get_maintainers.pl --self-test=patterns warns:

  warning: no file matches    F:    scripts/gcc-plugin.sh

Adjust entries in GGC PLUGINS section after this file removal.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20201218

Masahiro-san, please pick this minor cleanup patch on your -next tree.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f5eafee83bc6..fd3b06636c5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7371,7 +7371,6 @@ L:	linux-hardening@vger.kernel.org
 S:	Maintained
 F:	Documentation/kbuild/gcc-plugins.rst
 F:	scripts/Makefile.gcc-plugins
-F:	scripts/gcc-plugin.sh
 F:	scripts/gcc-plugins/
 
 GCOV BASED KERNEL PROFILING
-- 
2.17.1
