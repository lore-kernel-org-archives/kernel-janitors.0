From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Nov 2018 16:12:32 +0000
Subject: [PATCH] staging: speakup: i18n: fix spelling mistake "phoneticly" -> "phonetically"
Message-Id: <20181128161232.14907-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, speakup@linux-speakup.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in array speakup_default_msgs at index
MSG_FUNCNAME_SPELL_WORD_PHONETICALLY, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/speakup/i18n.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/speakup/i18n.c b/drivers/staging/speakup/i18n.c
index cea8707653f5..ee240d36f947 100644
--- a/drivers/staging/speakup/i18n.c
+++ b/drivers/staging/speakup/i18n.c
@@ -336,7 +336,7 @@ static char *speakup_default_msgs[MSG_LAST_INDEX] = {
 	[MSG_FUNCNAME_SPELL_DELAY_DEC] = "spell delay decrement",
 	[MSG_FUNCNAME_SPELL_DELAY_INC] = "spell delay increment",
 	[MSG_FUNCNAME_SPELL_WORD] = "spell word",
-	[MSG_FUNCNAME_SPELL_WORD_PHONETICALLY] = "spell word phoneticly",
+	[MSG_FUNCNAME_SPELL_WORD_PHONETICALLY] = "spell word phonetically",
 	[MSG_FUNCNAME_TONE_DEC] = "tone decrement",
 	[MSG_FUNCNAME_TONE_INC] = "tone increment",
 	[MSG_FUNCNAME_VOICE_DEC] = "voice decrement",
-- 
2.19.1
