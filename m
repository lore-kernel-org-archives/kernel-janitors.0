From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Date: Wed, 20 May 2020 15:23:52 +0000
Subject: RE: [PATCH v2] drm/amdgpu: off by on in amdgpu_device_attr_create_groups() error handling
Message-Id: <14063C7AD467DE4B82DEDB5C278E8663010E2302FA@FMSMSX108.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520125209.GP3041@kadam> <20200520130812.GA177222@mwanda>
In-Reply-To: <20200520130812.GA177222@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Rui Huang <ray.huang@amd.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Yintian Tao <yttao@amd.com>, Evan Quan <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>

"off by on"

or=20

"off by one"

?

M

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Dan
>Carpenter
>Sent: Wednesday, May 20, 2020 9:08 AM
>To: Alex Deucher <alexander.deucher@amd.com>; Kevin Wang
><kevin1.wang@amd.com>
>Cc: David Airlie <airlied@linux.ie>; kernel-janitors@vger.kernel.org; linu=
x-
>kernel@vger.kernel.org; amd-gfx@lists.freedesktop.org; Hawking Zhang
><Hawking.Zhang@amd.com>; Rui Huang <ray.huang@amd.com>; dri-
>devel@lists.freedesktop.org; Evan Quan <evan.quan@amd.com>; Kenneth
>Feng <kenneth.feng@amd.com>; Christian K=F6nig
><christian.koenig@amd.com>; Yintian Tao <yttao@amd.com>
>Subject: [PATCH v2] drm/amdgpu: off by on in
>amdgpu_device_attr_create_groups() error handling
>
>This loop in the error handling code should start a "i - 1" and end at
>"i =3D 0".  Currently it starts a "i" and ends at "i =3D 1".  The result
>is that it removes one attribute that wasn't created yet, and leaks the
>zeroeth attribute.
>
>Fixes: 4e01847c38f7 ("drm/amdgpu: optimize amdgpu device attribute code")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
>v2: style change
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c           | 3 +--
> 1 files changed, 1 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>index b75362bf0742..e809534fabd4 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>@@ -1942,9 +1942,8 @@ static int amdgpu_device_attr_create_groups(struct
>amdgpu_device *adev,
> 	return 0;
>
> failed:
>-	for (; i > 0; i--) {
>+	while (i--)
> 		amdgpu_device_attr_remove(adev, &attrs[i]);
>-	}
>
> 	return ret;
> }
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
