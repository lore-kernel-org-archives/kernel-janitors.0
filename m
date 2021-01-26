From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Tue, 26 Jan 2021 08:51:43 +0000
Subject: Re: [PATCH v2 1/2 net-next] net: mscc: ocelot: fix error handling bugs in mscc_ocelot_init_ports()
Message-Id: <20210126085142.rrr6jbm6hj6ijjzq@skbuf>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210125081940.GK20820@kadam> <YA6EW9SPE4q6x7d3@mwanda>
 <20210125161806.q5rmiqj6r3yvp3ke@skbuf> <20210126072753.GU2696@kadam>
In-Reply-To: <20210126072753.GU2696@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, Jan 26, 2021 at 10:27:53AM +0300, Dan Carpenter wrote:
> > If you resend, can you please squash this diff on top of your patch?
>
> Yep.  I will resend.  Thanks for basically writing v2 for me.  Your
> review comments were very clear but code is always 100% clear so that's
> really great.

Until the code is wrong :)

> I've never seen anyone do that before.  I should copy
> that for my own reviews and hopefully it's a new trend.

I took that from Florian, it was helpful to me when I wasn't minding my
own business and touching code I couldn't test:
https://patchwork.kernel.org/project/netdevbpf/patch/20201218223852.2717102-4-vladimir.oltean@nxp.com/#23858835

> > Also, it's strange but I don't see the v2 patches in patchwork. Did you
> > send them in-reply-to v1 or something?
>
> I did send them as a reply to v1.  Patchwork doesn't like that?

Nope.
