From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 07 Sep 2017 08:09:48 +0000
Subject: Re: [PATCH 1/3] ALSA: ymfpci: Use common error handling code in snd_card_ymfpci_probe()
Message-Id: <s5hingvj5f7.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dafe6d86-1bfd-41a8-e189-bde7ae30dea9@users.sourceforge.net>
        <c3b3d66c-1fb1-8bb9-cf00-674fd4e20afb@users.sourceforge.net>
        <20170906215120.m7ifun3doq5famva@mwanda>
        <1b93c810-34c7-8439-d7cd-c303185dfe66@users.sourceforge.net>
In-Reply-To: <1b93c810-34c7-8439-d7cd-c303185dfe66@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Dan Carpenter <dan.carpenter@oracle.com>, Bhumika Goyal <bhumirks@gmail.com>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, David Howells <dhowells@redhat.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 07 Sep 2017 09:41:39 +0200,
SF Markus Elfring wrote:
> 
> >> @@ -336,21 +331,24 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
> >>  			legacy_ctrl &= ~YMFPCI_LEGACY_FMEN;
> >>  			pci_write_config_word(pci, PCIR_DSXG_LEGACY, legacy_ctrl);
> >>  		} else if ((err = snd_opl3_hwdep_new(opl3, 0, 1, NULL)) < 0) {
> >> -			snd_card_free(card);
> >                         ^^^^^^^^^^^^^^^^^^^
> >>  			dev_err(card->dev, "cannot create opl3 hwdep\n");
> >                                 ^^^^^^^^^
> >> -			return err;
> >> +			goto free_card;
> > 
> > Heh.  I was worried that some of these re-orderings would introduce bugs
> > but actually this one fixes a use after free.
> 
> Thanks for your constructive feedback.
> 
> Does it mean that a special tag should be added to a commit message?

No need for resend, I'll add some more notes at merging.


thanks,

Takashi
