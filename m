From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 May 2020 12:52:09 +0000
Subject: Re: [PATCH] drm/amdgpu: off by on in amdgpu_device_attr_create_groups() error handling
Message-Id: <20200520125209.GP3041@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520120054.GB172354@mwanda>
 <62d9d539-8401-233a-3f20-984042489987@gmail.com>
In-Reply-To: <62d9d539-8401-233a-3f20-984042489987@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: christian.koenig@amd.com
Cc: David Airlie <airlied@linux.ie>, Kevin Wang <kevin1.wang@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Rui Huang <ray.huang@amd.com>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Yintian Tao <yttao@amd.com>, Evan Quan <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>

On Wed, May 20, 2020 at 02:05:19PM +0200, Christian K=F6nig wrote:
> Am 20.05.20 um 14:00 schrieb Dan Carpenter:
> > This loop in the error handling code should start a "i - 1" and end at
> > "i =3D 0".  Currently it starts a "i" and ends at "i =3D 1".  The result
> > is that it removes one attribute that wasn't created yet, and leaks the
> > zeroeth attribute.
> >=20
> > Fixes: 4e01847c38f7 ("drm/amdgpu: optimize amdgpu device attribute code=
")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_pm.c
> > index b75362bf0742..ee4a8e44fbeb 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > @@ -1931,7 +1931,7 @@ static int amdgpu_device_attr_create_groups(struc=
t amdgpu_device *adev,
> >   					    uint32_t mask)
> >   {
> >   	int ret =3D 0;
> > -	uint32_t i =3D 0;
> > +	int i;
> >   	for (i =3D 0; i < counts; i++) {
> >   		ret =3D amdgpu_device_attr_create(adev, &attrs[i], mask);
> > @@ -1942,9 +1942,8 @@ static int amdgpu_device_attr_create_groups(struc=
t amdgpu_device *adev,
> >   	return 0;
> >   failed:
> > -	for (; i > 0; i--) {
> > +	while (--i >=3D 0)
>=20
> As far as I know the common idiom for this is while (i--) which even works
> without changing the type of i to signed.

It's about 50/50, one way or the other.  To me --i >=3D 0 seems far more
readable.

I've been trying to figure out which tool tells people to make iterators
unsigned so I can help them avoid it.  :/  I understand how in theory
iterators could go above INT_MAX but if we're going above INT_MAX then
probably we should use a 64 bit type.  There are very few times where 2
billion iterations is not enough but in those situations probably 4
billion is not enough either.  So unsigned int iterators never or seldom
solve real life bugs but they regularly cause them.

regards,
dan carpenter
