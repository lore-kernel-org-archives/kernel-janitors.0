From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Date: Thu, 07 Feb 2019 16:40:58 +0000
Subject: [PATCH 3/4] scripts: mkdebian: fix dependencies
Message-Id: <1549557659-19137-4-git-send-email-info@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1549557659-19137-1-git-send-email-info@metux.net>
In-Reply-To: <1549557659-19137-1-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net

We missed some build dependencies in the generated debian/control file.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index ff226be..1caaf0b 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -173,7 +173,7 @@ Source: $sourcename
 Section: kernel
 Priority: optional
 Maintainer: $maintainer
-Build-Depends: bc, kmod, cpio
+Build-Depends: bc, kmod, cpio, bison, libelf-dev, libssl-dev, flex
 Homepage: http://www.kernel.org/
 
 Package: $packagename
-- 
1.9.1
