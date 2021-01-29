From: Jakub Kicinski <kuba@kernel.org>
Date: Fri, 29 Jan 2021 02:33:43 +0000
Subject: Re: [PATCH resend] e100: switch from 'pci_' to 'dma_' API
Message-Id: <20210128183343.06762fc6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128210736.749724-1-christophe.jaillet@wanadoo.fr>
        <268fcfd4dbd929948e8cdb58457ede1efa3898c6.camel@intel.com>
In-Reply-To: <268fcfd4dbd929948e8cdb58457ede1efa3898c6.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>
Cc: "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>, "davem@davemloft.net" <davem@davemloft.net>, "Brandeburg, Jesse" <jesse.brandeburg@intel.com>, "Brown, Aaron F" <aaron.f.brown@intel.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, 28 Jan 2021 21:45:02 +0000 Nguyen, Anthony L wrote:
> >  drivers/net/ethernet/intel/e100.c | 92 ++++++++++++++++-------------
> 
> My apologies, this patch slipped through the cracks for me. I will send
> it in my next net-next 1GbE series or Jakub you can take it directly if
> you'd like.

No preference but since I have to type a response either way let me say:

Applied, thanks!

;)
