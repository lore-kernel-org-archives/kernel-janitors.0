From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 31 Aug 2018 02:50:15 +0000
Subject: Re: [PATCH][net-next] xdp: remove redundant variable 'headroom'
Message-Id: <20180831025013.yiukmlw6o7gedevg@ast-mbp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180830142718.10850-1-colin.king@canonical.com>
 <ec579a7c-345b-f462-95ac-f36de1072614@intel.com>
In-Reply-To: <ec579a7c-345b-f462-95ac-f36de1072614@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Cc: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Jesper Dangaard Brouer <brouer@redhat.com>, netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Aug 30, 2018 at 04:37:50PM +0200, Björn Töpel wrote:
> On 2018-08-30 16:27, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Variable 'headroom' is being assigned but is never used hence it is
> > redundant and can be removed.
> > 
> > Cleans up clang warning:
> > variable ‘headroom’ set but not used [-Wunused-but-set-variable]
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >   net/core/xdp.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/net/core/xdp.c b/net/core/xdp.c
> > index 654dbb19707e..4b2b194f4f1f 100644
> > --- a/net/core/xdp.c
> > +++ b/net/core/xdp.c
> > @@ -412,7 +412,7 @@ EXPORT_SYMBOL_GPL(xdp_attachment_setup);
> >   struct xdp_frame *xdp_convert_zc_to_xdp_frame(struct xdp_buff *xdp)
> >   {
> > -	unsigned int metasize, headroom, totsize;
> > +	unsigned int metasize, totsize;
> >   	void *addr, *data_to_copy;
> >   	struct xdp_frame *xdpf;
> >   	struct page *page;
> > @@ -420,7 +420,6 @@ struct xdp_frame *xdp_convert_zc_to_xdp_frame(struct xdp_buff *xdp)
> >   	/* Clone into a MEM_TYPE_PAGE_ORDER0 xdp_frame. */
> >   	metasize = xdp_data_meta_unsupported(xdp) ? 0 :
> >   		   xdp->data - xdp->data_meta;
> > -	headroom = xdp->data - xdp->data_hard_start;
> >   	totsize = xdp->data_end - xdp->data + metasize;
> >   	if (sizeof(*xdpf) + totsize > PAGE_SIZE)
> > 
> 
> This should go via bpf-next. Thanks for the fix!
> 
> Acked-by: Björn Töpel <bjorn.topel@intel.com>

Applied, Thanks
