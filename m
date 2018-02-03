From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Feb 2018 17:40:50 +0000
Subject: [PATCH 4/6] hid-prodikeys: Delete an unnecessary return statement in pcmidi_send_note()
Message-Id: <92011980-048c-f44b-a064-d2a917b2f51a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c388b4d8-fa43-1bf2-e27d-1a3a8d636118@users.sourceforge.net>
In-Reply-To: <c388b4d8-fa43-1bf2-e27d-1a3a8d636118@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Feb 2018 17:33:40 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-prodikeys.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
index 7672f723b268..c9eae92ad429 100644
--- a/drivers/hid/hid-prodikeys.c
+++ b/drivers/hid/hid-prodikeys.c
@@ -235,8 +235,6 @@ static void pcmidi_send_note(struct pcmidi_snd *pm,
 
 drop_note:
 	spin_unlock_irqrestore(&pm->rawmidi_in_lock, flags);
-
-	return;
 }
 
 static void pcmidi_sustained_note_release(struct timer_list *t)
-- 
2.16.1

