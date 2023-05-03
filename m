Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E29C77B7F
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 May 2023 08:52:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjECIwy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 May 2023 04:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjECIwx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 May 2023 04:52:53 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8356991
        for <kernel-janitors@vger.kernel.org>; Wed,  3 May 2023 01:52:51 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f19afc4fbfso48492495e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 03 May 2023 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683103970; x=1685695970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bgZG6p8PNZ6MATQQt6+bk7YMAD3dFVDJrGkYCew0g4I=;
        b=w2RS2+8sxdUDA/qFtitCK0siba+4RRLmTowVPqcV+GjUVJx5/otLasDXC56j+5vux7
         rjT2NEa8Y614Ao93r6l0ikGfPsAxLldVkXm8oJvqXXh+LIYk7AFsmAtp4lkN15ReX2xG
         fwvTO6j4hgdH6q6+/hNgYHkg8cQU85IfQurGV8FbJWQxOvHS8HByDNLWldP5zvr9RxzS
         Bxyrp8gDX+X5VxdOISt1R6BDtrNWGXwpbJ9dQFoVWc/+GjeQrT7MxLF0b9oAv1jB1lhB
         4K2yAmO81g2+GAOraz/SDDS0hAXjASqOlfV1FnqOx+ojuNA/vFfkRp30pGaFaAgYb0U+
         7E/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683103970; x=1685695970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bgZG6p8PNZ6MATQQt6+bk7YMAD3dFVDJrGkYCew0g4I=;
        b=ljYy3H1VTA8Rab58+Tz6WeI+lUKUTiikQs1KctF+R+Mp10+JFFGOtYjHS9vRXCI2fM
         7ISJaIVf0r91BUL/9xhQ722qYKe11Zdah7G3K2Lia/GrJOIUi9E11Q027KUYLitz7+3z
         7KklIx0793qy8GEf1zWP6XcNkAGXfVGEYn2GGYXWpIDKIxtLYUEzsDMpOI7nDRCAyljw
         vnGQZwFmtxkEIQ0VIqCn9eqPdnfMknawxYVMEsaTDEzD9TGKMOtHLmCVzcFMon65YfDR
         cg1ZNGpkLDsktqTeKa1CkJVrGhjLjDGkAaQi2EB0JLpoWgtAFki0Q85TM1fhID9oxTh9
         egOg==
X-Gm-Message-State: AC+VfDwItDW6RU7AMwD4uTZ2lwJxNRxzHX3idY+fsF+n8FnvT6XYRtqX
        WY2q1HX4ng2Vgm+83XkEeESiyw==
X-Google-Smtp-Source: ACHHUZ7IuHqLkguJmyEjKv+a7FMneToE2XeOnN/XjtYZacKF42HAUzTus3XG0kc34KAQnMEqu9sFug==
X-Received: by 2002:a5d:4841:0:b0:2fa:ce3:9a0 with SMTP id n1-20020a5d4841000000b002fa0ce309a0mr13462825wrs.36.1683103969920;
        Wed, 03 May 2023 01:52:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d680c000000b0030630120e56sm6526300wru.57.2023.05.03.01.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 01:52:48 -0700 (PDT)
Date:   Wed, 3 May 2023 11:52:44 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Dan Carpenter <error27@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] drm/imx/lcdc: fix a NULL vs IS_ERR() bug in probe
Message-ID: <2834501b-636c-423f-8d13-7a1a35fd3810@kili.mountain>
References: <d0a1fc55-3ef6-444e-b3ef-fdc937d8d57a@kili.mountain>
 <20230322091604.3zgzogskrtn3evur@pengutronix.de>
 <875y9wg6fz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875y9wg6fz.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Apr 15, 2023 at 11:51:28PM +0200, Javier Martinez Canillas wrote:
> Uwe Kleine-König <u.kleine-koenig@pengutronix.de> writes:
> 
> > On Wed, Mar 22, 2023 at 12:06:55PM +0300, Dan Carpenter wrote:
> >> The devm_drm_dev_alloc() function returns error pointers.  It never
> >> returns NULL.  Fix the check.
> >> 
> >> Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
> >> Signed-off-by: Dan Carpenter <error27@gmail.com>
> >
> > Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> >
> 
> Pushed to drm-misc (drm-misc-next). Thanks!
> 

This still hasn't hit linux-next (although the latest linux-next is
from last Friday, Apr 28, so maybe it will soon?)

regards,
dan carpenter

