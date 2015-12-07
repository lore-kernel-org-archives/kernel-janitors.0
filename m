From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 07 Dec 2015 06:05:42 +0000
Subject: Re: [PATCH] net: hisilicon: constify hnae_buf_ops and hnae_ae_ops structures
Message-Id: <alpine.DEB.2.02.1512070704360.2037@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1449419097-19032-1-git-send-email-Julia.Lawall@lip6.fr> <20151206.225144.1422377179689530868.davem@davemloft.net>
In-Reply-To: <20151206.225144.1422377179689530868.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, huangdaode@hisilicon.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Sun, 6 Dec 2015, David Miller wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> Date: Sun,  6 Dec 2015 17:24:57 +0100
> 
> > The hnae_buf_ops and hnae_ae_ops structures are never modified, so declare
> > them as const.
> > 
> > Done with the help of Coccinelle.
> > 
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> This doesn't apply to net-next.

OK, will check on it.

julia

> > I have the impression that this driver is not recorded properly in the
> > MAINTAINERS file.
> 
> Patches welcome.

Who is the mintainer?  huangdaode?

thanks,
julia
