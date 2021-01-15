From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 15 Jan 2021 09:37:53 +0000
Subject: Re: [PATCH][next] drm/amdgpu: Add missing BOOTUP_DEFAULT to profile_name[]
Message-Id: <51efd2a7-f2cf-dc28-4b86-5e89d13564ca@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210111114638.16530-1-colin.king@canonical.com>
 <20210112100706.GF5083@kadam>
In-Reply-To: <20210112100706.GF5083@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>

On 12/01/2021 10:07, Dan Carpenter wrote:
> On Mon, Jan 11, 2021 at 11:46:38AM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> A recent change added a new BOOTUP_DEFAULT power profile mode
>> to the PP_SMC_POWER_PROFILE enum but omitted updating the
>> corresponding profile_name array.  Fix this by adding in the
>> missing BOOTUP_DEFAULT to profile_name[].
>>
> 
> Still not enough to prevent the array overflow.  It needs POWERSAVE as
> well.

Thanks for checking, but there is a 1-to-1 relation ship now:

enum PP_SMC_POWER_PROFILE {
        PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT = 0x0,
        PP_SMC_POWER_PROFILE_FULLSCREEN3D = 0x1,
        PP_SMC_POWER_PROFILE_POWERSAVING  = 0x2,
        PP_SMC_POWER_PROFILE_VIDEO        = 0x3,
        PP_SMC_POWER_PROFILE_VR           = 0x4,
        PP_SMC_POWER_PROFILE_COMPUTE      = 0x5,
        PP_SMC_POWER_PROFILE_CUSTOM       = 0x6,
        PP_SMC_POWER_PROFILE_COUNT,
};

vs

        static const char *profile_name[] = {
                                        "BOOTUP_DEFAULT",
                                        "3D_FULL_SCREEN",
                                        "POWER_SAVING",
                                        "VIDEO",
                                        "VR",
                                        "COMPUTE",
                                        "CUSTOM"};


unless I'm missing something because I've not had enough coffee.

Colin

> 
> regards,
> dan carpenter
> 
