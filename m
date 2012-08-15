From: David Miller <davem@davemloft.net>
Date: Wed, 15 Aug 2012 00:00:10 +0000
Subject: Re: [PATCH 4/5] drivers/net/ethernet/ti/davinci_cpdma.c: Remove potential NULL dereference
Message-Id: <20120814.170010.1136116037664193225.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344959388-19719-1-git-send-email-Julia.Lawall@lip6.fr>
	<1344959388-19719-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344959388-19719-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 14 Aug 2012 17:49:47 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> If the NULL test is necessary, the initialization involving a dereference of
> the tested value should be moved after the NULL test.
> 
> The sematic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.
