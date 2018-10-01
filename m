From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Oct 2018 19:06:05 +0000
Subject: Re: [PATCH] powerpc: signedness bug in update_flash_db()
Message-Id: <20181001190605.tczv6hnl2zsr4br6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181001164458.GB29197@mwanda>
 <6fa5827e-3346-4057-ca44-c6d9758f5837@c-s.fr>
 <20181001190254.vtuop3jqh5vrvwtq@mwanda>
In-Reply-To: <20181001190254.vtuop3jqh5vrvwtq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: christophe leroy <christophe.leroy@c-s.fr>
Cc: Geoff Levand <geoff@infradead.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>

On Mon, Oct 01, 2018 at 10:02:54PM +0300, Dan Carpenter wrote:
> On Mon, Oct 01, 2018 at 08:22:01PM +0200, christophe leroy wrote:
> >=20
> >=20
> > Le 01/10/2018 =E0 18:44, Dan Carpenter a =E9crit=A0:
> > > The "count < sizeof(struct os_area_db)" comparison is type promoted to
> > > size_t so negative values of "count" are treated as very high values =
and
> > > we accidentally return success instead of a negative error code.
> > >=20
> > > This doesn't really change runtime much but it fixes a static checker
> > > warning.
> > >=20
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >=20
> > > diff --git a/arch/powerpc/platforms/ps3/os-area.c b/arch/powerpc/plat=
forms/ps3/os-area.c
> > > index cdbfc5cfd6f3..f5387ad82279 100644
> > > --- a/arch/powerpc/platforms/ps3/os-area.c
> > > +++ b/arch/powerpc/platforms/ps3/os-area.c
> > > @@ -664,7 +664,7 @@ static int update_flash_db(void)
> > >   	db_set_64(db, &os_area_db_id_rtc_diff, saved_params.rtc_diff);
> > >   	count =3D os_area_flash_write(db, sizeof(struct os_area_db), pos);
> > > -	if (count < sizeof(struct os_area_db)) {
> > > +	if (count < 0 || count < sizeof(struct os_area_db)) {
> >=20
> > Why not simply add a cast ? :
> >=20
> > if (count < (ssize_t)sizeof(struct os_area_db)) {
> >=20
>=20
> There are so many ways to solve these and no accounting for taste.  Do
> you need me to resend or can you redo it yourself?
>=20

Btw, I just went on vacation, and I'm not going to be back until next
week.

regards,
dan carpenter
