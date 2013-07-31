From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 31 Jul 2013 16:31:20 +0000
Subject: Re: [patch] dlm: some checks can underflow
Message-Id: <20130731163120.GI5002@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130731090229.GD8210@elgon.mountain>
In-Reply-To: <20130731090229.GD8210@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 31, 2013 at 11:11:56AM -0400, David Teigland wrote:
> On Wed, Jul 31, 2013 at 12:02:29PM +0300, Dan Carpenter wrote:
> > This is a static checker fix.  We have several places here that check
> > the upper limit without checking for negative numbers.  One example of
> > this is in find_rsb().
> > 
> > My static checker marks endian data as user controled so.  The
> > "ms->m_header.h_length" variable is tagged as user data because it
> > starts as little endian and we convert it at the start of
> > dlm_receive_buffer().  That means that receive_extralen() returns
> > user controlled data which could be negative.  The call tree here is:
> > 
> > -> dlm_receive_buffer()
> >    -> dlm_receive_message()
> >       -> _receive_message()
> >          -> receive_request()
> > 
> >             We get "namelen" from receive_extralen(ms);
> > 
> >             -> find_rsb()
> > 
> > It's never perfectly clear how invasive to make a fix like this.  Many
> > of the changes in the patch are not needed but I wanted to make things
> > consistent.
> 
> If it's negative, I don't think it would pass the h_length validation
> in dlm_process_incoming_buffer(), but I'm not certain...

Gar, yeah.  We check that:

	if (p->header.h_cmd = DLM_MSG) {
		if (msglen < sizeof(struct dlm_message))
			break;

Which means receive_extralen() can't return negative.

We can drop this patch.

regards,
dan carpenter

