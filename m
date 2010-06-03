From: Steve Wise <swise@opengridcomputing.com>
Date: Thu, 03 Jun 2010 02:46:20 +0000
Subject: Re: [patch 2/2] infiniband/cxgb4: add null check
Message-Id: <4C07177C.5050502@opengridcomputing.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100531140152.GU5483@bicker> <adaeigpqepg.fsf@roland-alpha.cisco.com>
In-Reply-To: <adaeigpqepg.fsf-BjVyx320WGW9gfZ95n9DRSW4+XlvGpQz@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Roland Dreier wrote:
>  >  	if (status < 0) {
>  > -		ep->com.cm_id->rem_ref(ep->com.cm_id);
>  > +		if (ep->com.cm_id)
>  > +			ep->com.cm_id->rem_ref(ep->com.cm_id);
>
> Steve, does this make sense?
>   
I actually think that ep->com.cm_id is always valid when 
connect_reply_upcall() is called.  But I'd have to test it more.  I'd 
rather not add this change unless someone convinces me that there 
actually is a path where the cm_id null...
