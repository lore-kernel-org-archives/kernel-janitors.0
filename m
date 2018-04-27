From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 27 Apr 2018 14:11:20 +0000
Subject: Re: [PATCH] drm/i915/selftests: Potential uninitialized return in live_reset_whitelist()
Message-Id: <152483828060.7427.10753497461857414868@mail.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180427140616.GC19583@mwanda>
In-Reply-To: <20180427140616.GC19583@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

Quoting Dan Carpenter (2018-04-27 15:06:16)
> Smatch complains that "err" could be uninitialized at the end.  I don't
> know the code well but that seems like a reasonable warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the report, Gustavo Silva already submitted the same fixup.

commit a3997159133d56e444f0c0f56ab1ae59863912a8
Author: Gustavo A. R. Silva <gustavo@embeddedor.com>
Date:   Tue Apr 24 08:15:45 2018 -0500

    drm/i915/selftests: Fix uninitialized variable
    
    There is a potential execution path in which variable err is
    returned without being properly initialized previously.
    
    Fix this by initializing variable err to 0.

Ta,
-Chris
