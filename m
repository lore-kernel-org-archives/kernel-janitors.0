From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 20 Jul 2010 15:14:52 +0000
Subject: Re: [PATCH 05/16] trivial: use ARRAY_SIZE
Message-Id: <alpine.LNX.2.00.1007201714380.4741@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277726101-24567-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1277726101-24567-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhao Yakui <yakui.zhao@intel.com>, Ma Ling <ling.ma@intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

On Mon, 28 Jun 2010, Kulikov Vasiliy wrote:

> Change sizeof(x) / sizeof(*x) to ARRAY_SIZE(x).
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/gpu/drm/i915/intel_tv.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_tv.c b/drivers/gpu/drm/i915/intel_tv.c
> index 6d553c2..d2d4e40 100644
> --- a/drivers/gpu/drm/i915/intel_tv.c
> +++ b/drivers/gpu/drm/i915/intel_tv.c
> @@ -1424,7 +1424,7 @@ intel_tv_get_modes(struct drm_connector *connector)
>  	int j, count = 0;
>  	u64 tmp;
>  
> -	for (j = 0; j < sizeof(input_res_table) / sizeof(input_res_table[0]);
> +	for (j = 0; j < ARRAY_SIZE(input_res_table);
>  	     j++) {
>  		struct input_res *input = &input_res_table[j];

Folded into the sdvo change you did and applied.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
