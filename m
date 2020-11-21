From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 21 Nov 2020 08:26:51 +0000
Subject: Re: [PATCH] ALSA: emu10k1: Use dma_set_mask_and_coherent to simplify code
Message-Id: <s5htutjdsj8.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201121081632.1330159-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201121081632.1330159-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, tiwai@suse.com, dan.carpenter@oracle.com

On Sat, 21 Nov 2020 09:16:32 +0100,
Christophe JAILLET wrote:
> 
> 'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
> an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

It's a good cleanup, but ...

> With at it replace the 'card->dev' parameter passed to a 'dev_err()' call
> by an equivalent '&pci->dev' which is more consistent with the test just
> one line above.

... this will make it inconsistent with other error message lines in
the same function, OTOH.  So I don't think this part necessary to be
changed.


thanks,

Takashi
