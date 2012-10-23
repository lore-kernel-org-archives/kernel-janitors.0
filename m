From: Ed Cashin <ecashin@coraid.com>
Date: Tue, 23 Oct 2012 18:51:33 +0000
Subject: Re: aoe: print warning regarding a common reason for dropped transmits
Message-Id: <0B5AC521-5494-4714-8DED-D720D2E31EF5@coraid.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121023172810.GA12454@elgon.mountain>
In-Reply-To: <20121023172810.GA12454@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Oct 23, 2012, at 1:28 PM, Dan Carpenter wrote:

> Hello Ed L. Cashin,
> 
> The patch 6fde53abc51d: "aoe: print warning regarding a common reason 
> for dropped transmits" from Oct 23, 2012, leads to the following 
> warning:
> drivers/block/aoe/aoenet.c:62 tx()
> 	 error: 'skb' was already used up by dev_queue_xmit()
> 
> 61)              if (dev_queue_xmit(skb) = NET_XMIT_DROP && net_ratelimit())
> 62)                      pr_warn("aoe: packet could not be sent on %s.  %s\n",
> 63)                              skb->dev ? skb->dev->name : "netif",
> 64)                              "consider increasing tx_queue_len");
> 
> It's a use after free bug.

Thanks for the report.  The Documentation/SubmittingPatches says,

    Please note that this tag should not be added without the
    reporter's permission, especially if the problem was not
    reported in a public forum.

Which surprisingly means that I should ask you for permission before
mentioning you in a "Reported-by:" tag, even though you reported it in
a public forum.  So is it OK?

-- 
  Ed Cashin
  ecashin@coraid.com


