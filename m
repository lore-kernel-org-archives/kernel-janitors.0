From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Aug 2017 13:14:39 +0000
Subject: Re: [PATCH] drm/amdgpu: potential shift wrapping bug
Message-Id: <20170810131438.tw5x5nw5iybdlfor@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170810121659.7k2pqemqnd3px2qi@mwanda>
 <1c9843bd-8c8f-b6f7-d413-ebb508c97930@vodafone.de>
 <20170810125344.6g2tbgdr5xyhudly@mwanda>
 <b13fa138-4a14-50bc-953d-0f6ce11d8744@amd.com>
In-Reply-To: <b13fa138-4a14-50bc-953d-0f6ce11d8744-5C7GfCeVMHo@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Cc: Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Harish Kasiviswanathan <Harish.Kasiviswanathan-5C7GfCeVMHo@public.gmane.org>, Felix Kuehling <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "Zhang, Jerry" <Jerry.Zhang-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Alex Xie <AlexBin.Xie-5C7GfCeVMHo@public.gmane.org>

On Thu, Aug 10, 2017 at 03:02:53PM +0200, Christian K=F6nig wrote:
> Am 10.08.2017 um 14:53 schrieb Dan Carpenter:
> > On Thu, Aug 10, 2017 at 02:30:15PM +0200, Christian K=F6nig wrote:
> > > Am 10.08.2017 um 14:16 schrieb Dan Carpenter:
> > > > "frag_align" is a u64, so presumably we want to use the high bits as
> > > > well instead of shift wrapping.
> > > >=20
> > > > Fixes: 6be7adb37d9b ("drm/amdgpu: increase fragmentation size for V=
ega10 v2")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > The fragment field has only 5bits in hardware and can never be more t=
han 31,
> > > so the correct fix would actually be using uint32_t here instead.
> > >=20
> > Changing it to uint32_t introduces a new static checker warning:
> >=20
> >      drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1465 amdgpu_vm_frag_ptes()
> >      warn: was expecting a 64 bit value instead of '~(frag_align - 1)'
> >=20
> > Unfortunately, I get so many thousands of those I can't normally even
> > review that sort of bug...
> >=20
> > Let me resend the original patch but with a modified changelog to say
> > that the bug is a false positive.
>=20
> Ah, yes of course that's why I made it a 64bit value in the first place.
>=20
> Mhm, could we use something like (u32)(1 << pages_per_frag) instead to
> silence the static checker warning?

That wouldn't silence it and I think that's not super pretty either.

>=20
> It doesn't make much sense to use a 64bit shift here.
>=20

I'm just going to ignore the warning.  This driver isn't part of my
.config so I'm not really compiling it the way it was designed which
means I don't have the cross function database enabled.  Probably if I
compiled this normally, I wouldn't even get the warning.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
