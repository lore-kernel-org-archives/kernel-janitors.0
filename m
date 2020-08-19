From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 19 Aug 2020 14:56:07 +0000
Subject: Re: [PATCH] staging: wilc1000: Fix memory leak in wilc_bus_probe
Message-Id: <20200819145607.GA3678365@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b3b1e811-a19e-8639-eb5f-e2ce714f41b9@web.de>
In-Reply-To: <b3b1e811-a19e-8639-eb5f-e2ce714f41b9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dinghao Liu <dinghao.liu@zju.edu.cn>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Adham Abozaeid <adham.abozaeid@microchip.com>, Ajay Singh <ajay.kathat@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Kangjie Lu <kjlu@umn.edu>

On Wed, Aug 19, 2020 at 04:47:59PM +0200, Markus Elfring wrote:
> > When devm_clk_get() returns -EPROBE_DEFER, spi_priv
> > should be freed just like when wilc_cfg80211_init() fails.
> 
> How do you think about to choose an imperative wording for
> a corresponding change description?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id445bf405cb331117bc98427b1ba6f12418ad17#n151
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
