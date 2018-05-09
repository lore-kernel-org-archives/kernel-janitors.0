From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Wed, 09 May 2018 09:31:33 +0000
Subject: Re: [PATCH] drm/i915/dp: fix spelling mistake: "seqeuncer" -> "sequencer"
Message-Id: <87efil41l6.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180509091908.13804-1-colin.king@canonical.com>
In-Reply-To: <20180509091908.13804-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 09 May 2018, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fix to spelling mistake in WARN warning message text

While at it, would you mind fixing the plethora of "seqeuencer" typos in
the comments in the same file please?

BR,
Jani.

>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
> index dde92e4af5d3..914389f67458 100644
> --- a/drivers/gpu/drm/i915/intel_dp.c
> +++ b/drivers/gpu/drm/i915/intel_dp.c
> @@ -513,7 +513,7 @@ vlv_power_sequencer_kick(struct intel_dp *intel_dp)
>  	uint32_t DP;
>  
>  	if (WARN(I915_READ(intel_dp->output_reg) & DP_PORT_EN,
> -		 "skipping pipe %c power seqeuncer kick due to port %c being active\n",
> +		 "skipping pipe %c power sequencer kick due to port %c being active\n",
>  		 pipe_name(pipe), port_name(intel_dig_port->base.port)))
>  		return;

-- 
Jani Nikula, Intel Open Source Technology Center
