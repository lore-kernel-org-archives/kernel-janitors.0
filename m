From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 17 Nov 2019 19:02:46 +0000
Subject: Re: [PATCH] /linux/netdevice.h: Fix checkpatch.pl comment warning
Message-Id: <alpine.DEB.2.21.1911172002050.2553@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191117185722.GA4637@Cheese>
In-Reply-To: <20191117185722.GA4637@Cheese>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Travis Davies <tdavies@darkphysics.net>
Cc: akpm@linux-foundation.org, davem@davemloft.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Te subject line does not look correct.  See what other people have done
for this file.

On Sun, 17 Nov 2019, Travis Davies wrote:

> Fix checkpatch Warning:
> '...netdevice.h:100: WARNING: Block comments use a trailing */ on a separate line'

Say what you do and why, and not just Fix X.

julia

> Signed-off-by: Travis Davies <tdavies@darkphysics.net>
>
> ---
>  include/linux/netdevice.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index c20f190b4c18..a2605e043fa2 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -95,9 +95,11 @@ void netdev_set_default_ethtool_ops(struct net_device *dev,
>  #define NET_XMIT_CN		0x02	/* congestion notification	*/
>  #define NET_XMIT_MASK		0x0f	/* qdisc flags in net/sch_generic.h */
>
> -/* NET_XMIT_CN is special. It does not guarantee that this packet is lost. It
> +/*
> + * NET_XMIT_CN is special. It does not guarantee that this packet is lost. It
>   * indicates that the device will soon be dropping packets, or already drops
> - * some packets of the same priority; prompting us to send less aggressively. */
> + * some packets of the same priority; prompting us to send less aggressively.
> + */
>  #define net_xmit_eval(e)	((e) = NET_XMIT_CN ? 0 : (e))
>  #define net_xmit_errno(e)	((e) != NET_XMIT_CN ? -ENOBUFS : 0)
>
> --
> 2.21.0
>
>
