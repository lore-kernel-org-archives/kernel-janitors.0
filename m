From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 07 Aug 2019 13:35:13 +0000
Subject: Re: [PATCH] drm/i915: Fix some NULL vs IS_ERR() conditions
Message-Id: <156518491397.6198.14048305337074834151@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190807122832.GA10517@mwanda>
 <156518113518.6198.15252656122354479322@skylake-alporthouse-com>
In-Reply-To: <156518113518.6198.15252656122354479322@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Quoting Chris Wilson (2019-08-07 13:32:15)
> Quoting Dan Carpenter (2019-08-07 13:28:32)
> > There were several places which check for NULL when they should have
> > been checking for IS_ERR().
> > 
> > Fixes: d8af05ff38ae ("drm/i915: Allow sharing the idle-barrier from other kernel requests")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Oops,
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

And pushed, ta.
-Chris
