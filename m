From: David Miller <davem@davemloft.net>
Date: Tue, 14 Feb 2017 03:12:34 +0000
Subject: Re: [PATCH 1/2] net: fs_enet: Fix an error handling path
Message-Id: <20170213.221234.1010801525970370907.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170210201706.16588-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170210201706.16588-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: pantelis.antoniou@gmail.com, vbordug@ru.mvista.com, linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 10 Feb 2017 21:17:06 +0100

> 'of_node_put(fpi->phy_node)' should also be called if we branch to
> 'out_deregister_fixed_link' error handling path.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
