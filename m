From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Oct 2012 06:26:08 +0000
Subject: Re: aoe: print warning regarding a common reason for dropped transmits
Message-Id: <20121024062608.GE20754@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121023172810.GA12454@elgon.mountain>
In-Reply-To: <20121023172810.GA12454@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 23, 2012 at 01:51:33PM -0500, Ed Cashin wrote:
> On Oct 23, 2012, at 1:28 PM, Dan Carpenter wrote:
> 
> > Hello Ed L. Cashin,
> > 
> > The patch 6fde53abc51d: "aoe: print warning regarding a common reason 
> > for dropped transmits" from Oct 23, 2012, leads to the following 
> > warning:
> > drivers/block/aoe/aoenet.c:62 tx()
> > 	 error: 'skb' was already used up by dev_queue_xmit()
> > 
> > 61)              if (dev_queue_xmit(skb) = NET_XMIT_DROP && net_ratelimit())
> > 62)                      pr_warn("aoe: packet could not be sent on %s.  %s\n",
> > 63)                              skb->dev ? skb->dev->name : "netif",
> > 64)                              "consider increasing tx_queue_len");
> > 
> > It's a use after free bug.
> 
> Thanks for the report.  The Documentation/SubmittingPatches says,
> 
>     Please note that this tag should not be added without the
>     reporter's permission, especially if the problem was not
>     reported in a public forum.
> 
> Which surprisingly means that I should ask you for permission before
> mentioning you in a "Reported-by:" tag, even though you reported it in
> a public forum.  So is it OK?

Yes.  Reported-by credits are always welcome.

I think that documentation is wrong.  If the email was reported to a
mailing list or bugzilla then we normally add a reported-by by
default.

regards,
dan carpenter

