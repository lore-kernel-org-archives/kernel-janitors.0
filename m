From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 21 Nov 2020 09:33:13 +0000
Subject: Re: [PATCH V2] ALSA: emu10k1: Use dma_set_mask_and_coherent to simplify code
Message-Id: <s5hlfevdpgm.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201121083747.1330299-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201121083747.1330299-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, tiwai@suse.com, dan.carpenter@oracle.com

On Sat, 21 Nov 2020 09:37:47 +0100,
Christophe JAILLET wrote:
> 
> 'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
> an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: do not update the dev_err message, to keep consistency with other dev_err

Applied, thanks.


Takashi
