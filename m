From: David Miller <davem@davemloft.net>
Date: Wed, 06 Jun 2018 18:01:35 +0000
Subject: Re: [PATCH] bnx2x: use the right constant
Message-Id: <20180606.140135.1343207157647295023.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1528290202-32454-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1528290202-32454-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: ariel.elior@cavium.com, kernel-janitors@vger.kernel.org, everest-linux-l2@cavium.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed,  6 Jun 2018 15:03:22 +0200

> Nearby code that also tests port suggests that the P0 constant should be
> used when port is zero.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression e,e1;
> @@
> 
> * e ? e1 : e1
> // </smpl>
> 
> Fixes: 6c3218c6f7e5 ("bnx2x: Adjust ETS to 578xx")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

This definitely looks correct.  Applied and queued up for -stable, thanks!
