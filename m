From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Sep 2017 21:51:20 +0000
Subject: Re: [PATCH 1/3] ALSA: ymfpci: Use common error handling code in snd_card_ymfpci_probe()
Message-Id: <20170906215120.m7ifun3doq5famva@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dafe6d86-1bfd-41a8-e189-bde7ae30dea9@users.sourceforge.net>
 <c3b3d66c-1fb1-8bb9-cf00-674fd4e20afb@users.sourceforge.net>
In-Reply-To: <c3b3d66c-1fb1-8bb9-cf00-674fd4e20afb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Bhumika Goyal <bhumirks@gmail.com>

On Wed, Sep 06, 2017 at 09:46:52PM +0200, SF Markus Elfring wrote:
> @@ -336,21 +331,24 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
>  			legacy_ctrl &= ~YMFPCI_LEGACY_FMEN;
>  			pci_write_config_word(pci, PCIR_DSXG_LEGACY, legacy_ctrl);
>  		} else if ((err = snd_opl3_hwdep_new(opl3, 0, 1, NULL)) < 0) {
> -			snd_card_free(card);
                        ^^^^^^^^^^^^^^^^^^^
>  			dev_err(card->dev, "cannot create opl3 hwdep\n");
                                ^^^^^^^^^
> -			return err;
> +			goto free_card;

Heh.  I was worried that some of these re-orderings would introduce bugs
but actually this one fixes a use after free.

regards,
dan carpenter

