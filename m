From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 06 Jul 2019 08:15:30 +0000
Subject: [PATCH] staging: speakup: One function call less in speakup_win_enable()
Message-Id: <11f79333-25c3-1ad9-4975-58c64821f3fe@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: speakup@linux-speakup.org, devel@driverdev.osuosl.org, Bhagyashri Dighole <digholebhagyashri@gmail.com>, Chris Brannon <chris@the-brannons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kirk Reiser <kirk@reisers.ca>, Okash Khawaja <okash.khawaja@gmail.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>, William Hubbs <w.d.hubbs@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jul 2019 10:03:56 +0200

Avoid an extra function call by using a ternary operator instead of
a conditional statement.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/speakup/main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/speakup/main.c b/drivers/staging/speakup/main.c
index 488f2539aa9a..03bbc9a4dbb3 100644
--- a/drivers/staging/speakup/main.c
+++ b/drivers/staging/speakup/main.c
@@ -1917,10 +1917,9 @@ static void speakup_win_enable(struct vc_data *vc)
 		return;
 	}
 	win_enabled ^= 1;
-	if (win_enabled)
-		synth_printf("%s\n", spk_msg_get(MSG_WINDOW_SILENCED));
-	else
-		synth_printf("%s\n", spk_msg_get(MSG_WINDOW_SILENCE_DISABLED));
+	synth_printf("%s\n", spk_msg_get(win_enabled
+					 ? MSG_WINDOW_SILENCED
+					 : MSG_WINDOW_SILENCE_DISABLED));
 }

 static void speakup_bits(struct vc_data *vc)
--
2.22.0
