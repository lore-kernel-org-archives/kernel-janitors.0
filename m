From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 09 Aug 2010 15:51:29 +0000
Subject: Re: [patch] radeon: handle errors in radeon_hwmon_init()
Message-Id: <AANLkTinMg5vjSrEbB7mJmjxKSqseV+BHz3hU2K_4jL3P@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100807222042.GE9031@bicker>
	<AANLkTi=ypWxuTiAZgYBi4s=Kda8eeihm7p4u0qQBy0Su@mail.gmail.com>
In-Reply-To: <AANLkTi=ypWxuTiAZgYBi4s=Kda8eeihm7p4u0qQBy0Su@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, Matthew Garrett <mjg@redhat.com>

2010/8/7 Rafał Miłecki <zajec5@gmail.com>:
> 2010/8/8 Dan Carpenter <error27@gmail.com>:
>> Smatch complained that the ERR_PTR from hwmon_device_register() wasn't
>> handled.  I added some error handling in radeon_hwmon_init() to silence
>> the warning.
>>
>> Unfortunately errors from radeon_pm_init() aren't handled so this
>> doesn't really make a difference beyond silencing the warning.
>>
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> Didn't we try to switch from DRM_ERROR to dev_err? I think that's
> preferred method.

Other than that, the patch looks fine.

Reviewed-by: Alex Deucher <alexdeucher@gmail.com>
