From: David Miller <davem@davemloft.net>
Date: Thu, 15 Sep 2011 19:43:22 +0000
Subject: Re: [PATCH v3 -next] 6LoWPAN: fix skb_copy call
Message-Id: <20110915.154322.1562864275867324429.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1314879675-31989-1-git-send-email-alex.bluesman.smirnov@gmail.com>
	<1314885315-4033-1-git-send-email-alex.bluesman.smirnov@gmail.com>
In-Reply-To: <1314885315-4033-1-git-send-email-alex.bluesman.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alex.bluesman.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: eric.dumazet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-zigbee-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org

From: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Date: Thu,  1 Sep 2011 17:55:15 +0400

> This patch fixes 2 issues in lowpan_skb_deliver function:
> 1. Check for return status of skb_copy call;
> 2. Use skb_copy with proper GFP flag, drop check for non-interrupt
> context.
> 
> Signed-off-by: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>

Just to make it clear, I applied -v3 of this patch not -v2. :-)

