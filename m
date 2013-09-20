From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 20 Sep 2013 21:50:17 +0000
Subject: Re: [patch] drm/i915: cleanup a min_t() cast
Message-Id: <20130920215017.GN32145@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130920112018.GA8655@elgon.mountain>
In-Reply-To: <20130920112018.GA8655@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Fri, Sep 20, 2013 at 02:20:18PM +0300, Dan Carpenter wrote:
> The lower layers of sysfs will not allow an "offset" of more than
> GEN7_L3LOG_SIZE and also l3_access_valid() caps it a second time.  But
> it's a little easier to audit if we don't have to worry that the
> subtraction will result in negative values.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued for -next, thanks for the patch.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
