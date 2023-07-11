Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2A3C0015E
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 11:13:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjGKLN2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 07:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjGKLN1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 07:13:27 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7116D98
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 04:13:26 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbc5d5746cso63184845e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 04:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689074005; x=1691666005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dLCSxIig1E6lDTEDhD9ibzAe8m3WEahllr3ouLgYn1c=;
        b=nzLVIA+PTb3SSi7DlWsGUsWL0rkRaezLG67wZ9+BrJp3AN5vFhk9E0dU6Vk52JEQKR
         2vLUlE/D2AteRhGj4dkHYehNCRxLhFq+LUlYcCZRPHvbm7eEpmU7fLT2U9Csc3sEues6
         t05grkaVvaeeg8n1TVm5MNd9z8nH1MAqcyU2CaWLXISalkxxjV7Xe5gxUKR9QmNOlkk+
         h+XoqvVHH6LnqoYvxTnbG9LNgn0+TDx0w9g8VedeMKOc+HEFDuU9xw36PM00it1+SSCA
         n5zaeQuoXryACKo6BTsqMOjcASK3ca8qDzOvq31ASaP592CcVNBYtvPlMOA4eKVY6img
         jBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689074005; x=1691666005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLCSxIig1E6lDTEDhD9ibzAe8m3WEahllr3ouLgYn1c=;
        b=AN++WU0JZpolyqQ4NcQl7s51E0LCFBHAHe0GwQRxPEVJlccV72gte06XWakfy0aW3X
         nRqyXmB9qOH3znpOkKqs1cSpWSEN4bBjf0z6oAKm7/feWBXw+ePmD+QFISjC9uSwUkch
         sPJImhA1bYNtRXOTxs5TrFd7jH4T8PvprQ8q4LKahlm8BKMihCjIZdeHUVbynuY4WVAy
         GaoltyEOgZh2rBF8jUGLUrNUG/Lqz1YuqBS0rdptv79oh9ledhYvD/RYkADIBD/LtjQw
         x1J4F1/DOGci2G6sGldyBxjGnLyuhdKhrYn8w7Jpmh0zui60Okn+hNvRbfxZ42DAQhIL
         VPXg==
X-Gm-Message-State: ABy/qLbZR2Iisqieh4qfiGf/De9YyYzzG7QDAL3urxZBOdlskd86Zbf/
        XfeJ22FxotbEMIErWJffG8HZDg==
X-Google-Smtp-Source: APBJJlHUs43WSGSKNzoDZD3KQlU5rLMuF/7dsLdNmMbgfPJIjEa2I2xQi/A5h+V8aI33ZuQwpwX8Uw==
X-Received: by 2002:a1c:f706:0:b0:3fb:b637:22a7 with SMTP id v6-20020a1cf706000000b003fbb63722a7mr16506974wmh.4.1689074004968;
        Tue, 11 Jul 2023 04:13:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a19-20020a05600c225300b003fbb0c01d4bsm2259571wmm.16.2023.07.11.04.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 04:13:23 -0700 (PDT)
Date:   Tue, 11 Jul 2023 14:13:19 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org,
        olvaffe@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/virtio: remove some redundant code
Message-ID: <7f67ed65-647a-44d7-a262-d3f1f48d90b9@kadam.mountain>
References: <20230711090030.692551-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711090030.692551-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 11, 2023 at 05:00:31PM +0800, Su Hui wrote:
> virtio_gpu_get_vbuf always be successful,
> so remove the error judgment.
> 

No, just ignore the static checker false positive in this case.  The
intent of the code is clear that if it did have an error it should
return an error pointer.

regards,
dan carpenter

