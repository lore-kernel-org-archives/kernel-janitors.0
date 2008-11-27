From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 27 Nov 2008 15:04:34 +0000
Subject: Re: [PATCH] sound/pci/mixart/mixart.c: Add missing snd_card_free
Message-Id: <s5hhc5t5hx9.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0811271423040.15160@pc-004.diku.dk>
	<Pine.LNX.4.64.0811271432350.15160@pc-004.diku.dk>
	<s5hk5apz3md.wl%tiwai@suse.de>
	<Pine.LNX.4.64.0811271445310.15160@pc-004.diku.dk>
	<s5hljv55j7o.wl%tiwai@suse.de>
	<Pine.LNX.4.64.0811271539400.15160@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0811271539400.15160@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Thu, 27 Nov 2008 15:40:40 +0100 (CET),
Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> The function snd_mixart_create creates a link between mgr and card that
> allows snd_mixart_free to free card as well.  But if snd_mixart_create
> fails, then the link has not been created and card has to be freed explicitly.
> 
> 
> The semantic match that finds the problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
(snip)
> Signed-off-by: Julia Lawall <julia@diku.dk>

Thanks, applied now.


Takashi
