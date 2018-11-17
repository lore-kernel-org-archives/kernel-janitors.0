From: David Miller <davem@davemloft.net>
Date: Sat, 17 Nov 2018 03:47:39 +0000
Subject: Re: [PATCH] net: lantiq: Fix returned value in case of error in 'xrx200_probe()'
Message-Id: <20181116.194739.1234724172712558692.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181113174224.7884-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181113174224.7884-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: hauke@hauke-m.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 13 Nov 2018 18:42:24 +0100

> Return 'err' in the error handling path instead of 0.
> Return explicitly 0 in the normal path, instead of 'err', which is known
> to be 0 at this point.
> 
> Fixes: fe1a56420cf2 ("net: lantiq: Add Lantiq / Intel VRX200 Ethernet driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
