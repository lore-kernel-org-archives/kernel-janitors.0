From: "Hannes Eder" <hannes@hanneseder.net>
Date: Sun, 23 Nov 2008 18:37:09 +0000
Subject: [PATCH] x86: boot - fix sparse warnings
Message-Id: <154e089b0811231037l18d4d8erce62eb4e77e28b10@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix this sparse warnings:

arch/x86/boot/video.c:233:3: warning: symbol 'saved' was not declared.
Should it be static?
arch/x86/boot/video-vga.c:37:13: warning: symbol 'video_vga' was not
declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 arch/x86/boot/video-vga.c |    4 ++--
 arch/x86/boot/video.c     |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/boot/video-vga.c b/arch/x86/boot/video-vga.c
index b939cb4..5d4742e 100644
--- a/arch/x86/boot/video-vga.c
+++ b/arch/x86/boot/video-vga.c
@@ -34,7 +34,7 @@ static struct mode_info cga_modes[] = {
 	{ VIDEO_80x25,  80, 25, 0 },
 };

-__videocard video_vga;
+static __videocard video_vga;

 /* Set basic 80x25 mode */
 static u8 vga_set_basic_mode(void)
@@ -259,7 +259,7 @@ static int vga_probe(void)
 	return mode_count[adapter];
 }

-__videocard video_vga = {
+static __videocard video_vga = {
 	.card_name	= "VGA",
 	.probe		= vga_probe,
 	.set_mode	= vga_set_mode,
diff --git a/arch/x86/boot/video.c b/arch/x86/boot/video.c
index 83598b2..3bef2c1 100644
--- a/arch/x86/boot/video.c
+++ b/arch/x86/boot/video.c
@@ -226,7 +226,7 @@ static unsigned int mode_menu(void)

 #ifdef CONFIG_VIDEO_RETAIN
 /* Save screen content to the heap */
-struct saved_screen {
+static struct saved_screen {
 	int x, y;
 	int curx, cury;
 	u16 *data;
