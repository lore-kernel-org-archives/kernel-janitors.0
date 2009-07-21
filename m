From: David Miller <davem@davemloft.net>
Date: Tue, 21 Jul 2009 20:01:32 +0000
Subject: Re: [PATCH 4/10] drivers/net: Move a dereference below a NULL test
Message-Id: <20090721.130132.152098027.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907191726140.16542@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907191726140.16542@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: eilong@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 19 Jul 2009 17:26:35 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> If the NULL test is necessary, then the dereference should be moved below
> the NULL test.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
