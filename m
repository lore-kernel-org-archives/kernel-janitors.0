Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4DAC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Mar 2022 10:44:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345948AbiCHKpx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Mar 2022 05:45:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345943AbiCHKpw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Mar 2022 05:45:52 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5BC41332
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Mar 2022 02:44:56 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id r65so10885639wma.2
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Mar 2022 02:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sHxA9Ld6Wu8Hd+SfF7WzN4p3d70QNOTgHg1o9QMZk54=;
        b=bo0A1UtjPuz9iqMy5rGLOoKWqhM9zUra4nPcNHqTCC5H/pqmbWlYdKOXMJ9vE1ah77
         sQYwMAzxt9eJhGqspS72toUh/fLgCEsyXxTfH3wmsjnxSYaix9wHzmhIbzaOx4hDx7hb
         mXEdSdYvEACUutTBo3UCOsP0kgd7irD64tx/oaaW4l3IPcmzdqHai5l4b34nQBvd29vl
         eVeNvhcm7GDC2bYqcQjnAegW24vZ81t4EeaZJPifvDShnYH/RVTDQTImzE0Cn/510x7x
         aEcHgekGBna8z2v0K+B8n6G5uT2oKXwMIMdQMYqfHP20h2/r9Zz5C7jK1ZfBfGqGKN6p
         PV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sHxA9Ld6Wu8Hd+SfF7WzN4p3d70QNOTgHg1o9QMZk54=;
        b=wDWuA+zu6Q/hXuTdWdaF/7ljcl1fzPoi5wwaarDeFHZV04nOW7iQDcOsCu02VCUV4h
         335J8liXhRagUjaTe3Fl7rm5u7UPJ23HMj0tfoBXf9B0zzits8ApklfRgmqeaDTkOdFZ
         PsEFfNiBdqggMTyrkIoSjaI8QkDclhq/hr7pYu+vixOVGc9AD40WZoEaFfC1tle30hWe
         sFLm0APvAPvZJrrO3QYFnjKQFIkdDZT73/G4Svkb2oYGdXqYxtqpOWdkRf53U1XOFWTn
         mWxoftUXdx003tJ0R/vV+Ygk1r6P5LZW3la6GpngGTJmureQziXE1E4emy2FotS0K73i
         9jnQ==
X-Gm-Message-State: AOAM532nU7GPG+IGJDezSBbE9siTrAQ4G2+tbmS3oKpfuZwnmTF04df4
        wkfHopmjuOlFpjU3+cW7h3kryA==
X-Google-Smtp-Source: ABdhPJwof7f+BbquaM3QrH+C6BkplJ0XCOiqzDXkMUoAGwSdShrOqVMOf6WU+qu/h3z5GfDH8ZsFgQ==
X-Received: by 2002:a7b:ce95:0:b0:386:bc81:c912 with SMTP id q21-20020a7bce95000000b00386bc81c912mr3004398wmj.4.1646736294834;
        Tue, 08 Mar 2022 02:44:54 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600011cf00b001edc2966dd4sm13298020wrx.47.2022.03.08.02.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 02:44:54 -0800 (PST)
Date:   Tue, 8 Mar 2022 10:44:52 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] backlight: backlight: Slighly simplify
 devm_of_find_backlight()
Message-ID: <20220308104452.55arvejyjix3t4zb@maple.lan>
References: <f998a4291d865273afa0d1f85764a9ac7fbc1b64.1644738084.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f998a4291d865273afa0d1f85764a9ac7fbc1b64.1644738084.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Feb 13, 2022 at 08:41:39AM +0100, Christophe JAILLET wrote:
> Use devm_add_action_or_reset() instead of devm_add_action()+hand writing
> what is done in the release function, should an error occur.
> 
> This is more straightforward and saves a few lines of code.
> 
> While at it, remove a useless test in devm_backlight_release(). 'data' is
> known to be not NULL when this function is called.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
