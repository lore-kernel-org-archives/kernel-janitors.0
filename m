From: David Miller <davem@davemloft.net>
Date: Tue, 11 Dec 2007 01:17:59 +0000
Subject: Re: [PATCH 3/3] Fix use of skb after netif_rx
Message-Id: <20071210.171759.78444664.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712092103560.11165@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712092103560.11165@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: fpavlic@de.ibm.com, wangchen@cn.fujitsu.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 9 Dec 2007 21:05:30 +0100 (CET)

> From: Julia Lawall <julia@diku.dk>
> 
> Recently, Wang Chen submitted a patch
> (d30f53aeb31d453a5230f526bea592af07944564) to move a call to netif_rx(skb)
> after a subsequent reference to skb, because netif_rx may call kfree_skb on
> its argument.  netif_rx_ni calls netif_rx, so the same problem occurs in
> the files below.
> 
> I have left the updating of dev->last_rx after the calls to netif_rx_ni
> because it seems time dependent, but moved the other field updates before.
> 
> This was found using the following semantic match.
> (http://www.emn.fr/x-info/coccinelle/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
