From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 21 Jan 2021 16:01:15 +0000
Subject: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
Message-Id: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, clang-built-linux@googlegroups.com, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
Kconfig") removed ./scripts/clang-version.sh and moved its content to
./scripts/cc-version.sh.

Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    scripts/clang-version.sh

The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
changes in ./scripts/clang-version.sh; as the file is removed, track
changes in ./scripts/cc-version.sh instead now.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210121

Masahiro-san, please pick this quick fix-up patch.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e5d7cf38ec82..aafbea806a82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4355,8 +4355,8 @@ B:	https://github.com/ClangBuiltLinux/linux/issues
 C:	irc://chat.freenode.net/clangbuiltlinux
 F:	Documentation/kbuild/llvm.rst
 F:	include/linux/compiler-clang.h
+F:	scripts/cc-version.sh
 F:	scripts/clang-tools/
-F:	scripts/clang-version.sh
 F:	scripts/lld-version.sh
 K:	\b(?i:clang|llvm)\b
 
-- 
2.17.1
