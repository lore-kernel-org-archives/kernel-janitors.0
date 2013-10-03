From: David Miller <davem@davemloft.net>
Date: Thu, 03 Oct 2013 19:41:15 +0000
Subject: Re: [PATCH 19/19 v2] net: ipv4: Change variable type to bool
Message-Id: <20131003.154115.1065424099933792289.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1380716391-20214-1-git-send-email-peter.senna@gmail.com>
	<1380716391-20214-4-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1380716391-20214-4-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peter.senna@gmail.com
Cc: kuznet@ms2.inr.ac.ru, jmorris@namei.org, kaber@trash.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed,  2 Oct 2013 14:19:51 +0200

> The variable fully_acked is only assigned the values true and false.
> Change its type to bool.
> 
> The simplified semantic patch that find this problem is as
> follows (http://coccinelle.lip6.fr/):
> 
> @exists@
> type T;
> identifier b;
> @@
> - T
> + bool
>   b = ...;
>   ... when any
>   b = \(true\|false\)
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Applied.
