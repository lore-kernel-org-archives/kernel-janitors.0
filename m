From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 18 Jun 2013 09:15:54 +0000
Subject: Re: [patch] drm/i915: remove a superflous semi-colon
Message-Id: <CAKMK7uGEGBKq9s7pZYw_dHnOQvUbov+kBbF8JCMHeE1Q9MutCQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130618072958.GD12329@elgon.mountain>
In-Reply-To: <20130618072958.GD12329@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, kernel-janitors@vger.kernel.org

On Tue, Jun 18, 2013 at 10:29:58AM +0300, Dan Carpenter wrote:
> This macro doesn't need a semi-colon.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Queued for -next, thanks for the patch.
-Daniel

>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index e5cc7c0..592b0eb9 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1773,7 +1773,7 @@ int __i915_add_request(struct intel_ring_buffer *ring,
>         struct drm_i915_gem_object *batch_obj,
>         u32 *seqno);
>  #define i915_add_request(ring, seqno) \
> - __i915_add_request(ring, NULL, NULL, seqno);
> + __i915_add_request(ring, NULL, NULL, seqno)
>  int __must_check i915_wait_seqno(struct intel_ring_buffer *ring,
>   uint32_t seqno);
>  int i915_gem_fault(struct vm_area_struct *vma, struct vm_fault *vmf);

--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
