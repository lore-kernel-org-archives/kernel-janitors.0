From: Steve Wise <swise@opengridcomputing.com>
Date: Thu, 03 Jun 2010 14:38:46 +0000
Subject: Re: [patch 2/2] infiniband/cxgb4: add null check
Message-Id: <4C07BE76.3000009@opengridcomputing.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100531140152.GU5483@bicker>	<adaeigpqepg.fsf@roland-alpha.cisco.com>	<4C07177C.5050502@opengridcomputing.com> <adaaarcr8qo.fsf@roland-alpha.cisco.com>
In-Reply-To: <adaaarcr8qo.fsf-BjVyx320WGW9gfZ95n9DRSW4+XlvGpQz@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Roland Dreier wrote:
>  > I actually think that ep->com.cm_id is always valid when
>  > connect_reply_upcall() is called.  But I'd have to test it more.  I'd
>  > rather not add this change unless someone convinces me that there
>  > actually is a path where the cm_id null...
>
> Then would it make sense to change the code
>
> 	if (ep->com.cm_id) {
> 		PDBG("%s ep %p tid %u status %d\n", __func__, ep,
> 		     ep->hwtid, status);
> 		ep->com.cm_id->event_handler(ep->com.cm_id, &event);
> 	}
>
> to just
>
> 	PDBG("%s ep %p tid %u status %d\n", __func__, ep,
> 	     ep->hwtid, status);
> 	ep->com.cm_id->event_handler(ep->com.cm_id, &event);
>
> ?
>   


Yes.  I haven't tested it though.    But if you wanna push it, then I'll 
test it here soon.

Steve.
