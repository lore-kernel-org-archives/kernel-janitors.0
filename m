Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A20C7EE24
	for <kernel-janitors@archiver.kernel.org>; Wed, 10 May 2023 16:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbjEJQs1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 10 May 2023 12:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjEJQs0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 May 2023 12:48:26 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E508C30F4
        for <kernel-janitors@vger.kernel.org>; Wed, 10 May 2023 09:48:24 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f315712406so255049875e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 10 May 2023 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683737303; x=1686329303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MwVVyzBwHFgq5mjt1+OBVM71N6e1slDHiUKoKcjYW0Q=;
        b=yy0HCIvUH4Sd4z+3E6svVggUDeh72opPe44l+Bem25petIjeKIIYzQqIWoBHzl0UNL
         u8N7qm1cfYKJD1Ud9Mt207BcE7wIRoHy5kG7p3GN6XH5gbPk9a9QsPQFB8wRk7t3ofPb
         irL1km6PsxvZruvN922JFOGjHAm15x9jXWprgf38trxk65/fHgrIdA5B21I1Eaxx5U5U
         Vr9vc6Ht/FGK2UikGQRSwBVMjn+MURFnJaJB+b6VjaIY9OW2l6qZWYznyy4flM8XPjzv
         T7OLdbQBdX4JqZsW5cTIjUhOJ0XTVn+QRau4Lu2oA7/p/THSVE1O6yCmsl+0iv+PveoN
         oQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683737303; x=1686329303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwVVyzBwHFgq5mjt1+OBVM71N6e1slDHiUKoKcjYW0Q=;
        b=Sd2U92e4+/tHArq9v0FKf72BBA/HlLKWdN08D5/wPKqXtzBxMAzFbPjp9OUEs3Kdoa
         jcIEFzXuuvQhq0ftR0f0UVLr9z2nVXpldJGgtySICi++GPIkX+0L+HAOT4bbSg9ISQnB
         71V/Tw2fVg5neMEIdZT169Q7uYdAaqVlgW4Q1MClvYGLEG3MOjVKBXufeSPffmKp6GjO
         UbRUMn+Cfs3fRcUV4u+B0+WilEba9620aTuW0onLCSNjoWB4Tw8LihdXpISB9K/P8S3/
         oFMr0p8XWQnwgoC5LE/YNevxMkz9MUU4+gDahDu4xQwf66svmE5Ig2MWpJ2sP91mW2Iz
         /nfQ==
X-Gm-Message-State: AC+VfDwEwEIWGxCty9RmrrSbVoikO7Phs0gTZuFyANUUrFR+2mrAmc4t
        eTQDhI6LH/+QAYB32YEHydOE/Q==
X-Google-Smtp-Source: ACHHUZ6pAsUXjnPzQPlETYmn2EITVP8Au3ALpgkfd7X43evubc0YmSsEetI21aWFcNDrnelF4WvqLw==
X-Received: by 2002:a05:600c:3b91:b0:3f1:7b63:bf0e with SMTP id n17-20020a05600c3b9100b003f17b63bf0emr12869963wms.18.1683737303342;
        Wed, 10 May 2023 09:48:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y5-20020a1c4b05000000b003f429d59e37sm6135075wma.34.2023.05.10.09.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 09:48:21 -0700 (PDT)
Date:   Wed, 10 May 2023 19:48:16 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Oded Gabbay <ogabbay@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] accel/qaic: silence some uninitialized variable warnings
Message-ID: <d4c73c29-b604-4b0c-92bb-000369b0a5d7@kili.mountain>
References: <d11ee378-7b06-4b5e-b56f-d66174be1ab3@kili.mountain>
 <2d1fb58f-f98b-ba17-65e9-9ea4b467102a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d1fb58f-f98b-ba17-65e9-9ea4b467102a@quicinc.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 10, 2023 at 08:57:03AM -0600, Jeffrey Hugo wrote:
> On 5/3/2023 4:41 AM, Dan Carpenter wrote:
> > Smatch complains that these are not initialized if get_cntl_version()
> > fails but we still print them in the debug message.  Not the end of
> > the world, but true enough.  Let's just initialize them to a dummy value
> > to make the checker happy.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Thanks for the cleanup.
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Could use a fixes tag

The fixes tag thing could have gone either way.  It's really minor.

> and also I'd prefer to maintain the style of sorting
> the variable declaration lines by line length.  Given the minor nature of
> these nits, I plan to address them.

Thanks!

regards,
dan carpenter
