From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 18 Apr 2020 09:45:46 +0000
Subject: [PATCH] MAINTAINERS: adjust entries to moving CEC USB drivers
Message-Id: <20200418094546.6742-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200418093630.6149-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200418093630.6149-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit a81068181aad ("media: move CEC USB drivers to a separate directory")
moved drivers/media/usb/{pulse8,rainshadow}-cec to
drivers/media/cec/usb/{rainshadow,pulse8}, but did not adjust the entries
in MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches F: drivers/media/usb/pulse8-cec/*
  warning: no file matches F: drivers/media/usb/rainshadow-cec/*

Update the MAINTAINERS entries to the new file locations.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Hans, please ack.
Mauro, please pick this non-urgent minor clean-up patch on top of the
CEC USB driver moves.

applies cleanly on next-20200417

This is the 'minimal' patch to address the warning.

Alternatively, we could simply merge the two entries into one entry
CEC USB (RAINSHADOW/PULSE8) DRIVERS.


 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e965e5467a4d..3083282134de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13736,7 +13736,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/admin-guide/media/pulse8-cec.rst
-F:	drivers/media/usb/pulse8-cec/*
+F:	drivers/media/cec/usb/pulse8/
 
 PVRUSB2 VIDEO4LINUX DRIVER
 M:	Mike Isely <isely@pobox.com>
@@ -14152,7 +14152,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	drivers/media/usb/rainshadow-cec/*
+F:	drivers/media/cec/usb/rainshadow/
 
 RALINK MIPS ARCHITECTURE
 M:	John Crispin <john@phrozen.org>
-- 
2.17.1
