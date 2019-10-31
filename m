From: David Miller <davem@davemloft.net>
Date: Thu, 31 Oct 2019 00:58:37 +0000
Subject: Re: [PATCH] net: qrtr: Simplify 'qrtr_tun_release()'
Message-Id: <20191030.175837.1299236893426693343.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191030063640.25794-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191030063640.25794-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: navid.emamdoost@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 30 Oct 2019 07:36:40 +0100

> Use 'skb_queue_purge()' instead of re-implementing it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
