From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:27 +0000
Subject: [KJ] [PATCH][26/26] sound/usb/usx2y/* - compile warning cleanup
Message-Id: <420BEF83.12146.586F29@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72547343302350242=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============72547343302350242==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - remove unused automatic variable  
Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/sound/usb/usx2y/usbusx2yaudio.c linux-2.6.11-rc3-mm/sound/usb/usx2y/usbusx2yaudio.c
--- linux-2.6.11-rc3-mm-original/sound/usb/usx2y/usbusx2yaudio.c	2005-02-03 03:55:52.000000000 +0200
+++ linux-2.6.11-rc3-mm/sound/usb/usx2y/usbusx2yaudio.c	2005-02-07 21:15:02.000000000 +0200
@@ -415,7 +415,6 @@ static int usX2Y_urbs_allocate(snd_usX2Y
 	unsigned int pipe;
 	int is_playback = subs == subs->usX2Y->subs[SNDRV_PCM_STREAM_PLAYBACK];
 	struct usb_device *dev = subs->usX2Y->chip.dev;
-	struct usb_host_endpoint *ep;
 
 	pipe = is_playback ? usb_sndisocpipe(dev, subs->endpoint) :
 			usb_rcvisocpipe(dev, subs->endpoint);




--===============72547343302350242==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72547343302350242==--
