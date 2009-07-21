From: David Miller <davem@davemloft.net>
Date: Tue, 21 Jul 2009 20:01:58 +0000
Subject: Re: [PATCH 10/10, corrected diffstat] drivers/net: Move a
Message-Id: <20090721.130158.220965961.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907191812010.16542@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907191812010.16542@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 19 Jul 2009 18:13:04 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> If the NULL test is necessary, then the dereferences should be moved below
> the NULL test.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
