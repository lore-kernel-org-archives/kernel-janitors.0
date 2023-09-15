Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E702EE645C
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Sep 2023 12:59:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235074AbjIOM7d (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 15 Sep 2023 08:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234930AbjIOM7c (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Sep 2023 08:59:32 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D51A8
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:59:26 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31ff2ce9d4cso583294f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694782765; x=1695387565; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=thYoe0BNHvEOMDMTZOyxjv7HxezTMf3wBNBDqm2Ezmw=;
        b=rt39X8sHJ74DP4CmUYP5Y5z1vYgpK4Dvq8rgU9JFuAfUu+ezlahjBOwgyNiUwJ49K5
         9Wa/CG7my4wO1r1Y7C0B0jwifCVNB4p7z8pMwULzpUPpM5qrgqWWUfRW1r60/rn+Mv/F
         +NRp9RUrn0V+1qa/0ROvmenFabkXPEQvGDZvXHxCb4F0rGsGEeoj1dbsLAQlV002n54I
         60/Fiea9iJAu7g1ujoDViHR92y1xSl6YHQXmPnTejEhI0IUUYLpOm5toTCdnOjGtXm9H
         75AFQ/YSDfaqf7NU6f5nJO2wVl32qJr3Q1NKDcbKtHH+5PViPS4ELTnhQKluKuARPgCS
         iL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694782765; x=1695387565;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thYoe0BNHvEOMDMTZOyxjv7HxezTMf3wBNBDqm2Ezmw=;
        b=il4Z1B0IGZqz2dRVAJyPfGofB/fK8hGEoUlLdpiXhaEzI5826iMSK2mApwX6ql//ch
         hWNMbK8rxbCfFeWWb4KVUtrrSFLdi7iv1s9Ntn2+xGA22783gjq9k1ZaR2gcjSFCA7pa
         lQ/vgGww++LWp/0aZYfiJRjwPzYcR5MMJ1hMoLMmCIAiFKPV0i822cjIucQoopVLV/bR
         fodOraT9bw7SXbaSrmxfP+e7FE1VedfJw6gstuR70tU6BdudclWSU1/tPFg3odFuMZsy
         YzOmlHRtgm8cIUEsi6DtKfCMic5tmnLI64JjM3sBhEJh6IuMxBcg36wNjnYwIRaEuAmz
         GTRw==
X-Gm-Message-State: AOJu0YwiiQaqyFPwI8kdf9VaqTbyyqhrsQzY30ZnlDK+Cc0naATTVvXg
        TD88/KoW6gB7i1fBQCYktNR43A==
X-Google-Smtp-Source: AGHT+IHDdih5KavdMKTqMTv6Tmh6hfVUdgWGAPg7mzToh5I5IaoOvsPv/APF1zZtGBwwQ9m0ia1rNg==
X-Received: by 2002:adf:f5ca:0:b0:31a:d4d0:6e98 with SMTP id k10-20020adff5ca000000b0031ad4d06e98mr1282751wrp.8.1694782765099;
        Fri, 15 Sep 2023 05:59:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n4-20020a1c7204000000b00402f713c56esm4566639wmc.2.2023.09.15.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:59:24 -0700 (PDT)
Date:   Fri, 15 Sep 2023 15:59:21 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Dave Airlie <airlied@redhat.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Danilo Krummrich <dakr@redhat.com>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] nouveau/u_memcpya: fix NULL vs error pointer bug
Message-ID: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The u_memcpya() function is supposed to return error pointers on
error.  Returning NULL will lead to an Oops.

Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 3666a7403e47..52a708a98915 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 	size_t bytes;
 
 	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	return vmemdup_user(userptr, bytes);
 }
 
-- 
2.39.2

