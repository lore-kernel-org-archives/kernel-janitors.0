From: David Miller <davem@davemloft.net>
Date: Tue, 12 Jun 2018 22:36:40 +0000
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: Fix an error handling path in 'meson8b_dwmac_probe()'
Message-Id: <20180612.153640.206354770292248454.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180611175227.27509-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180611175227.27509-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linus-amlogic@lists.infradead.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 11 Jun 2018 19:52:27 +0200

> If 'of_device_get_match_data()' fails, we need to release some resources as
> done in the other error handling path of this function.
> 
> Fixes: efacb568c962 ("net: stmmac: dwmac-meson: extend phy mode setting")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
