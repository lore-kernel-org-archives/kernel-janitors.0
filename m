From: Roland Dreier <rdreier@cisco.com>
Date: Thu, 09 Dec 2010 07:32:28 +0000
Subject: Re: [PATCH] IB/uverbs: Handle large number of entries in poll CQ
Message-Id: <adatyiniepf.fsf@cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <adaaakfkeee.fsf@cisco.com> <20101209060442.GS10623@bicker>
In-Reply-To: <20101209060442.GS10623@bicker> (Dan Carpenter's message of "Thu,
	9 Dec 2010 09:04:42 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

 > > +	tmp.reserved		= wc->port_num;

 > I would probably have put a zero in tmp.reserved.

Ugh, that's what I meant to do.  Thanks.

 - R.
