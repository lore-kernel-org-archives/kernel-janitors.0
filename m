From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Aug 2017 12:53:44 +0000
Subject: Re: [PATCH] drm/amdgpu: potential shift wrapping bug
Message-Id: <20170810125344.6g2tbgdr5xyhudly@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170810121659.7k2pqemqnd3px2qi@mwanda>
 <1c9843bd-8c8f-b6f7-d413-ebb508c97930@vodafone.de>
In-Reply-To: <1c9843bd-8c8f-b6f7-d413-ebb508c97930-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christian =?iso-8859-1?Q?K=F6nig?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
Cc: Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Harish Kasiviswanathan <Harish.Kasiviswanathan-5C7GfCeVMHo@public.gmane.org>, Felix Kuehling <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "Zhang, Jerry" <Jerry.Zhang-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Alex Xie <AlexBin.Xie-5C7GfCeVMHo@public.gmane.org>

On Thu, Aug 10, 2017 at 02:30:15PM +0200, Christian K=F6nig wrote:
> Am 10.08.2017 um 14:16 schrieb Dan Carpenter:
> > "frag_align" is a u64, so presumably we want to use the high bits as
> > well instead of shift wrapping.
> >=20
> > Fixes: 6be7adb37d9b ("drm/amdgpu: increase fragmentation size for Vega1=
0 v2")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> The fragment field has only 5bits in hardware and can never be more than =
31,
> so the correct fix would actually be using uint32_t here instead.
>=20

Changing it to uint32_t introduces a new static checker warning:

    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1465 amdgpu_vm_frag_ptes()
    warn: was expecting a 64 bit value instead of '~(frag_align - 1)'

Unfortunately, I get so many thousands of those I can't normally even
review that sort of bug...

Let me resend the original patch but with a modified changelog to say
that the bug is a false positive.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
