From: David Miller <davem@davemloft.net>
Date: Thu, 15 Sep 2011 19:42:50 +0000
Subject: Re: [PATCH v2 -next] 6LoWPAN: fix skb_copy call
Message-Id: <20110915.154250.112958765809558418.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1314879675-31989-1-git-send-email-alex.bluesman.smirnov@gmail.com>
	<1314881653-1104-1-git-send-email-alex.bluesman.smirnov@gmail.com>
In-Reply-To: <1314881653-1104-1-git-send-email-alex.bluesman.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alex.bluesman.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: eric.dumazet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-zigbee-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org

From: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Date: Thu,  1 Sep 2011 16:54:13 +0400

> This patch fixes 2 issues in lowpan_skb_deliver function:
> 1. Check for return status of skb_copy call;
> 2. Use skb_copy with proper GFP flag depending on context.
> 
> Signed-off-by: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>

Applied.
