From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 27 Oct 2019 20:40:21 +0000
Subject: Re: [PATCH] ALSA: pci: Fix memory leak in snd_korg1212_create
Message-Id: <47c90b48-8706-7860-3b87-30a7bbb726c0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191027191206.30820-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191027191206.30820-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>, Takashi Iwai <tiwai@suse.com>, Richard Fontana <rfontana@redhat.com>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>

…
> +++ b/sound/pci/korg1212/korg1212.c
…
> @@ -2398,8 +2403,10 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
>
>          for (i = 0; i < ARRAY_SIZE(snd_korg1212_controls); i++) {
>                  err = snd_ctl_add(korg1212->card, snd_ctl_new1(&snd_korg1212_controls[i], korg1212));
> -                if (err < 0)
> +		if (err < 0) {
> +			snd_korg1212_free(korg1212);
>                          return err;
> +		}

I suggest to add a jump target according to the Linux coding style
so that duplicate exception handling code can be reduced.

 	return 0;

+free_korg:
+	snd_korg1212_free(korg1212);
+	return err;
 }


Regards,
Markus
