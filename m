From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 01 Mar 2020 15:57:48 +0000
Subject: [PATCH] MAINTAINERS: adjust EFI entry to removing eboot.c
Message-Id: <20200301155748.4788-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit c2d0b470154c ("efi/libstub/x86: Incorporate eboot.c into libstub")
removed arch/x86/boot/compressed/eboot.[ch], but missed to adjust the
MAINTAINERS entry.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: arch/x86/boot/compressed/eboot.[ch]

Rectify EXTENSIBLE FIRMWARE INTERFACE (EFI) entry in MAINTAINERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Ard, please pick this patch for your linux-next branch.
applies cleanly on next-20200228, do not apply on current master

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 09b04505e7c3..4ce510b8467a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6383,7 +6383,6 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
 S:	Maintained
 F:	Documentation/admin-guide/efi-stub.rst
 F:	arch/*/kernel/efi.c
-F:	arch/x86/boot/compressed/eboot.[ch]
 F:	arch/*/include/asm/efi.h
 F:	arch/x86/platform/efi/
 F:	drivers/firmware/efi/
-- 
2.17.1
