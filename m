From: Wang Chen <wangchen@cn.fujitsu.com>
Date: Fri, 14 Dec 2007 09:32:53 +0000
Subject: Re: [PATCH] s390/net/qeth_main.c: Fix use of skb after netif_rx
Message-Id: <47624DC5.2010803@cn.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712141025470.29947@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712141025470.29947@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: fpavlic@de.ibm.com, jgarzik@pobox.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall said the following on 2007-12-14 17:28:
> From: Julia Lawall <julia@diku.dk>
> 
> Recently, Wang Chen submitted a patch
> (d30f53aeb31d453a5230f526bea592af07944564) to move a call to netif_rx(skb)
> after a subsequent reference to skb, because netif_rx may call kfree_skb on
> its argument.  The same problem occurs in some other drivers as well.
> 

It looks good to me.

