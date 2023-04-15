Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D070C77B70
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 Apr 2023 21:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbjDOVwW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 15 Apr 2023 17:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjDOVwV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 15 Apr 2023 17:52:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A22D3AA5
        for <kernel-janitors@vger.kernel.org>; Sat, 15 Apr 2023 14:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681595492;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aZJmCfWBB3QhjJqyb/DxZRtWXJ7VsAMXByp8O5M+2tY=;
        b=KICxAAZkPCci+wGjq/+jUu5b4XnvIGtqSz/0PLayXO7Os19B/dRftxtB8v0kyw6lCuT/Eh
        zIr2xun/Gzo3SDREZFTMCm0hz4rUrFCrVAiqX6XdE5qU9pL1pkUzAhTmukY7xRF7qnrpmV
        ap5P/tWmTczFUjx/l4f74GHvIjxujEY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-khwaCyljPECl5_syun_YWw-1; Sat, 15 Apr 2023 17:51:31 -0400
X-MC-Unique: khwaCyljPECl5_syun_YWw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f080f53d62so1281905e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 15 Apr 2023 14:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681595490; x=1684187490;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZJmCfWBB3QhjJqyb/DxZRtWXJ7VsAMXByp8O5M+2tY=;
        b=KqcawKh/2Yu1NCGdAI83HLQ8ZzvjVGS9Im6O1v7lxTRkeY/BdVErF90uCDVsskgxTD
         7v7L/w1rmNa7cIiJIfSq1OUAxyzQjLE1iyQ+W2woisQhiY8dIqQtz3PY1eRvTc9i+FmN
         Br9J99N0ToGNlj63ONFEKyUc2jzfHA4ev4/wTC8q9NkBuRJd9WEcGij4gOHj9Y86Jp0r
         d/i8OWk172yKT4UrinC+q4adjStBz0WJn9zqOGfvB1gr1SLsN924dU/9C1B+eXbX8o4h
         Ws+uZerjcL3tyl/9YspiuJzBoPklQ61u4+cbcz+mI8bOl4Vz9JbXTD8Qp8VzRYKChLNN
         zOEw==
X-Gm-Message-State: AAQBX9cCoJpYZ7VK8m7VHC1cw3BRprlXM5w11Rzh0kLjwC/E5asvTsvs
        1b2wB3fyHkQJnUX7IHH9I2p8DhG8L81ezNx9jAFZvVoJls8v3V30CqtXshjqF9ztnUfbmyA7/d5
        8D7NUKQ4qizdP3i49rFuG6j1rEDnS
X-Received: by 2002:a5d:6047:0:b0:2d3:b1fa:3031 with SMTP id j7-20020a5d6047000000b002d3b1fa3031mr2272064wrt.16.1681595490310;
        Sat, 15 Apr 2023 14:51:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350bQPuS1I4SCR9ODjkrwq8mehIXU5VgArr61hpu+s5V4UaFZGgNx4T+7tvHhr2YI7U1uFTsQ0g==
X-Received: by 2002:a5d:6047:0:b0:2d3:b1fa:3031 with SMTP id j7-20020a5d6047000000b002d3b1fa3031mr2272049wrt.16.1681595490051;
        Sat, 15 Apr 2023 14:51:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p3-20020adfcc83000000b002f27a6a49d0sm6556085wrj.10.2023.04.15.14.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 14:51:29 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Dan Carpenter <error27@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] drm/imx/lcdc: fix a NULL vs IS_ERR() bug in probe
In-Reply-To: <20230322091604.3zgzogskrtn3evur@pengutronix.de>
References: <d0a1fc55-3ef6-444e-b3ef-fdc937d8d57a@kili.mountain>
 <20230322091604.3zgzogskrtn3evur@pengutronix.de>
Date:   Sat, 15 Apr 2023 23:51:28 +0200
Message-ID: <875y9wg6fz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

> On Wed, Mar 22, 2023 at 12:06:55PM +0300, Dan Carpenter wrote:
>> The devm_drm_dev_alloc() function returns error pointers.  It never
>> returns NULL.  Fix the check.
>>=20
>> Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>

Pushed to drm-misc (drm-misc-next). Thanks!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

