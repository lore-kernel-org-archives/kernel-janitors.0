From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Thu, 16 Feb 2017 12:25:56 +0000
Subject: Re: [patch] drm/msm/dsi: free first element on error
Message-Id: <874lzunwyz.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170216105042.GA25544@mwanda> <87a89mnznw.fsf@intel.com> <20170216115307.GD4108@mwanda> <58A5952C.105@bfs.de>
In-Reply-To: <58A5952C.105@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rob Clark <robdclark@gmail.com>, Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, freedreno@lists.freedesktop.org

On Thu, 16 Feb 2017, walter harms <wharms@bfs.de> wrote:
> Am 16.02.2017 12:53, schrieb Dan Carpenter:
>> On Thu, Feb 16, 2017 at 01:27:47PM +0200, Jani Nikula wrote:
>>> On Thu, 16 Feb 2017, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>>> We want to free msm_host->bus_clks[0] so the > should be >=.
>>>>
>>>> Fixes: 6e0eb52eba9e ("drm/msm/dsi: Parse bus clocks from a list")
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> index 1fc07ce24686..239e79b39a45 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> @@ -437,7 +437,7 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
>>>>  
>>>>  	return 0;
>>>>  err:
>>>> -	for (; i > 0; i--)
>>>> +	for (; i >= 0; i--)
>>>>  		clk_disable_unprepare(msm_host->bus_clks[i]);
>>>
>>> By the looks of it this is also wrong. I didn't look at the functions,
>>> but you probably don't want to unprepare something where prepare failed,
>>> i.e. you want to -1 both the start and end offsets. Perhaps the right
>>> fix is
>>>
>>> 	while (i--)
>>> 		clk_disable_unprepare(msm_host->bus_clks[i]);
>>>
>>> which also seems to be widely used on error paths.
>>>
>> 
>
> We already know that programmers are bad in counting backwards ...
>
> any chance to make that into a forward loop ?

In most cases I'd agree with you. But I see that this while (i--) is
becoming somewhat of a pattern for error paths (grep for it), and I
think following patterns like this is more important. After a while, you
don't have to think about counting when you see it.

Besides, it's generally preferred to cleanup in the reverse order of
init, so a forward counting loop would require two variables here.

BR,
Jani.



>
> re,
>  wh
>
>

-- 
Jani Nikula, Intel Open Source Technology Center
