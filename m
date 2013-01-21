From: David Miller <davem@davemloft.net>
Date: Mon, 21 Jan 2013 20:45:42 +0000
Subject: Re: [PATCH 4/15] drivers/net/ethernet/sfc/ptp.c: adjust duplicate test
Message-Id: <20130121.154542.567604471930324706.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358773378-4700-1-git-send-email-Julia.Lawall@lip6.fr>
	<1358773378-4700-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1358773378-4700-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: linux-net-drivers@solarflare.com, kernel-janitors@vger.kernel.org, bhutchings@solarflare.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 21 Jan 2013 14:02:48 +0100

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Delete successive tests to the same location.  rc was previously tested and
> not subsequently updated.  efx_phc_adjtime can return an error code, so the
> call is updated so that is tested instead.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to net-next, thanks.
