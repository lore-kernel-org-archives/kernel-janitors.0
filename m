From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 15 Jan 2021 10:16:49 +0000
Subject: Re: [PATCH][next] drm/amdgpu: Add missing BOOTUP_DEFAULT to profile_name[]
Message-Id: <2e688654-cbac-ea86-b248-c863a2dc6747@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210111114638.16530-1-colin.king@canonical.com>
 <20210112100706.GF5083@kadam>
 <51efd2a7-f2cf-dc28-4b86-5e89d13564ca@canonical.com>
 <f57062ac-499d-95bb-cf4f-bb7b5b1dea5b@wanadoo.fr>
 <01121c1c-5e7c-9d47-2400-c7644f6b8254@canonical.com>
In-Reply-To: <01121c1c-5e7c-9d47-2400-c7644f6b8254@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin Ian King <colin.king@canonical.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>

Le 15/01/2021 à 11:10, Colin Ian King a écrit :
> On 15/01/2021 10:07, Christophe JAILLET wrote:
>> Le 15/01/2021 à 10:37, Colin Ian King a écrit :
>>> On 12/01/2021 10:07, Dan Carpenter wrote:
>>>> On Mon, Jan 11, 2021 at 11:46:38AM +0000, Colin King wrote:
>>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>>
>>>>> A recent change added a new BOOTUP_DEFAULT power profile mode
>>>>> to the PP_SMC_POWER_PROFILE enum but omitted updating the
>>>>> corresponding profile_name array.  Fix this by adding in the
>>>>> missing BOOTUP_DEFAULT to profile_name[].
>>>>>
>>>>
>>>> Still not enough to prevent the array overflow.  It needs POWERSAVE as
>>>> well.
>>>
>>> Thanks for checking, but there is a 1-to-1 relation ship now:
>>>
>>> enum PP_SMC_POWER_PROFILE {
>>>           PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT = 0x0,
>>>           PP_SMC_POWER_PROFILE_FULLSCREEN3D = 0x1,
>>>           PP_SMC_POWER_PROFILE_POWERSAVING  = 0x2,
>>>           PP_SMC_POWER_PROFILE_VIDEO        = 0x3,
>>>           PP_SMC_POWER_PROFILE_VR           = 0x4,
>>>           PP_SMC_POWER_PROFILE_COMPUTE      = 0x5,
>>>           PP_SMC_POWER_PROFILE_CUSTOM       = 0x6,
>>>           PP_SMC_POWER_PROFILE_COUNT,
>>> };
>>>
>>> vs
>>>
>>>           static const char *profile_name[] = {
>>>                                           "BOOTUP_DEFAULT",
>>>                                           "3D_FULL_SCREEN",
>>>                                           "POWER_SAVING",
>>
>> This line has been added yesterday in commit f727ebeb589d.
>> So Dan was right when he sent his patch, but some else fixed it.
> 
> Ah, my bad for not seeing that. :-/

However, I wonder if this commit is complete.
The description of the commit is about 5 modes, but 6 are listed in 
PP_SMC_POWER_PROFILE.

In the hunk:
+static struct cmn2asic_mapping 
vangogh_workload_map[PP_SMC_POWER_PROFILE_COUNT] = {
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_FULLSCREEN3D,	 
WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_VIDEO,		WORKLOAD_PPLIB_VIDEO_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_VR,			WORKLOAD_PPLIB_VR_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_COMPUTE,		WORKLOAD_PPLIB_COMPUTE_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_CUSTOM,		WORKLOAD_PPLIB_CUSTOM_BIT),
+};

It would look logical to have something like:
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_POWERSAVING,	 
WORKLOAD_PPLIB_POWER_SAVING_BIT),

Not sure at all if correct.

Just my 2c,

CJ

> 
>>
>> CJ
>>
>>>                                           "VIDEO",
>>>                                           "VR",
>>>                                           "COMPUTE",
>>>                                           "CUSTOM"};
>>>
>>>
>>> unless I'm missing something because I've not had enough coffee.
>>>
>>> Colin
>>>
>>>>
>>>> regards,
>>>> dan carpenter
>>>>
>>>
>>>
>>
> 
> 
