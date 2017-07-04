From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Tue, 04 Jul 2017 17:36:55 +0000
Subject: Re: [PATCH][drm-next] drm compat: ensure mode in drm_agp_info is being copied
Message-Id: <20170704173655.GX10672@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170704164822.20177-1-colin.king@canonical.com>
In-Reply-To: <20170704164822.20177-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 04, 2017 at 05:48:21PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A recent compat change removed the copying of i32.mode from info.mode.
> Add it back in to fix this removal as we currently are leaking information
> from the stack.
> 
> Detected by CoverityScan, CID#1449374 ("Unitialized scalar variable")

Folded and pushed out.
