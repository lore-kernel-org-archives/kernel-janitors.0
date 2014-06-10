From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 10 Jun 2014 21:18:42 +0000
Subject: Re: [patch] gma500: remove duplicate FB_REG09 define
Message-Id: <CAMeQTsaho4UbNWXy4s0KVRQpRzPU4NFG2JjOUV3V0NJD_9wWrA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140609152023.GO9600@mwanda>
	<87ppiigkfa.fsf@intel.com>
In-Reply-To: <87ppiigkfa.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alan Cox <alan@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, trivial@kernel.org, kernel-janitors@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>

On Mon, Jun 9, 2014 at 5:41 PM, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> Patrik, Alan -
>
> Should you add a MAINTAINERS entry for gma500 with one or both of you as
> maintainers? What's the status?
>
> BR,
> Jani.

Hi Jani

Adding an entry would make people think that I have time to spend on gma500
development or is in some way responsible for it. At the moment, that is sadly
not the case. I have a few things on my todo-list which I intend to fix but
after that I would much rather work on something more productive.

My gma500 itch has been scratched for quite a while and perhaps it's time to
move on.

Regards
Patrik

>
>
> On Mon, 09 Jun 2014, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> The FB_REG09 define is cut and pasted twice so we can remove the second
>> instance.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
>> index a97e38e..d75ecb3 100644
>> --- a/drivers/gpu/drm/gma500/mid_bios.c
>> +++ b/drivers/gpu/drm/gma500/mid_bios.c
>> @@ -39,7 +39,6 @@ static void mid_get_fuse_settings(struct drm_device *dev)
>>  #define FB_REG06 0xD0810600
>>  #define FB_MIPI_DISABLE  (1 << 11)
>>  #define FB_REG09 0xD0810900
>> -#define FB_REG09 0xD0810900
>>  #define FB_SKU_MASK  0x7000
>>  #define FB_SKU_SHIFT 12
>>  #define FB_SKU_100 0
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Jani Nikula, Intel Open Source Technology Center
