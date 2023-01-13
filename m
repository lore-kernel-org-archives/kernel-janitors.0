Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4564C54EBD
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 Jan 2023 10:07:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239755AbjAMKHy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 Jan 2023 05:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235391AbjAMKHt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Jan 2023 05:07:49 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C419A43E71
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Jan 2023 02:07:47 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id co23so20577670wrb.4
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Jan 2023 02:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgdeVYZ+deMRc/ei+kMH+4SXCwx2TEgssACm0boSjEM=;
        b=aOdehrQKCnmwEtX56FiU6NCxjPIOxuIzXVpC4QiHmPZZfby+fTkgW3dhSZ30bzAFEO
         Y2gywrOWSy7zPamNyLCa2YDVNJfJlhzq0zdCGsjAkZ/fE8Wh8Ev6ZXXrozy4BBe6yn4Q
         pUR+xr5aHbRnxR2gdgmWO+Qu+/VlILMMP1SWIcitWSmGt/GAljeuN43l7Zc/izzsBxHw
         totc1kX0LN9AUAEyA4GqlEPHJ93aWSTWZN0vwa0Qp5pGXXDq2DDyqYRayvKcySkyCtBU
         0wQCZzW0DJF9Mcr1JXtY3NQHRSKfQaeHOTuBGT6Rm5CQXkm1RWFAg8ZnHpEXgxU1pxEF
         Rddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgdeVYZ+deMRc/ei+kMH+4SXCwx2TEgssACm0boSjEM=;
        b=Fnl8Tntk8qxgBM3aiuwXYEtRLzIOtdI6VZaS4QhvnkjVNDENg6RBuvmQg/qbufJrNN
         lq/XXniZ+Nv408+iEIH4SVCdk/c//xuz7dYrkDjb+y5ynSbKm3tm6gyzWcdm/an0Tf4s
         KRUbclnk4gE0r9KL42HH0y6QHhV7zzdYKSnO8M4ZtCvd/fqE6xntc2RV9qBROUMMk1Kq
         ekWH/KOeCvFOyjNLPcXbgHJ3prQ+r65mgnPj3LmrNPtD9GitT9HU6VpKPLFbFkuMZNg2
         zZ2G7pOEla3wystWeiyE+xwPq7g3dbjAKCtcVXKbvtNgqjuajUHlFJZ5X/kro9K4Gy7Z
         SPvA==
X-Gm-Message-State: AFqh2kqug8co6Ko1OvLiW+qjROYnxQe8jKStztimXmbKh74QCYITkP9e
        YlbTYWNf2dsXC07QH2eRvpw=
X-Google-Smtp-Source: AMrXdXvsko1ZJDxi4t9nddmcNn062AcrE+xH8KlU5ueUwz/6CI/UwTOcW8zDwjENTNO4bcjlJLKg7w==
X-Received: by 2002:adf:e193:0:b0:2a5:74c9:a8c1 with SMTP id az19-20020adfe193000000b002a574c9a8c1mr22046389wrb.16.1673604466261;
        Fri, 13 Jan 2023 02:07:46 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bp28-20020a5d5a9c000000b00273cd321a1bsm18564014wrb.107.2023.01.13.02.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:07:45 -0800 (PST)
Date:   Fri, 13 Jan 2023 13:07:42 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Alex Deucher <alexander.deucher@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Lang Yu <Lang.Yu@amd.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Haohui Mai <ricetons@gmail.com>, Evan Quan <evan.quan@amd.com>,
        Jack Xiao <Jack.Xiao@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Add a missing tab
Message-ID: <Y8EtbpVGFJSDxM/m@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This tab was deleted accidentally and triggers a Smatch warning:

    drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c:1006 gfx_v8_0_init_microcode()
    warn: inconsistent indenting

Add it back.

Fixes: 0aaafb7359d2 ("drm/amd: Use `amdgpu_ucode_*` helpers for GFX8")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 4fb577d047fd..b1f2684d854a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -1003,7 +1003,7 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 		err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 		if (err == -ENODEV) {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
-		err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
+			err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 		}
 	} else {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
--
2.35.1
