From: David Miller <davem@davemloft.net>
Date: Thu, 13 Aug 2009 04:19:07 +0000
Subject: Re: [PATCH] drivers/net/tokenring: Use status field rather than
Message-Id: <20090812.211907.124112530.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908080846000.25176@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908080846000.25176@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sat, 8 Aug 2009 08:47:33 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> In general in this file, it is the status field, not the state field, that
> contains values like OPEN and CLOSED.  Indeed, in the first error case, it
> is the field status that is initialized.  I have thus assumed that all of
> the error handling code should be the same, and moved it to the end of the
> function to emphasize its commonality.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
