From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 09:39:05 +0000
Subject: Re: [PATCH] drm/i915/selftests: silence a bogus spammy warning
Message-Id: <20170614093905.3spcvhrorjakn3oe@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614091452.GE29394@elgon.mountain>
 <149743259737.8322.6017982413149967347@mail.alporthouse.com>
In-Reply-To: <149743259737.8322.6017982413149967347@mail.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel.vetter@intel.com>

On Wed, Jun 14, 2017 at 10:29:57AM +0100, Chris Wilson wrote:
> Quoting Dan Carpenter (2017-06-14 10:14:52)
> > These tests are reversed so it complains on every successful call and
> > stays quiet for every failure.  Also we may as well preserve the error
> > code.
> 
> The test is correct. The expectation here is that i915_gem_object_ggtt_pin()
> fails and reports ENOSPC as we have already allocated the entire GGTT. If it
> doesn't then we report the test failure.
> -Chris

Ah.  Ok.  Thanks.

This was triggering a static checker warning because we're passing a
valid pointer to PTR_ERR().  Probably the easiest thing is just to
ignore the warning...

regards,
dan carpenter


