From: David Miller <davem@davemloft.net>
Date: Thu, 17 Nov 2016 04:27:07 +0000
Subject: Re: [PATCH 1/2] net: netcp: replace IS_ERR_OR_NULL by IS_ERR
Message-Id: <20161116.232707.1586517242816228983.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1479293014-18811-1-git-send-email-Julia.Lawall@lip6.fr>
        <1479293014-18811-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1479293014-18811-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: w-kwok2@ti.com, kernel-janitors@vger.kernel.org, m-karicheri2@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 16 Nov 2016 11:43:33 +0100

> knav_queue_open always returns an ERR_PTR value, never NULL.  This can be
> confirmed by unfolding the function calls and conforms to the function's
> documentation.  Thus, replace IS_ERR_OR_NULL by IS_ERR in error checks.
> 
> The change is made using the following semantic patch:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to net-next, thanks.
