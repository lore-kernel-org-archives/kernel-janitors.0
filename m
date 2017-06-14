From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 14 Jun 2017 09:29:57 +0000
Subject: Re: [PATCH] drm/i915/selftests: silence a bogus spammy warning
Message-Id: <149743259737.8322.6017982413149967347@mail.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614091452.GE29394@elgon.mountain>
In-Reply-To: <20170614091452.GE29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel.vetter@intel.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>

Quoting Dan Carpenter (2017-06-14 10:14:52)
> These tests are reversed so it complains on every successful call and
> stays quiet for every failure.  Also we may as well preserve the error
> code.

The test is correct. The expectation here is that i915_gem_object_ggtt_pin()
fails and reports ENOSPC as we have already allocated the entire GGTT. If it
doesn't then we report the test failure.
-Chris
