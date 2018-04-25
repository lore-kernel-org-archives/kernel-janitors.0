From: Felix Kuehling <felix.kuehling@amd.com>
Date: Wed, 25 Apr 2018 16:05:40 +0000
Subject: Re: [PATCH] drm/amdkfd: Integer overflows in ioctl
Message-Id: <06344e65-8cfa-d0f9-b966-c59fd2b16834@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180424133549.GB10167@mwanda>
 <e2b7b3c1-cadb-330f-53a8-57568d4bc877@amd.com>
 <20180425092155.ibca4sdsxr553ouv@mwanda>
In-Reply-To: <20180425092155.ibca4sdsxr553ouv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Oded Gabbay <oded.gabbay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On 2018-04-25 05:21 AM, Dan Carpenter wrote:
> On Tue, Apr 24, 2018 at 02:58:10PM -0400, Felix Kuehling wrote:
>> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>
>> We could probably add a sanity check for n_devices to avoid user mode
>> causing excessive memory allocations in the kernel. There is no good
>> reason for this to be bigger than the number of GPUs in the system. The
>> maximum number of GPUs supported due to device minor limit in DRM is 128.
>>
> 128 is sort of a magic number.  Is there a MAX_GPU define or something?
Actually, looking at drm_minor_alloc in drm_file.c, the maximum is only
64 GPUs. It's just a magic number in the code. There is no #define or
enum for this.

Regards,
=C2=A0 Felix


>
> regards,
> dan carpenter
>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
