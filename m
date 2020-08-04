From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Aug 2020 11:15:49 +0000
Subject: Re: [PATCH] md-cluster: Fix potential error pointer dereference in resize_bitmaps()
Message-Id: <20200804111549.GN5493@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200804101645.GB392148@mwanda>
 <824849e0-c98d-1f22-817c-7a76d3ee22b1@cloud.ionos.com>
In-Reply-To: <824849e0-c98d-1f22-817c-7a76d3ee22b1@cloud.ionos.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Cc: Song Liu <song@kernel.org>, Shaohua Li <shli@fb.com>, NeilBrown <neilb@suse.com>, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 04, 2020 at 12:40:18PM +0200, Guoqing Jiang wrote:
>=20
>=20
> On 8/4/20 12:16 PM, Dan Carpenter wrote:
> > The error handling calls md_bitmap_free(bitmap) which checks for NULL
> > but will Oops if we pass an error pointer.  Let's set "bitmap" to NULL
> > on this error path.
> >=20
> > Fixes: afd756286083 ("md-cluster/raid10: resize all the bitmaps before =
start reshape")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/md/md-cluster.c | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/md/md-cluster.c b/drivers/md/md-cluster.c
> > index 73fd50e77975..d50737ec4039 100644
> > --- a/drivers/md/md-cluster.c
> > +++ b/drivers/md/md-cluster.c
> > @@ -1139,6 +1139,7 @@ static int resize_bitmaps(struct mddev *mddev, se=
ctor_t newsize, sector_t oldsiz
> >   		bitmap =3D get_bitmap_from_slot(mddev, i);
> >   		if (IS_ERR(bitmap)) {
> >   			pr_err("can't get bitmap from slot %d\n", i);
> > +			bitmap =3D NULL;
> >   			goto out;
> >   		}
> >   		counts =3D &bitmap->counts;
>=20
> Thanks for the catch, Reviewed-by: Guoqing Jiang
> <guoqing.jiang@cloud.ionos.com>
>=20
> BTW, seems there could be memory leak in the function since it keeps
> allocate bitmap
> in the loop ..., will send a format patch.
>=20
>=20
> diff --git a/drivers/md/md-cluster.c b/drivers/md/md-cluster.c
> index 73fd50e77975..89d7b32489d8 100644
> --- a/drivers/md/md-cluster.c
> +++ b/drivers/md/md-cluster.c
> @@ -1165,6 +1165,8 @@ static int resize_bitmaps(struct mddev *mddev,
> sector_t newsize, sector_t oldsiz
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
* can't resize bitmap
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
*/
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 got=
o out;
> +
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 md_bitmap_free(bitmap);

Hm...  I'm now not at all certain my patch is correct.  Although it's
obviously harmless and fixes an Oops.  I had thought that that the call
to update_bitmap_size(mddev, oldsize) would free the rest of the loop.

I really suspect adding a free like you're suggesting will break the
success path.

I'm not familiar with this code at all.

regards,
dan carpenter
