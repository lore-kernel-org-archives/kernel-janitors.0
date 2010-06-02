From: Roland Dreier <rdreier@cisco.com>
Date: Wed, 02 Jun 2010 21:58:35 +0000
Subject: Re: [patch 2/2] infiniband/cxgb4: add null check
Message-Id: <adaeigpqepg.fsf@roland-alpha.cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100531140152.GU5483@bicker>
In-Reply-To: <20100531140152.GU5483@bicker> (Dan Carpenter's message of "Mon,
	31 May 2010 16:01:52 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

 >  	if (status < 0) {
 > -		ep->com.cm_id->rem_ref(ep->com.cm_id);
 > +		if (ep->com.cm_id)
 > +			ep->com.cm_id->rem_ref(ep->com.cm_id);

Steve, does this make sense?
-- 
Roland Dreier <rolandd@cisco.com> || For corporate legal information go to:
http://www.cisco.com/web/about/doing_business/legal/cri/index.html
