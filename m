Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4129C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 12:57:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237917AbiKOM5H (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 07:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbiKOM5E (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 07:57:04 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B6A9109E
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 04:57:03 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id j15so24141300wrq.3
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 04:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3npKNO7EdnZMJchPseofSyg8OvoZM8dnC8E9718dj4=;
        b=SDBOJ9o8aDYmio2B7zkkXLe/1Vh/h/Iqa5PZ63quI+gZpgjuS+ZKqvuFioZeRw5lh4
         swINKn34NNLGKfZRRFRWGGU4X3oQR8iGhKimzrVjMstpdal5MQhr8vvcjjM/vlXxRqk1
         VB0RJUAJZ4dVUDJtjyr/Nbk0jEuAV8hWPlGp3OWFWUZW3kL/nlK2U2raRye5qUaywWee
         sg0Op7ZpYx5yFCPfg8Zgw77JuwrR462NEkfuNmeZOZGtnjQrznz8lWkYRWKZGCMbnzzv
         j7s/jUcRh1zI0Y6BIAgukQucOwc00yv6t5dSaoReN1lRVkBjYqrrSpm3DMZprMTlfRGd
         /YDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3npKNO7EdnZMJchPseofSyg8OvoZM8dnC8E9718dj4=;
        b=3PddQDOJhwNgFPboS69JwG/UKq7A2x7oAf+eenY5wh+9Iw9GidJQLwCd5+0Gjyk35M
         1jOYorxsYRujm7D1jpAu8XrHbzYfcPUGrx1XdHYQnXBgBE7K5EIkYlyLrI9ysB2XWbD/
         XSOR15OJ2GzEWdasmMAN5qFQ6uKzgNxsgcV3NkLaBGakW/zBEd0MT8g+hk79tMB0p0zg
         nu9NrGGwk07JGfRG9X6iEfdhDQu0pM+bXimreqbj60NNSkq+2twKhWEv2nhiawD14n+/
         UCqt3k+WpNgPfGajkeqO6MWyKIheC+SGXopR9PzOtujapCkP54ZV8kvOlMaV7rJzAXnv
         dvDg==
X-Gm-Message-State: ANoB5pkbSiidT8btxdgHWZWvNTaNwFpt/n1qyWnE15uAxjGJmHgXTEsq
        Z3p8jCTjFhv7q0+86LrQAOI=
X-Google-Smtp-Source: AA0mqf5WcSOrPcctHKA15TDbRyvs6c4/8xVmIbSG+fo7UP6Z8FoZdW/9b6SQUMJFkiQPDDyDDtH99g==
X-Received: by 2002:a05:6000:605:b0:236:6f3c:1f2f with SMTP id bn5-20020a056000060500b002366f3c1f2fmr10888123wrb.89.1668517021867;
        Tue, 15 Nov 2022 04:57:01 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003c6b9749505sm24241770wmq.30.2022.11.15.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:57:01 -0800 (PST)
Date:   Tue, 15 Nov 2022 15:56:57 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Evan Quan <evan.quan@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Lang Yu <lang.yu@amd.com>,
        Darren Powell <darren.powell@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] amdgpu/pm: prevent array underflow in
 vega20_odn_edit_dpm_table()
Message-ID: <Y2ZH2FPSuX/msEL1@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In the PP_OD_EDIT_VDDC_CURVE case the "input_index" variable is capped at
2 but not checked for negative values so it results in an out of bounds
read.  This value comes from the user via sysfs.

Fixes: d5bf26539494 ("drm/amd/powerplay: added vega20 overdrive support V3")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
index 97b3ad369046..b30684c84e20 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
@@ -2961,7 +2961,8 @@ static int vega20_odn_edit_dpm_table(struct pp_hwmgr *hwmgr,
 			data->od8_settings.od8_settings_array;
 	OverDriveTable_t *od_table =
 			&(data->smc_state_table.overdrive_table);
-	int32_t input_index, input_clk, input_vol, i;
+	int32_t input_clk, input_vol, i;
+	uint32_t input_index;
 	int od8_id;
 	int ret;
 
-- 
2.35.1

