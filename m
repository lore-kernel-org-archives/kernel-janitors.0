From: David Dillow <dave@thedillows.org>
Date: Sun, 23 Aug 2020 20:31:01 +0000
Subject: Re: [PATCH] typhoon: switch from 'pci_' to 'dma_' API
Message-Id: <5659ca27570189d51d99d69e4bb91b7b996a7084.camel@thedillows.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200823061150.162135-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200823061150.162135-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2020-08-23 at 08:11 +0200, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has
> been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.

Looks good, thanks!

Reviewed-by: David Dillow <dave@thedillows.org>
