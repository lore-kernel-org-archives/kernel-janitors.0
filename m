From: Jakub Kicinski <kuba@kernel.org>
Date: Tue, 08 Dec 2020 01:58:07 +0000
Subject: Re: [PATCH] dpaa2-mac: Add a missing of_node_put after of_device_is_available
Message-Id: <20201207175807.695fba40@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201206151339.44306-1-christophe.jaillet@wanadoo.fr>
        <20201207150457.arjw5geu2k6h2h2u@skbuf>
In-Reply-To: <20201207150457.arjw5geu2k6h2h2u@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ioana Ciornei <ioana.ciornei@nxp.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, 7 Dec 2020 15:04:58 +0000 Ioana Ciornei wrote:
> On Sun, Dec 06, 2020 at 04:13:39PM +0100, Christophe JAILLET wrote:
> > Add an 'of_node_put()' call when a tested device node is not available.
> > 
> > Fixes:94ae899b2096 ("dpaa2-mac: add PCS support through the Lynx module")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>  
> 
> 
> Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Applied, thanks!
