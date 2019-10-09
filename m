From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 09 Oct 2019 09:49:11 +0000
Subject: Re: [PATCH][next] drm/i915: remove redundant variable err
Message-Id: <157061455107.18808.11664822517679571894@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191009093935.17895-1-colin.king@canonical.com>
In-Reply-To: <20191009093935.17895-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2019-10-09 10:39:35)
> From: Colin Ian King <colin.king@canonical.com>
> 
> An earlier commit removed any error assignments to err and we
> are now left with a zero assignment to err and a check that is
> always false. Clean this up by removing the redundant variable
> err and the error check.

Oh, we add one again shortly. Might as well wait.
-Chris
