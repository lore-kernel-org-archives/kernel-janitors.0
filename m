Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C552FE92716
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Oct 2023 15:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237950AbjJEP6I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Oct 2023 11:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjJEP5I (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Oct 2023 11:57:08 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66B027B38
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Oct 2023 06:44:14 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40666aa674fso8845665e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Oct 2023 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696513453; x=1697118253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4H2x/Q98PONLTuvH7BLyvxEUYi0TC7qsCtzYr2cez6g=;
        b=RjFSXDNtSyT9dbIVnlkRGJBroxoLAS8MeaVsdCLB52Hy3xuTZgldMJsTy5YcbimLQy
         G6Bcm+m4RNCjmcQyMQmOaPlP3Ty3g0DssbY40rNydPn+DWsV6y50fKwlL9jg+Paav/DY
         qOaScLdNDl779s//n+PXqx/RLSvBdFjUtf7gT2uFleRwxAqbCmtoC/wEX5eTvqJ6c46V
         2Vkjh3qNAwv/dllZ61AdJpZ8CeCwlHZyfW3pS27rbWTrqFdFpPwZyS67CrIKd3c+FSY3
         aY9G6tBpReU0iVBPzzmY2LHPJRkxi102xjTKhc8GyvPnbyyqxgvpprdNPTFYf3jKWDp6
         9X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696513453; x=1697118253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4H2x/Q98PONLTuvH7BLyvxEUYi0TC7qsCtzYr2cez6g=;
        b=vUrHyeqxImj/mXcM4JegqW7Tizf82KPi4oWUw0hifYg534GEf4ONy0PVGFx2QSi7Nf
         FrLE38X2M48ZeHkL34WMSrCWTGtdz0EEiCmOMry6lml5AhdINHFFvtyy3GzLemeOYRAL
         gUqJakIbTnE3fmhLWx+/eL8iMAk9p5st+5REjIEhrLizXudTziV3HvwDAbnKRb97Je+z
         ZNjnqIDxrVrbQ3RPUaof9kSviGoPOSUxOuzMKUlwZUvbEfSq0Ssr+S8aAMsLbYrxRoRy
         Lq7g3w0ZOn3yxox9fwuCPnABe1CV6Tfk6KXkKZgRNGtr7tZk52FvI8/EQpAX4a4FKVfN
         C/Nw==
X-Gm-Message-State: AOJu0Yx9Gf6L0svyj2X8ekZgOuZrav3pbk8yz2Y8HbRUSBUDroUYoAbL
        1+mh5G2kTpLyqnCv4ce/lTDQIw==
X-Google-Smtp-Source: AGHT+IEkQdWyFKDmYzO0BLwkXEoO2QnS1GnkdjFnl1ZzqizDdpMmrmtiUdCoClpcdWL+YnKS2bR5/w==
X-Received: by 2002:a1c:6a18:0:b0:401:eb0:a974 with SMTP id f24-20020a1c6a18000000b004010eb0a974mr4405896wmc.3.1696513453029;
        Thu, 05 Oct 2023 06:44:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m19-20020a7bcb93000000b003fe61c33df5sm3808705wmi.3.2023.10.05.06.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 06:44:12 -0700 (PDT)
Date:   Thu, 5 Oct 2023 16:44:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Su Hui <suhui@nfschina.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael@kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] driver base: slience unused warning
Message-ID: <ceaa146a-2781-4266-ade8-6a25eb39abbf@kadam.mountain>
References: <45027fa0-cda5-2a80-f1cd-ed805d2717ee@nfschina.com>
 <alpine.DEB.2.21.2310041557310.61599@angie.orcam.me.uk>
 <d98f7107-56d7-44a3-8b77-b8766cdc02d9@kadam.mountain>
 <alpine.DEB.2.21.2310051305530.20354@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2310051305530.20354@angie.orcam.me.uk>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is a W=1 static checker warning.  We've already reviewed it, and
marked it as old.  There isn't anything else required.

Or are we close to promoting the unused-but-set-variable warning from
W=1 to being on by default?  How many of these warnings are remaining?
It it's like only 20-50 warnings left then maybe we should consider the
other options but that kind of information needs to be in the cover
letter or otherwise we won't know about it.

regards,
dan carpenter
