From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Tue, 10 Oct 2017 14:35:00 +0000
Subject: Re: [PATCH] drm/i915: remove redundant check on has_aliasing_ppgtt
Message-Id: <1507646100.7677.24.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171010134733.17516-1-colin.king@canonical.com>
In-Reply-To: <20171010134733.17516-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2017-10-10 at 14:47 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a previous check to on has_aliasing_ppgtt that returns
> 0 if it is false, so it is impossible for has_aliasing_ppgtt to
> be false on the final return of function intel_sanitize_enable_ppgtt,
> so final return in the function always will return 1.  Hence the
> redundant ternary operator can be replaced with a return 1.
> 
> Detected by CoverityScan, CID#1357136 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, I took it a few steps further and removed the variable
altogether. I Cc'd you on the patch.

Regards, Joonas
-- 
Joonas Lahtinen
Open Source Technology Center
Intel Corporation
