From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Oct 2011 15:18:24 +0000
Subject: re: xfrm: Assign the inner mode output function to the dst
Message-Id: <20111028151822.GA12707@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[ Hi.  Smatch is complaining about a really old patch here.  Sorry
  for that.  I will fix it to detect better which warnings are new
  but I saw that there was some work done in this function recently
  so I decided to send this email anyway.  --dan ]

Hello Steffen Klassert,

This is a semi-automatic email about new static checker warnings.

The patch 43a4dea4c9d4: "xfrm: Assign the inner mode output function 
to the dst entry" from May 9, 2011, leads to the following Smatch 
complaint:

net/ipv6/xfrm6_output.c +154 __xfrm6_output()
	 error: we previously assumed 'x' could be null (see line 149)

net/ipv6/xfrm6_output.c
   148	
   149		if ((x && x->props.mode = XFRM_MODE_TUNNEL) &&
                     ^
Check.

   150		    ((skb->len > mtu && !skb_is_gso(skb)) ||
   151			dst_allfrag(skb_dst(skb)))) {
   152				return ip6_fragment(skb, x->outer_mode->afinfo->output_finish);
   153		}
   154		return x->outer_mode->afinfo->output_finish(skb);
                       ^^^
New dereference.

   155	}
   156	

regards,
dan carpenter

