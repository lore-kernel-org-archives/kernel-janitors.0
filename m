From: Julia Lawall <julia@diku.dk>
Date: Wed, 09 Dec 2009 13:23:32 +0000
Subject: [PATCH] drivers/usb/gadget: Use ERR_PTR/IS_ERR
Message-Id: <Pine.LNX.4.64.0912091422350.27028@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use ERR_PTR and IS_ERR rather than mixing integers and pointers.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *E;
@@

* E < 0
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/gadget/f_audio.c        |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/f_audio.c b/drivers/usb/gadget/f_audio.c
index c43c89f..0f2eee1 100644
--- a/drivers/usb/gadget/f_audio.c
+++ b/drivers/usb/gadget/f_audio.c
@@ -252,12 +252,12 @@ static struct f_audio_buf *f_audio_buffer_alloc(int buf_size)
 
 	copy_buf = kzalloc(sizeof *copy_buf, GFP_ATOMIC);
 	if (!copy_buf)
-		return (struct f_audio_buf *)-ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	copy_buf->buf = kzalloc(buf_size, GFP_ATOMIC);
 	if (!copy_buf->buf) {
 		kfree(copy_buf);
-		return (struct f_audio_buf *)-ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	return copy_buf;
@@ -332,7 +332,7 @@ static int f_audio_out_ep_complete(struct usb_ep *ep, struct usb_request *req)
 		list_add_tail(&copy_buf->list, &audio->play_queue);
 		schedule_work(&audio->playback_work);
 		copy_buf = f_audio_buffer_alloc(audio_buf_size);
-		if (copy_buf < 0)
+		if (IS_ERR(copy_buf))
 			return -ENOMEM;
 	}
 
@@ -576,6 +576,8 @@ static int f_audio_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 			usb_ep_enable(out_ep, audio->out_desc);
 			out_ep->driver_data = audio;
 			audio->copy_buf = f_audio_buffer_alloc(audio_buf_size);
+			if (IS_ERR(audio->copy_buf))
+				return -ENOMEM;
 
 			/*
 			 * allocate a bunch of read buffers
