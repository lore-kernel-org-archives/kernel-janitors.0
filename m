From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 09 Apr 2020 19:19:27 +0000
Subject: Re: [PATCH] drm/i915: remove redundant assignment to variable err
Message-Id: <158645996713.23161.4368543521925428819@build.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200409133107.415812-1-colin.king@canonical.com>
In-Reply-To: <20200409133107.415812-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2020-04-09 14:31:07)
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Could be useful... No, let's not look at that function again.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
