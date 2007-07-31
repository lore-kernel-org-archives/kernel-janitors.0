From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 21:33:23 +0000
Subject: [PATCH 59] drivers/video/offb.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707312333.24261.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, mchehab@infradead.org, v4l-dvb-maintainer@linuxtv.org, video4linux-list@redhat.com

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/video/offb.c | 14535 -> 14505 (-30 bytes)

 drivers/video/offb.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/video/offb.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/video/offb.c	2007-07-31 11:22:32.000000000 +0200
@@ -273,13 +273,11 @@ static void __init offb_init_fb(const ch

 	size = sizeof(struct fb_info) + sizeof(u32) * 16;

-	info = kmalloc(size, GFP_ATOMIC);
-
-	if (info = 0) {
+	info = kzalloc(size, GFP_ATOMIC);
+	if (!info) {
 		release_mem_region(res_start, res_size);
 		return;
 	}
-	memset(info, 0, size);

 	fix = &info->fix;
 	var = &info->var;
