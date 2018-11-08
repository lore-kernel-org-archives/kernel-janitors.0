From: "bfields@fieldses.org" <bfields@fieldses.org>
Date: Thu, 08 Nov 2018 17:26:33 +0000
Subject: Re: [PATCH net-next] SUNRPC: drop pointless static qualifier in xdr_get_next_encode_buffer()
Message-Id: <20181108172633.GD4947@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541642697-33860-1-git-send-email-yuehaibing@huawei.com>
 <d23105929adb66c626d382525adef77265585404.camel@hammerspace.com>
In-Reply-To: <d23105929adb66c626d382525adef77265585404.camel@hammerspace.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trondmy@hammerspace.com>
Cc: "yuehaibing@huawei.com" <yuehaibing@huawei.com>, "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>, "davem@davemloft.net" <davem@davemloft.net>, "jlayton@kernel.org" <jlayton@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, Nov 08, 2018 at 03:13:25AM +0000, Trond Myklebust wrote:
> On Thu, 2018-11-08 at 02:04 +0000, YueHaibing wrote:
> > There is no need to have the '__be32 *p' variable static since new
> > value
> > always be assigned before use it.

Applying for 4.20 and stable, thanks!

> > 
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> >  net/sunrpc/xdr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/net/sunrpc/xdr.c b/net/sunrpc/xdr.c
> > index 2bbb8d3..d80b156 100644
> > --- a/net/sunrpc/xdr.c
> > +++ b/net/sunrpc/xdr.c
> > @@ -546,7 +546,7 @@ void xdr_commit_encode(struct xdr_stream *xdr)
> >  static __be32 *xdr_get_next_encode_buffer(struct xdr_stream *xdr,
> >  		size_t nbytes)
> >  {
> > -	static __be32 *p;
> > +	__be32 *p;
> >  	int space_left;
> >  	int frag1bytes, frag2bytes;
> > 
> 
> Ouch, that's a really nasty bug that could definitely cause corruption
> if you have 2 threads simultaneously calling this function! This really
> deserves to be a stable patch.

Agreed.  Looks like I introduced that in 3.16, over 5 years ago, so I'm
a little surprised not to have seen a bug report that this would
explain.  Maybe it's just that the critical section is only a few lines
of arithemtic at the end of the function.  Also it only gets called when
an xdr reply other than a read reaches the end of a page.  So you'd need
a lot of concurrent READDIRs of large directories or something.  Still,
I'd think it would be possible.....

> Thank you, YueHaibing!
> 
> Bruce, do you want to shepherd this one in?

Yes, I've got 3 bugfixes queued up now, I should send them along later
today or tomorrow.

--b.
