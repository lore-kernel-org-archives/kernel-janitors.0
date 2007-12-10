From: Jeff Dike <jdike@addtoit.com>
Date: Mon, 10 Dec 2007 18:03:09 +0000
Subject: Re: [PATCH 1/3] Fix use of skb after netif_rx
Message-Id: <20071210180309.GA9068@c2.user-mode-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712092101160.11165@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712092101160.11165@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: wangchen@cn.fujitsu.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Dec 09, 2007 at 09:02:31PM +0100, Julia Lawall wrote:
> Recently, Wang Chen submitted a patch
> (d30f53aeb31d453a5230f526bea592af07944564) to move a call to netif_rx(skb)
> after a subsequent reference to skb, because netif_rx may call kfree_skb on
> its argument.  The same problem occurs in some other drivers as well.
> 
> This was found using the following semantic match.
> (http://www.emn.fr/x-info/coccinelle/)

Thanks, I'll forward this on.

			Jeff

-- 
Work email - jdike at linux dot intel dot com
