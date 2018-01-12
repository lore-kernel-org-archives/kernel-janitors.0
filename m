From: Andy Gospodarek <andrew.gospodarek@broadcom.com>
Date: Fri, 12 Jan 2018 22:38:54 +0000
Subject: Re: [PATCH][next] bnxt_en: ensure len is ininitialized to zero
Message-Id: <20180112223854.GB61168@C02RW35GFVH8.dhcp.broadcom.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180112174633.28719-1-colin.king@canonical.com>
 <CACKFLimGMLVhUZiM5BpZUg6=jYi4MpFEbALqhK96keWvSQWg5A@mail.gmail.com>
In-Reply-To: <CACKFLimGMLVhUZiM5BpZUg6=jYi4MpFEbALqhK96keWvSQWg5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Chan <michael.chan@broadcom.com>
Cc: Colin King <colin.king@canonical.com>, Andrew Gospodarek <andrew.gospodarek@broadcom.com>, Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Fri, Jan 12, 2018 at 10:11:17AM -0800, Michael Chan wrote:
> On Fri, Jan 12, 2018 at 9:46 AM, Colin King <colin.king@canonical.com> wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > In the case where cmp_type = CMP_TYPE_RX_L2_TPA_START_CMP the
> > exit return path is via label next_rx_no_prod and cpr->rx_bytes
> > is being updated by an uninitialized value from len. Fix this by
> > initializing len to zero.
> >
> > Detected by CoverityScan, CID#1463807 ("Uninitialized scalar variable")
> >
> > Fixes: 6a8788f25625 ("bnxt_en: add support for software dynamic interrupt moderation")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > index cf6ebf1e324b..5b5c4f266f1b 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > @@ -1482,7 +1482,7 @@ static int bnxt_rx_pkt(struct bnxt *bp, struct bnxt_napi *bnapi, u32 *raw_cons,
> >         u32 tmp_raw_cons = *raw_cons;
> >         u16 cfa_code, cons, prod, cp_cons = RING_CMP(tmp_raw_cons);
> >         struct bnxt_sw_rx_bd *rx_buf;
> > -       unsigned int len;
> > +       unsigned int len = 0;
> 
> It might be better to add a new label next_rx_no_prod_no_len and have
> the TPA code paths jump there instead.
> 
> Andy, what do you think?
> 

Yes, I think that would be a better fix.  Making the TPA vs not-TPA as
explicit and intentional as possible seems like a good idea.

> >         u8 *data_ptr, agg_bufs, cmp_type;
> >         dma_addr_t dma_addr;
> >         struct sk_buff *skb;
> > --
> > 2.15.1
> >
