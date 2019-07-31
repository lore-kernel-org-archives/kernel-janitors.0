From: David Miller <davem@davemloft.net>
Date: Wed, 31 Jul 2019 15:38:49 +0000
Subject: Re: [PATCH 1/2] net: ag71xx: Slighly simplify code in 'ag71xx_rings_init()'
Message-Id: <20190731.083849.181428798865323625.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564560130.git.christophe.jaillet@wanadoo.fr>
        <08fbcfe0f913644fe538656221a15790a1a83f1d.1564560130.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <08fbcfe0f913644fe538656221a15790a1a83f1d.1564560130.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: jcliburn@gmail.com, chris.snook@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 31 Jul 2019 10:06:38 +0200

> A few lines above, we have:
>    tx_size = BIT(tx->order);
> 
> So use 'tx_size' directly to be consistent with the way 'rx->descs_cpu' and
> 'rx->descs_dma' are computed below.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to net-next.
