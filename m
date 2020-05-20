From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Wed, 20 May 2020 15:32:57 +0000
Subject: Re: [PATCH v3] drm/amdgpu: off by one in amdgpu_device_attr_create_groups() error handling
Message-Id: <d8b26176-b3f7-500a-50f8-9282f615ec74@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <14063C7AD467DE4B82DEDB5C278E8663010E2302FA@FMSMSX108.amr.corp.intel.com>
 <20200520152556.GQ3041@kadam>
 <14063C7AD467DE4B82DEDB5C278E8663010E230378@FMSMSX108.amr.corp.intel.com>
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663010E230378@FMSMSX108.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Hawking Zhang <Hawking.Zhang@amd.com>, Rui Huang <ray.huang@amd.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Evan Quan <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, Yintian Tao <yttao@amd.com>

Am 20.05.20 um 17:31 schrieb Ruhl, Michael J:
>> -----Original Message-----
>> From: Dan Carpenter <dan.carpenter@oracle.com>
>> Sent: Wednesday, May 20, 2020 11:26 AM
>> To: Alex Deucher <alexander.deucher@amd.com>; Kevin Wang
>> <kevin1.wang@amd.com>; Ruhl, Michael J <michael.j.ruhl@intel.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>; David Airlie
>> <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Evan Quan
>> <evan.quan@amd.com>; Rui Huang <ray.huang@amd.com>; Kenneth Feng
>> <kenneth.feng@amd.com>; Yintian Tao <yttao@amd.com>; Hawking Zhang
>> <Hawking.Zhang@amd.com>; amd-gfx@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kernel-
>> janitors@vger.kernel.org
>> Subject: [PATCH v3] drm/amdgpu: off by one in
>> amdgpu_device_attr_create_groups() error handling
>>
>> This loop in the error handling code should start a "i - 1" and end at
>> "i =3D 0".  Currently it starts a "i" and ends at "i =3D 1".  The result
>> is that it removes one attribute that wasn't created yet, and leaks the
>> zeroeth attribute.
>>
>> Fixes: 4e01847c38f7 ("drm/amdgpu: optimize amdgpu device attribute code")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> v2: style change
>> v3: Fix embarrassing typo in the subject
> =F0=9F=98=8A
>
> Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

>
> m
>> drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c           | 3 +--
>> 1 files changed, 1 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>> index b75362bf0742..e809534fabd4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>> @@ -1942,9 +1942,8 @@ static int amdgpu_device_attr_create_groups(struct
>> amdgpu_device *adev,
>> 	return 0;
>>
>> failed:
>> -	for (; i > 0; i--) {
>> +	while (i--)
>> 		amdgpu_device_attr_remove(adev, &attrs[i]);
>> -	}
>>
>> 	return ret;
>> }
