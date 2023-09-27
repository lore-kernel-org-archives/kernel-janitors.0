Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9509DE810DA
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Sep 2023 12:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbjI0Mh6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 08:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjI0Mh5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 08:37:57 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D72C0
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:37:56 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4053cf48670so98182695e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695818275; x=1696423075; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8gt0z84tNKlqBU0ORxjwF1YuLnJ3DYpGxnw1e57pMcg=;
        b=zISGlxcMl8IWHEnufDiUgDHXHDBAXg3wZvWUXuIcEyQNLkyUwN3AlRdVv2f2e7csLN
         rTzonKxiBk3Tmu2e7Brl5dsI+kaG5jwDLF+R4FDoT1FaAGTAdWweC4WhayrlCa5Z0DCc
         lBsE55Zphz17dTFzzaDmXH67Zi0JMoT1N6xp0PwrIyt5f1rvZ16UCwCnogs3Br4ZTJdH
         p0EZMQVz26g0NbzsN9p+6bRmi1JJn4gwD2F90S8uqNXEpBk1venFmND58/qXBJ+PdVC5
         gKy7nfd+lhphegVE3zx6gXogCy4vNqdsYPHVt00cnhtcxXA+e4MXF2hiWS9LhdGKXta9
         gCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818275; x=1696423075;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gt0z84tNKlqBU0ORxjwF1YuLnJ3DYpGxnw1e57pMcg=;
        b=EXwSZrdteeFqmRa4awNAArkN0P2CEMzjYAiCH9GTLxGNlBbajAcuJS6oseKxPYOz4J
         FLGmV7HgX8Yps2KWzDJ6ULLPTKDJVJ2UxngZWFZDPfXU10OdGIvPmqGzZV8wmq9ksvAA
         BMIXJRgi40K2pMkzd1XLOfqlfoKuR2Xmq5yUJRnUXf1u8pKxXwcjolFo5q865CPmArvI
         pwPRwp8Tq4CzFOt0hAcHphEOfSAOT5zXMLhU/mm1dXvqw41Ujw5P0Ak2amzUgE9OeQ8J
         m9rkY7aYQDU+Kw8GJmhcRGDKpRdMzXOUGFTjj7S87kdsep+r7qvc/ubtbwkv5zHpwuSA
         X22g==
X-Gm-Message-State: AOJu0YzVLkmXgGw/Zg+O2DahjIv71dGker0OTN7KmSmQ7gC5ZBULeY27
        SIZhBKCKR2GYjiN+pHcp3ujK1w==
X-Google-Smtp-Source: AGHT+IF//SsjAFSKGtGIY4ySU5+yXbv00B5OFBnRt/YiczmsYbnBFnOPNKevQVsLvVlA2FKz/O/b1A==
X-Received: by 2002:a05:600c:365a:b0:401:b204:3b97 with SMTP id y26-20020a05600c365a00b00401b2043b97mr1810459wmq.4.1695818274882;
        Wed, 27 Sep 2023 05:37:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c1d9300b0040531f5c51asm17841529wms.5.2023.09.27.05.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:37:54 -0700 (PDT)
Date:   Wed, 27 Sep 2023 15:37:51 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Evan Quan <evan.quan@amd.com>, Yang Wang <kevinyang.wang@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lijo Lazar <lijo.lazar@amd.com>,
        Asad Kamal <asad.kamal@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Yang Wang <kevinyang.wang@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/pm: delete dead code
Message-ID: <b238c665-91d6-4afe-83a8-da2f2d59a75b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

"ret" was checked earlier inside the loop, so we know it is zero here.
No need to check a second time.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index 11a6cd96c601..0ffe55e713f3 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -2346,9 +2346,6 @@ static int mca_get_mca_entry(struct amdgpu_device *adev, enum amdgpu_mca_error_t
 			return ret;
 	}
 
-	if (ret)
-		return ret;
-
 	entry->idx = idx;
 	entry->type = type;
 
-- 
2.39.2

