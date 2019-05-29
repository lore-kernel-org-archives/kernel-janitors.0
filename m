From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 29 May 2019 11:06:57 +0000
Subject: Re: [PATCH] drm/i915: selftest_lrc: Check the correct variable
Message-Id: <155912801762.13891.15171740473591714585@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190529110355.GA19119@mwanda>
In-Reply-To: <20190529110355.GA19119@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>, Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.william.auld@gmail.com>, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

Quoting Dan Carpenter (2019-05-29 12:03:55)
> We should check "request[n]" instead of just "request".
> 
> Fixes: 78e41ddd2198 ("drm/i915: Apply an execution_mask to the virtual_engine")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oops.
Reviewd-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
