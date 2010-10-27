From: David Miller <davem@davemloft.net>
Date: Wed, 27 Oct 2010 19:23:43 +0000
Subject: Re: [PATCH 5/14] drivers/net/sb1000.c: delete double assignment
Message-Id: <20101027.122343.68121252.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
	<1288088743-3725-6-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-6-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Oct 2010 12:25:34 +0200

> From: Julia Lawall <julia@diku.dk>
> 
> The other code around these duplicated assignments initializes the 0 1 2
> and 3 elements of an array, so change the initialization of the
> rx_session_id array to do the same.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
