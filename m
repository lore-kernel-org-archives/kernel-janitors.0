From: David Miller <davem@davemloft.net>
Date: Thu, 02 Feb 2012 19:37:49 +0000
Subject: Re: [PATCH 2/3 v2] drivers/net/ethernet/ti: Move call to PTR_ERR after reassignment
Message-Id: <20120202.143749.209790216360616297.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328194382-32465-1-git-send-email-Julia.Lawall@lip6.fr>
	<1328194382-32465-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1328194382-32465-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu,  2 Feb 2012 15:53:01 +0100

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> PTR_ERR should be called before its argument is cleared.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> Reported-by: Josh Triplett <josh@joshtriplett.org>

Applied, thanks.
