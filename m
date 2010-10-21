From: David Miller <davem@davemloft.net>
Date: Thu, 21 Oct 2010 11:31:00 +0000
Subject: Re: [PATCH 2/2] drivers/net/ax88796.c: Return error code in failure
Message-Id: <20101021.043100.42796935.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287411074-19825-2-git-send-email-julia@diku.dk>
In-Reply-To: <1287411074-19825-2-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: p_gortmaker@yahoo.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Mon, 18 Oct 2010 16:11:14 +0200

> In this code, 0 is returned on failure, even though other
> failures return -ENOMEM or other similar values.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
