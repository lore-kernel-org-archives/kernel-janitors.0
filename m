From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 08 Jan 2019 16:44:25 +0000
Subject: Re: [PATCH 20/20] cw1200: drop useless LIST_HEAD
Message-Id: <alpine.DEB.2.20.1901081744100.13248@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>        <1545555435-24576-21-git-send-email-Julia.Lawall@lip6.fr> <87bm4rru12.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87bm4rru12.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Solomon Peachy <pizza@shaftnet.org>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org



On Tue, 8 Jan 2019, Kalle Valo wrote:

> Julia Lawall <Julia.Lawall@lip6.fr> writes:
>
> > Drop LIST_HEAD where the variable it declares has never
> > been used.
> >
> > The semantic patch that fixes this problem is as follows:
> > (http://coccinelle.lip6.fr/)
> >
> > // <smpl>
> > @@
> > identifier x;
> > @@
> > - LIST_HEAD(x);
> >   ... when != x
> > // </smpl>
> >
> > Fixes: a910e4a94f692 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > ---
> > Successfully 0-day tested on 151 configurations.
>
> I assume I can take this to wireless-drivers-next. If you are planning
> to push this via some other tree please let me know.

Please take it.  Thanks.

julia
