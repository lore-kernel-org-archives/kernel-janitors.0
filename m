From: David Miller <davem@davemloft.net>
Date: Thu, 14 Apr 2016 04:35:53 +0000
Subject: Re: [PATCH] qdisc: constify meta_type_ops structures
Message-Id: <20160414.003553.1230847109093798091.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460191762-10986-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1460191762-10986-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: jhs@mojatatu.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat,  9 Apr 2016 10:49:22 +0200

> The meta_type_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thank you.
