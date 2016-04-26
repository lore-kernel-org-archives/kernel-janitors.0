From: David Miller <davem@davemloft.net>
Date: Tue, 26 Apr 2016 05:11:30 +0000
Subject: Re: [PATCH] net: tsi108: use NULL for pointer-typed argument
Message-Id: <20160426.011130.579576502644948065.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1461402422-10879-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1461402422-10879-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Apr 2016 11:07:02 +0200

> The first argument of pci_free_consistent has type struct pci_dev *, so use
> NULL instead of 0.
> 
> The semantic patch that performs this transformation is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> @@
> pci_free_consistent(
> - 0
> + NULL
>   , ...)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
