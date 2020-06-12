From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 12 Jun 2020 07:36:09 +0000
Subject: Re: [PATCH] drm/msm: Improve exception handling in msm_gpu_crashstate_capture()
Message-Id: <56a615b6-9881-ff01-fa0f-8ea070fc03e7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, opensource.kernel@vivo.com
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>

> Function msm_gpu_crashstate_capture maybe called for several
> times, and then the state->bos is a potential memleak. Also
> the state->pos maybe alloc failed, but now without any handle.
> This change is to fix some potential memleak and add error
> handle when alloc failed.

I suggest to improve the provided information.
How do you think about a wording variant like the following?

   The function “msm_gpu_crashstate_capture” can be called multiple times.
   The members “comm”, “cmd” and “bos” of the data structure “msm_gpu_state”
   are reassigned with pointers according to dynamic memory allocations
   if the preprocessor symbol “CONFIG_DEV_COREDUMP” was defined.
   But the function “kfree” was not called for them before.

   Thus add missing actions.
   * Release previous objects.
   * Use further null pointer checks.
   * Complete the corresponding exception handling.


Would you like to add the tag “Fixes” to the commit message?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=b791d1bdf9212d944d749a5c7ff6febdba241771#n183


…
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -366,8 +366,11 @@  static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>  			if (!should_dump(submit, submit->cmd[i].idx))
>  				nr++;
>
> +		kfree(state->bos);
>  		state->bos = kcalloc(nr,
>  			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
> +		if (!state->bos)
> +			return;
…

Will there be a need to reconsider the indentation for function call parameters
in such source files?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=b791d1bdf9212d944d749a5c7ff6febdba241771#n93

Regards,
Markus
