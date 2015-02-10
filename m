From: Joe Perches <joe@perches.com>
Date: Tue, 10 Feb 2015 14:41:59 +0000
Subject: Re: [PATCH v2 1/1] staging: ozwpan: Remove allocation from delaration line
Message-Id: <1423579319.8339.1.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150210092412.GA12753@sloth> <20150210101312.GG5206@mwanda>
In-Reply-To: <20150210101312.GG5206@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Quentin Lambert <lambert.quentin@gmail.com>, Shigekatsu Tateno <shigekatsu.tateno@atmel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2015-02-10 at 13:13 +0300, Dan Carpenter wrote:
> > diff --git a/drivers/staging/ozwpan/ozhcd.c b/drivers/staging/ozwpan/ozhcd.c
[]
> > @@ -280,8 +280,9 @@ static void oz_free_urb_link(struct oz_urb_link *urbl)
> >   */
> >  static struct oz_endpoint *oz_ep_alloc(int buffer_size, gfp_t mem_flags)
> >  {
> > -	struct oz_endpoint *ep > > -		kzalloc(sizeof(struct oz_endpoint)+buffer_size, mem_flags);
> > +	struct oz_endpoint *ep;
> > +
> > +	ep = kzalloc(sizeof(struct oz_endpoint)+buffer_size, mem_flags);
> >  	if (ep) {
> 
> Also notice how in the original code, we had to mangle the code to make
> it fit into 80 characters so the new code looks much better.

or maybe
	ep = kzalloc(sizeof(*ep) + buffer_size, mem_flags);

The current function also tests the return of ep slightly backwards.

static struct oz_endpoint *oz_ep_alloc(int buffer_size, gfp_t mem_flags)
{
	struct oz_endpoint *ep 		kzalloc(sizeof(struct oz_endpoint)+buffer_size, mem_flags);
	if (ep) {
		INIT_LIST_HEAD(&ep->urb_list);
		INIT_LIST_HEAD(&ep->link);
		ep->credit = -1;
		if (buffer_size) {
			ep->buffer_size = buffer_size;
			ep->buffer = (u8 *)(ep+1);
		}
	}
	return ep;
}

Perhaps more typical would be:

static struct oz_endpoint *oz_ep_alloc(int buffer_size, gfp_t mem_flags)
{
	struct oz_endpoint *ep;

	ep = kzalloc(sizeof(*ep) + buffer_size, mem_flags);
	if (!ep)
		return NULL;

	INIT_LIST_HEAD(&ep->urb_list);
	INIT_LIST_HEAD(&ep->link);
	ep->credit = -1;
	if (buffer_size) {
		ep->buffer_size = buffer_size;
		ep->buffer = (u8 *)(ep + 1);
	}

	return ep;
}

Maybe buffer_size should be size_t too to avoid
possible negative values.


