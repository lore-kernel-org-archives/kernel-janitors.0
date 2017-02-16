From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Thu, 16 Feb 2017 12:27:08 +0000
Subject: Re: [patch v2] drm/msm/dsi: free first element on error
Message-Id: <871suynwwz.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87a89mnznw.fsf@intel.com> <20170216120028.GA29698@mwanda> <CAF6AEGuaYjRQCpLxade_Htm6tS8Zvy6JQG8dRt973C-aaPCP5g@mail.gmail.com>
In-Reply-To: <CAF6AEGuaYjRQCpLxade_Htm6tS8Zvy6JQG8dRt973C-aaPCP5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>, Hai Li <hali@codeaurora.org>, Rob Herring <robh@kernel.org>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Thu, 16 Feb 2017, Rob Clark <robdclark@gmail.com> wrote:
> On Thu, Feb 16, 2017 at 7:00 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> We're off by one here.  We free something that wasn't allocated and we
>> don't free msm_host->bus_clks[].
>>
>> Fixes: 6e0eb52eba9e ("drm/msm/dsi: Parse bus clocks from a list")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Thanks
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

And for good measure,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 1fc07ce24686..4fa32296162e 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -437,7 +437,7 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
>>
>>         return 0;
>>  err:
>> -       for (; i > 0; i--)
>> +       while (i--)
>>                 clk_disable_unprepare(msm_host->bus_clks[i]);
>>
>>         return ret;

-- 
Jani Nikula, Intel Open Source Technology Center
