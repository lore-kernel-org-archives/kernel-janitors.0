From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date: Mon, 13 Jun 2016 14:40:06 +0000
Subject: Re: [patch] drm/i915/mocs: || vs | typo in get_mocs_settings()
Message-Id: <87wpltw3sp.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160613065422.GB5993@mwanda>
In-Reply-To: <20160613065422.GB5993@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel.vetter@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> It seems pretty clear that bitwise OR was intended here and not logical
> OR.
>
> Fixes: 6fc29133eafb ('drm/i915/gen9: Add WaDisableSkipCaching')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to drm-intel-next-queued. Thanks for patch.
-Mika


>
> diff --git a/drivers/gpu/drm/i915/intel_mocs.c b/drivers/gpu/drm/i915/intel_mocs.c
> index 8f96c40..3c1482b 100644
> --- a/drivers/gpu/drm/i915/intel_mocs.c
> +++ b/drivers/gpu/drm/i915/intel_mocs.c
> @@ -162,7 +162,7 @@ static bool get_mocs_settings(struct drm_i915_private *dev_priv,
>  
>  		for (i = 0; i < table->size; i++)
>  			if (WARN_ON(table->table[i].l3cc_value &
> -				    (L3_ESC(1) || L3_SCC(0x7))))
> +				    (L3_ESC(1) | L3_SCC(0x7))))
>  				return false;
>  	}
>  
