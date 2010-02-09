From: David Miller <davem@davemloft.net>
Date: Tue, 09 Feb 2010 06:44:59 +0000
Subject: Re: [PATCH 8/11] drivers/net: Correct NULL test
Message-Id: <20100208.224459.02579519.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1002060943580.8092@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1002060943580.8092@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: p_gortmaker@yahoo.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sat, 6 Feb 2010 09:44:15 +0100 (CET)

> From: Julia Lawall <julia@diku.dk>
> 
> Test the value that was just allocated rather than the previously tested one.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)

Hehe, every time I read that tool name I hear "Coco Channel" :-)

> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks!
