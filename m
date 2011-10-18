From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:24:36 +0000
Subject: [patch 1/2 -next] USB: gadget: midi: fix range check in
Message-Id: <20111018062436.GL27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

! has higher precedence than >= and since neither 0 nor 1 are greater
than 8 the condition is always false.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/f_midi.c b/drivers/usb/gadget/f_midi.c
index 44858dc..ef1bc7a 100644
--- a/drivers/usb/gadget/f_midi.c
+++ b/drivers/usb/gadget/f_midi.c
@@ -644,7 +644,7 @@ static int f_midi_out_open(struct snd_rawmidi_substream *substream)
 {
 	struct f_midi *midi = substream->rmidi->private_data;
 
-	if (!substream->number >= MAX_PORTS)
+	if (substream->number >= MAX_PORTS)
 		return -EINVAL;
 
 	VDBG(midi, "%s()\n", __func__);
