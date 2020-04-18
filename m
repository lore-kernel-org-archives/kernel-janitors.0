From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 18 Apr 2020 06:47:05 +0000
Subject: Re: [PATCH][next] drm/i915: remove redundant assignment to variable test_result
Message-Id: <158719242529.2062.10865538071297156214@build.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200417160829.112776-1-colin.king@canonical.com>
In-Reply-To: <20200417160829.112776-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2020-04-17 17:08:29)
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable test_result is being initialized with a value that is
> never read and it is being updated later with a new value.  The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index d4fcc9583869..55697c5e251a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5567,7 +5567,7 @@ void intel_dp_process_phy_request(struct intel_dp *intel_dp)
>  
>  static u8 intel_dp_autotest_phy_pattern(struct intel_dp *intel_dp)
>  {
> -       u8 test_result = DP_TEST_NAK;
> +       u8 test_result;
>  
>         test_result = intel_dp_prepare_phytest(intel_dp);

Yes, this is definitely being overwritten this time :)
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
