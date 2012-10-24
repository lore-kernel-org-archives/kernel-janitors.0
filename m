From: Ed Cashin <ecashin@coraid.com>
Date: Wed, 24 Oct 2012 18:22:56 +0000
Subject: Re: aoe: print warning regarding a common reason for dropped transmits
Message-Id: <590150A2-9672-4046-9160-689F3B6A8048@coraid.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121023172810.GA12454@elgon.mountain>
In-Reply-To: <20121023172810.GA12454@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Oct 24, 2012, at 2:26 AM, Dan Carpenter wrote:

> On Tue, Oct 23, 2012 at 01:51:33PM -0500, Ed Cashin wrote:
>> On Oct 23, 2012, at 1:28 PM, Dan Carpenter wrote:
>> 
>>> Hello Ed L. Cashin,
>>> 
>>> The patch 6fde53abc51d: "aoe: print warning regarding a common reason 
>>> for dropped transmits" from Oct 23, 2012, leads to the following 
>>> warning:
>>> drivers/block/aoe/aoenet.c:62 tx()
>>> 	 error: 'skb' was already used up by dev_queue_xmit()
>>> 
>>> 61)              if (dev_queue_xmit(skb) = NET_XMIT_DROP && net_ratelimit())
>>> 62)                      pr_warn("aoe: packet could not be sent on %s.  %s\n",
>>> 63)                              skb->dev ? skb->dev->name : "netif",
>>> 64)                              "consider increasing tx_queue_len");
>>> 
>>> It's a use after free bug.

By the way, what tool is generating that warning?

Thanks.

-- 
  Ed Cashin
  ecashin@coraid.com


