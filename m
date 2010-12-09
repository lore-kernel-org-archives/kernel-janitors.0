From: Dan Carpenter <error27@gmail.com>
Date: Thu, 09 Dec 2010 06:04:42 +0000
Subject: Re: [PATCH] IB/uverbs: Handle large number of entries in poll CQ
Message-Id: <20101209060442.GS10623@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <adaaakfkeee.fsf@cisco.com>
In-Reply-To: <adaaakfkeee.fsf-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Dec 08, 2010 at 03:56:09PM -0800, Roland Dreier wrote:
> +	tmp.port_num		= wc->port_num;
> +	tmp.reserved		= wc->port_num;

I would probably have put a zero in tmp.reserved.

Otherwise it looks good.

regards,
dan carpenter

