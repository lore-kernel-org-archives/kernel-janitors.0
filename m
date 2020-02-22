From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 22 Feb 2020 14:42:19 +0000
Subject: Re: [PATCH] drm/i915/gt: remove redundant assignment to variable dw
Message-Id: <158238253958.7320.701595965210976453@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200222134755.134209-1-colin.king@canonical.com>
In-Reply-To: <20200222134755.134209-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2020-02-22 13:47:55)
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable dw is being initialized with a value that is never read,
> it is assigned a new value later on. The assignment is redundant
> and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
