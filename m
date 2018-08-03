From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 03 Aug 2018 19:43:21 +0000
Subject: Re: [PATCH] RDMA: Fix an uninitialized variable
Message-Id: <20180803194321.GA25860@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180803192431.pmisuz3qwefd45se@kili.mountain>
In-Reply-To: <20180803192431.pmisuz3qwefd45se@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 03, 2018 at 10:24:31PM +0300, Dan Carpenter wrote:
> A couple of the callers assume that ib_post_send() initializes
> *bad_send_wr.  It doesn't look like we can rely on the ->post_send()
> function to initialize it.  For example in the i40iw_post_recv()
> function and there are some error paths there which don't set it.

I think those are bugs in the drivers, if bad_wr is provided, and
post_send fails then it must be set to the wr that has a problem, left
unset/uninit is incorrect.

This is a high performance call path, so I'd prefer not to see
unnecessary babying of drivers..

Bart?

Thanks,
Jason
