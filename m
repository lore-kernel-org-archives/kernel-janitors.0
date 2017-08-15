From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 15 Aug 2017 08:09:52 +0000
Subject: [PATCH 1/3] usb: gadget: f_midi: constify snd_rawmidi_ops structures
Message-Id: <1502784594-14670-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

These snd_rawmidi_ops structures are only passed as the third
argument of snd_rawmidi_set_ops.  This argument is const, so the
snd_rawmidi_ops structures can be const too.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/gadget/function/f_midi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index a5719f2..71ca86c0 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -755,13 +755,13 @@ static void f_midi_out_trigger(struct snd_rawmidi_substream *substream, int up)
 		clear_bit(substream->number, &midi->out_triggered);
 }
 
-static struct snd_rawmidi_ops gmidi_in_ops = {
+static const struct snd_rawmidi_ops gmidi_in_ops = {
 	.open = f_midi_in_open,
 	.close = f_midi_in_close,
 	.trigger = f_midi_in_trigger,
 };
 
-static struct snd_rawmidi_ops gmidi_out_ops = {
+static const struct snd_rawmidi_ops gmidi_out_ops = {
 	.open = f_midi_out_open,
 	.close = f_midi_out_close,
 	.trigger = f_midi_out_trigger

