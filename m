From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 15 Aug 2017 08:09:53 +0000
Subject: [PATCH 2/3] HID: prodikeys: constify snd_rawmidi_ops structures
Message-Id: <1502784594-14670-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org

This snd_rawmidi_ops structure is only passed as the third
argument of snd_rawmidi_set_ops.  This argument is const, so the
snd_rawmidi_ops structure can be const too.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/hid/hid-prodikeys.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
index f095bf8..49c4bd3 100644
--- a/drivers/hid/hid-prodikeys.c
+++ b/drivers/hid/hid-prodikeys.c
@@ -593,7 +593,7 @@ static void pcmidi_in_trigger(struct snd_rawmidi_substream *substream, int up)
 	pm->in_triggered = up;
 }
 
-static struct snd_rawmidi_ops pcmidi_in_ops = {
+static const struct snd_rawmidi_ops pcmidi_in_ops = {
 	.open = pcmidi_in_open,
 	.close = pcmidi_in_close,
 	.trigger = pcmidi_in_trigger

