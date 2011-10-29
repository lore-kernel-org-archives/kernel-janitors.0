From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Sat, 29 Oct 2011 12:19:00 +0000
Subject: Re: xfrm: Assign the inner mode output function to the dst
Message-Id: <20111029121900.GA8707@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111028151822.GA12707@elgon.mountain>
In-Reply-To: <20111028151822.GA12707@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.

On Fri, Oct 28, 2011 at 06:18:24PM +0300, Dan Carpenter wrote:
> [ Hi.  Smatch is complaining about a really old patch here.  Sorry
>   for that.  I will fix it to detect better which warnings are new
>   but I saw that there was some work done in this function recently
>   so I decided to send this email anyway.  --dan ]
> 
> Hello Steffen Klassert,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 43a4dea4c9d4: "xfrm: Assign the inner mode output function 
> to the dst entry" from May 9, 2011, leads to the following Smatch 
> complaint:
> 
> net/ipv6/xfrm6_output.c +154 __xfrm6_output()
> 	 error: we previously assumed 'x' could be null (see line 149)
> 
> net/ipv6/xfrm6_output.c
>    148	
>    149		if ((x && x->props.mode = XFRM_MODE_TUNNEL) &&
>                      ^

x can't be null here. It would be a bug if __xfrm6_output() is called without
a xfrm_state attached to the skb. I think we can just remove this null check.

