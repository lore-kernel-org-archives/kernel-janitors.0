From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 11 Nov 2016 08:22:36 +0000
Subject: Re: [PATCH] drm/rockchip: return ERR_PTR instead of NULL
Message-Id: <alpine.DEB.2.20.1611110921220.2074@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1593101839-1478852557=:2074"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1478812256-26189-1-git-send-email-Julia.Lawall@lip6.fr> <5825229C.8080704@rock-chips.com> <58257DA7.4020603@bfs.de>
In-Reply-To: <58257DA7.4020603@bfs.de>
To: walter harms <wharms@bfs.de>
Cc: Mark yao <mark.yao@rock-chips.com>, kernel-janitors@vger.kernel.org, linux-rockchip@lists.infradead.org

--8323329-1593101839-1478852557=:2074
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Fri, 11 Nov 2016, walter harms wrote:

>
>
> Am 11.11.2016 02:45, schrieb Mark yao:
> > On 2016年11月11日 05:10, Julia Lawall wrote:
> >> rockchip_drm_framebuffer_init is only used in one case, in
> >> rockchip_drm_fbdev.c, where its return value is tested using IS_ERR.  To
> >> enable propagating the reason for the error, change the definition so
> >> that
> >> it returns an ERR_PTR value.
> >>
> >> Problem found with the help of Coccinelle.
> >>
> >> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> > Thanks for the fix.
> >
> > Applied to my drm-next.
>
> Just for my curiosity.
>
> can more go wrong that OOM ?

Unfolding rockchip_fb_alloc suggests that a variety of error codes can be
returned, notably from the function idr_alloc.

julia

>
> i did not see that.
>
> re,
>  wh
>
>
> >
> >>
> >> ---
> >>   drivers/gpu/drm/rockchip/rockchip_drm_fb.c |    2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> >> b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> >> index 0f6eda0..01e11bf 100644
> >> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> >> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> >> @@ -213,7 +213,7 @@ struct drm_framebuffer *
> >>         rockchip_fb = rockchip_fb_alloc(dev, mode_cmd, &obj, 1);
> >>       if (IS_ERR(rockchip_fb))
> >> -        return NULL;
> >> +        return ERR_CAST(rockchip_fb);
> >>         return &rockchip_fb->fb;
> >>   }
> >>
> >>
> >>
> >>
> >
> >
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--8323329-1593101839-1478852557=:2074--
