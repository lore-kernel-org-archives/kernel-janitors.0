From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 20 Jul 2010 15:08:47 +0000
Subject: Re: [PATCH 04/16] trivial: use ARRAY_SIZE
Message-Id: <alpine.LNX.2.00.1007201708300.4741@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277726097-24534-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1277726097-24534-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>, Zhao Yakui <yakui.zhao@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Ma Ling <ling.ma@intel.com>, Ian Romanick <ian.d.romanick@intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

On Mon, 28 Jun 2010, Kulikov Vasiliy wrote:

> Change sizeof(x) / sizeof(*x) to ARRAY_SIZE(x).
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/gpu/drm/i915/intel_sdvo.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i915/intel_sdvo.c
> index 76993ac..03c231b 100644
> --- a/drivers/gpu/drm/i915/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/intel_sdvo.c
> @@ -392,13 +392,13 @@ static void intel_sdvo_debug_write(struct intel_encoder *intel_encoder, u8 cmd,
>  		DRM_LOG_KMS("%02X ", ((u8 *)args)[i]);
>  	for (; i < 8; i++)
>  		DRM_LOG_KMS("   ");
> -	for (i = 0; i < sizeof(sdvo_cmd_names) / sizeof(sdvo_cmd_names[0]); i++) {
> +	for (i = 0; i < ARRAY_SIZE(sdvo_cmd_names); i++) {
>  		if (cmd = sdvo_cmd_names[i].cmd) {
>  			DRM_LOG_KMS("(%s)", sdvo_cmd_names[i].name);
>  			break;
>  		}
>  	}
> -	if (i = sizeof(sdvo_cmd_names)/ sizeof(sdvo_cmd_names[0]))
> +	if (i = ARRAY_SIZE(sdvo_cmd_names))
>  		DRM_LOG_KMS("(%02X)", cmd);
>  	DRM_LOG_KMS("\n");
>  }

Applied to trivial queue, as linux-next as of today doesn't carry this 
patch.

Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
