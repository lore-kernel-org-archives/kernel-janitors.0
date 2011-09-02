From: Dan Carpenter <error27@gmail.com>
Date: Fri, 02 Sep 2011 15:51:27 +0000
Subject: Re: [patch -next] caif: add error handling for allocation
Message-Id: <20110902155127.GI2430@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110902080716.GF2430@shale.localdomain>
 <CAJK669Yb6V=xr9ZvQGOKGEvmzO1JGhrHD+sR69b04EQxUjOOrQ@mail.gmail.com>
In-Reply-To: <CAJK669Yb6V=xr9ZvQGOKGEvmzO1JGhrHD+sR69b04EQxUjOOrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Sjur =?iso-8859-1?Q?Br=E6ndeland?= <sjurbren@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, "open list:CAIF NETWORK LAYER" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Sep 02, 2011 at 11:40:23AM +0200, Sjur Br=E6ndeland wrote:
> Thank you for your patch.
> When reviewing this I found another potential memory leak as well.
> If cffrml_create fails, we might be leaking the phy_driver.
> So perhaps you could do kfree(phy_driver) in out_err: as well, while
> you are at it?
>=20

Good point.  A kfree(phy_driver) would fix the leak.  But why does
cfserl_create() return &this->layer; instead of just "return this;"
Their equivalent now, but if you change the cfserl struct it will
break the kfree().

I'll be travelling for a while, so I may be out of reach until
Wednessday.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
