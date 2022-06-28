Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFABEC43334
	for <kernel-janitors@archiver.kernel.org>; Tue, 28 Jun 2022 08:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245533AbiF1IyN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 28 Jun 2022 04:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344037AbiF1IyL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Jun 2022 04:54:11 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3FC02DD59
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Jun 2022 01:54:08 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id BEE2B6601603;
        Tue, 28 Jun 2022 09:54:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656406447;
        bh=ZVf1tU+97ZPJ79W3kJDyyqMHEqU7fzU+Cg2O7PGiYoA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ikGBmQvTsPF/yPzkBqqOBBsDUE3f5+Xt9F+I0fp8dsJ/giw/tIwAjtaSeWF1BLjm+
         UfAOH9JR2P5Iwod/8SmNIrD3jg3qUGKOYxceft7oila7opVjNDeyOk7GjeCgKRBmS1
         IeMy43W1rIPrU+aUN+jTtiz9EJwq8sszlAjYD2na2FT3NvrtnNDcmgMvXVOV67RWGd
         vxMZDMY2yc4mD63laPjCBVoKRPQuoFtI1Le36HHMsskxgUCL4LFZt9ijIp78m2Vl6m
         TxXBWY8BwqWDmhHcINo5YqRhBnFKT8pGokZXBSJajBJ5u1s2I+NOxwPHL3jna7eym7
         ZiCY1QJJugVGQ==
Date:   Tue, 28 Jun 2022 10:54:03 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Avoid uninitialized variable warning
Message-ID: <20220628105403.49f1c425@collabora.com>
In-Reply-To: <20220628074519.GL11460@kadam>
References: <Yrqm5yYVa6xMY2vq@kili>
        <20220628092609.7d0b1ea3@collabora.com>
        <20220628074519.GL11460@kadam>
Organization: Collabora
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 28 Jun 2022 10:45:19 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Tue, Jun 28, 2022 at 09:26:09AM +0200, Boris Brezillon wrote:
> > On Tue, 28 Jun 2022 09:59:51 +0300
> > Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >   
> > > This works, but technically it uses "num_in_bus_fmts" before it has been
> > > initialized so it leads to static checker warnings and probably KMEMsan
> > > warnings at run time.  Reverse the checks so it checks for failure first
> > > and then check for unsupported formats next.
> > > 
> > > Fixes: f32df58acc68 ("drm/bridge: Add the necessary bits to support bus format negotiation")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/gpu/drm/drm_bridge.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > index e275b4ca344b..00cbde654472 100644
> > > --- a/drivers/gpu/drm/drm_bridge.c
> > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > @@ -897,10 +897,10 @@ static int 	(struct drm_bridge *first_bridge,
> > >  							conn_state,
> > >  							out_bus_fmt,
> > >  							&num_in_bus_fmts);
> > > -	if (!num_in_bus_fmts)
> > > -		return -ENOTSUPP;
> > > -	else if (!in_bus_fmts)
> > > +	if (!in_bus_fmts)
> > >  		return -ENOMEM;
> > > +	else if (!num_in_bus_fmts)
> > > +		return -ENOTSUPP;  
> > 
> > Well, it changes the error we return when num_in_bus_fmts = 0
> > && in_bus_fmts == NULL which is not an ENOMEM situation, so I'd rather
> > initialize num_{in,out}_bus_fmts to 0 here.
> >   
> 
> I can do that but there is no real consistency in how
> ->atomic_get_input_bus_fmts() functions are implemented.  Some set  
> *num_input_fmts = 0; before the kmalloc() and then reset it to
> *num_input_fmts = 1; if the allocation succeeds.  Some just set it to
> *num_input_fmts = 1 at the start.
> 
> This bug only affects the imx code like:
> imx8qm_ldb_bridge_atomic_get_input_bus_fmts()
> imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts
> 

I'd say imx8qm_ldb_bridge_atomic_get_input_bus_fmts() and
imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts() should be patched
to set *num_input_fmts = 0 when they return NULL on purpose, as
documented here [1].

[1]https://elixir.bootlin.com/linux/latest/source/include/drm/drm_bridge.h#L453

