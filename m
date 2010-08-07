From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Sat, 07 Aug 2010 22:25:41 +0000
Subject: Re: [patch] radeon: handle errors in radeon_hwmon_init()
Message-Id: <AANLkTi=ypWxuTiAZgYBi4s=Kda8eeihm7p4u0qQBy0Su@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100807222042.GE9031@bicker>
In-Reply-To: <20100807222042.GE9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, Matthew Garrett <mjg@redhat.com>

2010/8/8 Dan Carpenter <error27@gmail.com>:
> Smatch complained that the ERR_PTR from hwmon_device_register() wasn't
> handled.  I added some error handling in radeon_hwmon_init() to silence
> the warning.
>
> Unfortunately errors from radeon_pm_init() aren't handled so this
> doesn't really make a difference beyond silencing the warning.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Didn't we try to switch from DRM_ERROR to dev_err? I think that's
preferred method.

-- 
Rafał
