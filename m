Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5315AEB64D9
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Jun 2023 17:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbjF0Rdc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Jun 2023 13:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjF0Rdb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Jun 2023 13:33:31 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD78268C;
        Tue, 27 Jun 2023 10:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WOIqmxjaW3P+LlRmbZ49O1gHpta/KA6PE6kRYNWDh+s=;
  b=a6tzBkBpxC8oq97AbAMWaSxDW8p/GB0PXPcdPfcCqr4TyCgupz07swlh
   M4ZS8GYPv3YD9upAASVAz0Z1at37LZN0s9CWrpRFX8AXwOV1KrBWsRQ6S
   5f10tQA/a97SQQ3Aeo9XsLr0IBvZ6fucjbD+WCpS6199B5rHnOUtAgeoQ
   E=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,163,1684792800"; 
   d="scan'208";a="59972556"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 19:33:28 +0200
Date:   Tue, 27 Jun 2023 19:33:27 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Zack Rusin <zackr@vmware.com>
cc:     keescook@chromium.org, kernel-janitors@vger.kernel.org,
        VMware Graphics Reviewers 
        <linux-graphics-maintainer@vmware.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/26] drm/vmwgfx: use array_size
In-Reply-To: <20230623211457.102544-21-Julia.Lawall@inria.fr>
Message-ID: <alpine.DEB.2.22.394.2306271932410.3150@hadrien>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr> <20230623211457.102544-21-Julia.Lawall@inria.fr>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Fri, 23 Jun 2023, Julia Lawall wrote:

> Use array_size to protect against multiplication overflows.
>
> The changes were done using the following Coccinelle semantic patch:
>
> // <smpl>
> @@
>     size_t e1,e2;
>     expression COUNT;
>     identifier alloc = {vmalloc,vzalloc,kvmalloc,kvzalloc};
> @@
>
> (
>       alloc(
> -           (e1) * (e2)
> +           array_size(e1, e2)
>       ,...)
> |
>       alloc(
> -           (e1) * (COUNT)
> +           array_size(COUNT, e1)
>       ,...)
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c b/drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c
> index 829df395c2ed..c72fc8111a11 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_devcaps.c
> @@ -88,7 +88,7 @@ int vmw_devcaps_create(struct vmw_private *vmw)
>  	uint32_t i;
>
>  	if (gb_objects) {
> -		vmw->devcaps = vzalloc(sizeof(uint32_t) * SVGA3D_DEVCAP_MAX);
> +		vmw->devcaps = vzalloc(array_size(SVGA3D_DEVCAP_MAX, sizeof(uint32_t)));
>  		if (!vmw->devcaps)
>  			return -ENOMEM;
>  		for (i = 0; i < SVGA3D_DEVCAP_MAX; ++i) {

Hello,

I think this patch can be dropped, since it's a multiplication of two
constants and no overflow should be possible.

julia
