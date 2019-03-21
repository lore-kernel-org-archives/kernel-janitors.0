From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 21 Mar 2019 13:31:12 +0000
Subject: Re: [PATCH v2] drm/i915/selftests: fix NULL vs IS_ERR() check in mock_context_barrier()
Message-Id: <155317507276.26447.12218949016591033751@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190321092451.GK2202@kadam> <87va0czguu.fsf@gaia.fi.intel.com>
In-Reply-To: <87va0czguu.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>, Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>

Quoting Mika Kuoppala (2019-03-21 10:01:13)
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > The mock_context() function returns NULL on error, it doesn't return
> > error pointers.
> >
> > Fixes: 85fddf0b0027 ("drm/i915: Introduce a context barrier callback")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

And pushed, thanks for the fix!
-Chris
