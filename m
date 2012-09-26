From: Mauro Carvalho Chehab <mchehab@redhat.com>
Date: Wed, 26 Sep 2012 18:17:09 +0000
Subject: Re: [samsung:v4l-next 51/121] drivers/media/usb/tlg2300/pd-alsa.c:309:3: error: implicit declaration
Message-Id: <20120926151709.46bd7165@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926160807.GD14447@localhost>
In-Reply-To: <20120926160807.GD14447@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Em Wed, 26 Sep 2012 17:50:35 +0100
Alan Cox <alan@linux.intel.com> escreveu:

> > vim +309 drivers/media/usb/tlg2300/pd-alsa.c
> >    303		ret = snd_card_create(-1, "Telegent",
> > THIS_MODULE, 0, &card); 304		if (ret != 0)
> >    305			return ret;
> >    306	
> >    307		ret = snd_pcm_new(card, "poseidon audio", 0, 0,
> > 1, &pcm); 308		if (ret < 0) {
> >  > 309			snd_free_card(card);
> 
> Umm I sent the version out then - should be snd_card_free(card) I
> think !

Yeah, I had to apply this patch on my tree, in order to fix compilation:

commit fac44ee564a54db020ad384e0de94b5d8be3c6b5
Author: Mauro Carvalho Chehab <mchehab@redhat.com>
Date:   Sun Sep 23 16:42:44 2012 -0300

    [media] pd-alsa: fix compilation breakage by commit da35de640
    
    commit da35de640 broke compilation, as it reverted the name of the
    usb card free function.
    
    Cc: Alan Cox <alan@linux.intel.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>

diff --git a/drivers/media/usb/tlg2300/pd-alsa.c b/drivers/media/usb/tlg2300/pd-alsa.c
index 0c77869..3f3e141 100644
--- a/drivers/media/usb/tlg2300/pd-alsa.c
+++ b/drivers/media/usb/tlg2300/pd-alsa.c
@@ -306,7 +306,7 @@ int poseidon_audio_init(struct poseidon *p)
 
 	ret = snd_pcm_new(card, "poseidon audio", 0, 0, 1, &pcm);
 	if (ret < 0) {
-		snd_free_card(card);
+		snd_card_free(card);
 		return ret;
 	}
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &pcm_capture_ops);

Regards,
Mauro
