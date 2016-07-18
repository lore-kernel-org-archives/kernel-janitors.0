From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 18 Jul 2016 06:53:51 +0000
Subject: Re: [PATCH] drm/ast: Delete an unnecessary check before drm_gem_object_unreference_unlocked()
Message-Id: <20160718065351.GT17101@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <f28c063f-ec56-e62b-9370-89ce833fa4e5@users.sourceforge.net>
In-Reply-To: <f28c063f-ec56-e62b-9370-89ce833fa4e5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, Jul 16, 2016 at 10:04:34AM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 16 Jul 2016 09:54:22 +0200
> 
> The drm_gem_object_unreference_unlocked() function tests whether
> its argument is NULL and then returns immediately.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Ok, I merged all the non-amd ones from your latest round to drm-misc. Two
small nitpicks:

- for cocci patches I prefer if you include the (simplified, if it's a
  large one) semantic patch in the commit message. Cocci is really badly
  documented, it's good to see new examples of how.

- threading seems funny in your series. Please generate mail threads using
  git format-patch --cover-letter $sha1_range and send them out using git
  send-email. That'll get all the details right. Also pls don't reply with
  new patches to an old series, that hides the patches and confuses the
  discussion. Just start a new thread (even when the patches are on the
  same or similar topic).

Thanks, Daniel

> ---
>  drivers/gpu/drm/ast/ast_main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 7bc3aa6..904beaa 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -295,9 +295,8 @@ static int ast_get_dram_info(struct drm_device *dev)
>  static void ast_user_framebuffer_destroy(struct drm_framebuffer *fb)
>  {
>  	struct ast_framebuffer *ast_fb = to_ast_framebuffer(fb);
> -	if (ast_fb->obj)
> -		drm_gem_object_unreference_unlocked(ast_fb->obj);
>  
> +	drm_gem_object_unreference_unlocked(ast_fb->obj);
>  	drm_framebuffer_cleanup(fb);
>  	kfree(fb);
>  }
> -- 
> 2.9.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
