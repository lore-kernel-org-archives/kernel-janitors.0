From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 20 May 2014 00:30:46 +0000
Subject: Re: [PATCH 1/13] libertas: make return of 0 explicit
Message-Id: <alpine.DEB.2.10.1405200829390.2723@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400473875-22228-1-git-send-email-Julia.Lawall@lip6.fr> <1400473875-22228-2-git-send-email-Julia.Lawall@lip6.fr> <5379FCD0.2030506@cogentembedded.com>
In-Reply-To: <5379FCD0.2030506@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, kernel-janitors@vger.kernel.org, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org



On Mon, 19 May 2014, Sergei Shtylyov wrote:

> Hello.
>
> On 19-05-2014 8:31, Julia Lawall wrote:
>
> > From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> > Delete unnecessary local variable whose value is always 0 and that hides
> > the fact that the result is always 0.
>
> > A simplified version of the semantic patch that fixes this problem is as
> > follows: (http://coccinelle.lip6.fr/)
>
> > // <smpl>
> > @r exists@
> > local idexpression ret;
> > expression e;
> > position p;
> > @@
> >
> > -ret = 0;
> > ... when != ret = e
> > return
> > - ret
> > + 0
> >    ;
> > // </smpl>
>
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> > ---
> > Alternatively, was an error code intended in the bad length case, as is
> > done in process_brxed_802_11_packet?
>
> >   drivers/net/wireless/libertas/rx.c |    7 ++-----
> >   1 file changed, 2 insertions(+), 5 deletions(-)
>
> > diff --git a/drivers/net/wireless/libertas/rx.c
> > b/drivers/net/wireless/libertas/rx.c
> > index c7366b0..807c5b8 100644
> > --- a/drivers/net/wireless/libertas/rx.c
> > +++ b/drivers/net/wireless/libertas/rx.c
> [...]
> > @@ -154,10 +152,9 @@ int lbs_process_rxed_packet(struct lbs_private *priv,
> > struct sk_buff *skb)
> >   	else
> >   		netif_rx_ni(skb);
> >
> > -	ret = 0;
> >   done:
> > -	lbs_deb_leave_args(LBS_DEB_RX, "ret %d", ret);
> > -	return ret;
> > +	lbs_deb_leave_args(LBS_DEB_RX, "ret %d", 0);
>
>    Why not just "ret 0"?

OK, I wasn't sure if it was useful to keep the same number of arguments.
But I will update it, since from the definition of lbs_deb_leave_args it
seems ok.

julia
