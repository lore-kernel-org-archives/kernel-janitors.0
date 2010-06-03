From: Steve Wise <swise@opengridcomputing.com>
Date: Thu, 03 Jun 2010 02:42:54 +0000
Subject: Re: [patch 1/2] infiniband/cxgb4: remove unneeded assignment
Message-Id: <4C0716AE.80803@opengridcomputing.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100531140053.GT5483@bicker> <adaiq61qesj.fsf@roland-alpha.cisco.com>
In-Reply-To: <adaiq61qesj.fsf-BjVyx320WGW9gfZ95n9DRSW4+XlvGpQz@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Roland Dreier wrote:
> Looks fine to me... in fact I don't see how this could have avoided a
> NULL deref here unless the compiler is already optimizing out this
> assignment, since two lines above is
>
>  	struct sk_buff *skb = NULL;
>
> before we do
>
> -	struct cpl_act_establish *rpl = cplhdr(skb);
>
> Steve?
>   
Looks ok.

