From: Carlo Perassi <carlo@linux.it>
Date: Wed, 12 Jan 2005 17:38:39 +0000
Subject: [KJ] [trivial patch] unused pointer
Message-Id: <20050112173839.GA7083@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="liOOAslEiF7prFVr"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I found by accident this unused pointer.
I do not have this driver.

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="01.patch"

Signed-off-by: Carlo Perassi <carlo@linux.it>

---

--- linux-2.6.11-rc1/sound/usb/usx2y/usbusx2yaudio.c	2005-01-12 14:35:04.000000000 +0100
+++ linux-2.6.11-rc1-mod/sound/usb/usx2y/usbusx2yaudio.c	2005-01-12 18:18:46.581417232 +0100
@@ -415,7 +415,6 @@ static int usX2Y_urbs_allocate(snd_usX2Y
 	unsigned int pipe;
 	int is_playback = subs == subs->usX2Y->subs[SNDRV_PCM_STREAM_PLAYBACK];
 	struct usb_device *dev = subs->usX2Y->chip.dev;
-	struct usb_host_endpoint *ep;
 
 	pipe = is_playback ? usb_sndisocpipe(dev, subs->endpoint) :
 			usb_rcvisocpipe(dev, subs->endpoint);

--liOOAslEiF7prFVr
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--liOOAslEiF7prFVr--
