From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Sep 2019 07:06:13 +0000
Subject: Re: [PATCH] media: v4l: cadence: Fix how unsued lanes are handled in 'csi2rx_start()'
Message-Id: <20190917070613.GA2959@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190912204450.17625-1-christophe.jaillet@wanadoo.fr>
 <20190913075709.t35ggip624tybd6l@localhost.localdomain>
 <20190916062846.GD18977@kadam>
 <f67787da-dc1c-3e05-c1e2-e8737641dfd0@wanadoo.fr>
In-Reply-To: <f67787da-dc1c-3e05-c1e2-e8737641dfd0@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Maxime Ripard <mripard@kernel.org>, mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Sep 16, 2019 at 09:24:26PM +0200, Christophe JAILLET wrote:
> Le 16/09/2019 =E0 08:28, Dan Carpenter a =E9crit=A0:
> > On Fri, Sep 13, 2019 at 09:57:09AM +0200, Maxime Ripard wrote:
> > > Hi Christophe,
> > >=20
> > > On Thu, Sep 12, 2019 at 10:44:50PM +0200, Christophe JAILLET wrote:
> > > > The 2nd parameter of 'find_first_zero_bit()' is a number of bits, n=
ot of
> > > > bytes. So use 'BITS_PER_LONG' instead of 'sizeof(lanes_used)'.
> > > >=20
> > > > Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX=
 driver")
> > > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > > ---
> > > > This patch is purely speculative. Using BITS_PER_LONG looks logical=
 to me,
> > > > but I'm not 100% sure that it is what is expected here. 'csi2rx->ma=
x_lanes'
> > > > could also be a good candidate.
> > > Yeah, csi2rx->max_lanes would make more sense in that context. Could
> > > you resend a new version?
> > This is sort of unrelated, but for Smatch purposes the csi2rx->max_lanes
> > comes from the firmware in csi2rx_parse_dt() and it could be any u8
> > value.
>=20
> Hi Dan,
>=20
> not sure to follow you.
>=20
> csi2rx_probe()
> =A0 --> csi2rx_get_resources()
> =A0 =A0=A0 -->=A0 ...
> =A0=A0=A0 =A0=A0=A0=A0=A0 dev_cfg =3D readl(csi2rx->base + CSI2RX_DEVICE_=
CFG_REG);
> =A0=A0=A0 =A0=A0=A0 =A0 ...
> =A0=A0=A0 =A0=A0=A0=A0=A0 csi2rx->max_lanes =3D dev_cfg & 7;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (csi2rx->max_lanes > CSI2RX_LANES_MAX) {
> =A0=A0=A0 =A0=A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Invalid number of lanes=
: %u\n",
> =A0=A0=A0 =A0=A0=A0 =A0=A0 =A0 =A0 =A0 =A0 =A0 csi2rx->max_lanes);
> =A0 =A0 =A0 =A0=A0 =A0=A0=A0 return -EINVAL;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>=20
> So I guess, that we can trust max_lanes because of the 'if (... >
> CSI2RX_LANES_MAX)' check.
>=20
> Did I miss something?

Ugh...  I was looking at ->num_lanes and I was also just totally wrong.
Smatch parses that badly.  Smatch actually parses ->max_lanes correctly
though so that's ok.

Sorry for the noise on this.

regards,
dan carpenter
