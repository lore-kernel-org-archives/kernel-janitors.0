From: David Miller <davem@davemloft.net>
Date: Tue, 25 Aug 2015 20:39:35 +0000
Subject: Re: [PATCH 03/11] net: davinci_emac: fix error return code
Message-Id: <20150825.133935.297421900575852606.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440288682-12732-1-git-send-email-Julia.Lawall@lip6.fr>
	<1440288682-12732-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440288682-12732-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Aug 2015 02:11:14 +0200

> Propagate error code on failure.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
