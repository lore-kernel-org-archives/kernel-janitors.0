From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 09:11:19 +0000
Subject: [patch -resend] Input: ff-memless - fix a couple min_t() casts
Message-Id: <20120627091118.GX31212@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627085800.GA3007@mwanda>
In-Reply-To: <20120627085800.GA3007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Anssi Hannula <anssi.hannula@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

envelope->attack_level is a u16 type.  We're trying to clamp it here
so it's between 0 and 0x7fff.  Unfortunately, the cast to __s16 turns
all the values larger than 0x7fff into negative numbers and min_t()
thinks they are less than 0x7fff.  envelope_level is an int so now
we've got negative values stored there.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Originally sent on Mon, 26 Sep 2011.  I have added Anssi Hannula to the
CC list.

diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.c
index 5f55885..b107922 100644
--- a/drivers/input/ff-memless.c
+++ b/drivers/input/ff-memless.c
@@ -176,7 +176,7 @@ static int apply_envelope(struct ml_effect_state *state, int value,
 			 value, envelope->attack_level);
 		time_from_level = jiffies_to_msecs(now - state->play_at);
 		time_of_envelope = envelope->attack_length;
-		envelope_level = min_t(__s16, envelope->attack_level, 0x7fff);
+		envelope_level = min_t(u16, envelope->attack_level, 0x7fff);
 
 	} else if (envelope->fade_length && effect->replay.length &&
 		   time_after(now,
@@ -184,7 +184,7 @@ static int apply_envelope(struct ml_effect_state *state, int value,
 		   time_before(now, state->stop_at)) {
 		time_from_level = jiffies_to_msecs(state->stop_at - now);
 		time_of_envelope = envelope->fade_length;
-		envelope_level = min_t(__s16, envelope->fade_level, 0x7fff);
+		envelope_level = min_t(u16, envelope->fade_level, 0x7fff);
 	} else
 		return value;
 
