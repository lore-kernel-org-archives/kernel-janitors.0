Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A455AEB64DA
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Jul 2023 08:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjGSIkI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Jul 2023 04:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjGSIkH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jul 2023 04:40:07 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DC1A4
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jul 2023 01:40:05 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb41682472so10827144e87.2
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jul 2023 01:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689756004; x=1692348004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OfNCJHWUchnvMIqHHiATQW5mr5Sy8zim9WS33GnJN6c=;
        b=YIxAjV7eeh7JnxMZVdbcxqmJd7a+8C82frrJX8W6bkO//RAraPb7mtloz0O5bXzDqv
         lMxErKs+Cr0AW9uyG1RHizjoUT/PjF4z3U1Ra1YRgtee6JjZGyuhXbxJtWest4Ykt2yq
         PDXp++m5fUvHDXJgLtuwLjtXH9NILnVNgs890Mds1PjUyevYRSYih14HcmBfpE36XVQI
         tvudy68+oA260HjwxmV00qyzjaTkfS3vQsVQJzLHrnatnzX31d4FO8Wwgjg2X79ytQIH
         2yZgEMGi/txyP0AP+ondE0KmqBwmjjFGsKtt1Xa7v8ITY+VxoxrD+WDVuyLcv4esO4yG
         o8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689756004; x=1692348004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfNCJHWUchnvMIqHHiATQW5mr5Sy8zim9WS33GnJN6c=;
        b=Nm5awmnRhSmvZiC67MKeZBA+i6Tk3EfZpLJfxtjVrOok5jyrpSZD8/TFO+gS4tI7i0
         n+9FtZPztU98crOmbmLKJyJ8QxONfd2eNLb5A2YMkqHEix8IAc4uvfbsLDLIIfEgx86d
         2RWMkpIVVefjkqz7/cudS2/GiBfCIHJoL2cNZCf7eJFAvTEfcs1WPtwP1NWficjNw9JD
         M6+uXXqxwVQhspNwNWXX0heLBaq8hnHwF2aRLaJr8b1U5L9ZjC9bAHZ1TCoM0CFuR0ow
         HyJSa8qAgKQ+xTQ8NHiRFqowtCy2IiVF9VV9iTvlRpcd1oMdzeD2Fv1HymKCQwLSjNjj
         AVJA==
X-Gm-Message-State: ABy/qLap+rxElm6XlXK3ebOffcCCRFKT7FafclJRDI37Nre8Xf+Z8x3r
        P1E3s3eDi1XYd7uWo1I0oUtJNQ==
X-Google-Smtp-Source: APBJJlEGIh6EJc3hIvURYXfWZwBHenJsUPSIexn/TgtWYX6pQ36DG8dsRVx5yQKCWKTZVKF/YCQ1BA==
X-Received: by 2002:a19:6703:0:b0:4f8:7781:9875 with SMTP id b3-20020a196703000000b004f877819875mr14157131lfc.60.1689756003991;
        Wed, 19 Jul 2023 01:40:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bcb95000000b003fc00789d5bsm1143380wmi.1.2023.07.19.01.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 01:40:01 -0700 (PDT)
Date:   Wed, 19 Jul 2023 11:39:58 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     suijingfeng <suijingfeng@loongson.cn>
Cc:     conduct@kernel.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
Message-ID: <007d3f52-1094-4814-8e00-15147605ea9a@kadam.mountain>
References: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
 <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
 <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
 <674cc4b7-6cb1-5329-d06d-c981ac8ad240@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <674cc4b7-6cb1-5329-d06d-c981ac8ad240@loongson.cn>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Yeah.  Sorry again.  I was frustrated.  Your email basically said
everything was wrong with my patch.  The subject was wrong.  The commit
message was too short.  The Fixes tag was wrong.  The patch wasn't
correct and didn't address the root cause.  And then when you mentioned
"bare brain" I misunderstood and took it personal.

In the end, I think we've all agreed the patch is basically fine.  I
will change the subject and resend.

People are going to send you patches, right?  It's not a big deal.  You
just have to look it over and see if it's useful or not.  You should
try to respond within a week or two.  But even if you apply a bad patch
you have a couple months to test it before it goes to users.  And even
when a bug reaches users, that's unfortunate but it can still be fixed.

regards,
dan carpenter

