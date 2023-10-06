Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBD3E81DF0
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Oct 2023 12:53:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbjJFMxR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Oct 2023 08:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbjJFMxQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Oct 2023 08:53:16 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED8710B
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Oct 2023 05:53:13 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40651a72807so19997465e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Oct 2023 05:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696596792; x=1697201592; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/pNLEjZCjhbSTGsvbxxkYZuso1BbyFnQkUqlrstOic=;
        b=whq36riFa+y1V/nRmDGPi8nsUFQCtUhy92GzIyq6onQS11sdUq29oz6/7APMkcDE1C
         Ilhv21ZQvsFZ/1LEOSsBA3vrqBzASqVZGsbmwuGMuSDv9Eqh59h+FVfyCQp0KIB3Wxd7
         daZZu8Ki+7ClVYpbjk2iIs1InlOkOBhHDFIgVKIkZ06cPQMUfSGIS0txJcBNGub2eanC
         G0Vt9EUgJCEOFc4xVr0P1ngKL0JxYD2dmhaR4abp94qDUt2tZPAe8fXvFRoxVXAk/BhZ
         ZiIEyFvZsxjFMYykYi59XiwE4PsEEl9H1D2MwS94HDlN0rlkxmSOUBg+7Eqdz0gpxbho
         neHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696596792; x=1697201592;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/pNLEjZCjhbSTGsvbxxkYZuso1BbyFnQkUqlrstOic=;
        b=GwQUyVZkSfi8J0SZ/Cd9s4ZiiiP1O8wg/NEbvPBsVP22VG36NpRl21/zs1SyKCHciR
         bRktTpELmDBFBECUzgDXhAeNjUYdo+PWJy1KHmHL2vb8x7duKO+Ft7ldb0zdMpDyOwq2
         vP9Wx9rHLo3nS6PAu0nRdYBUZ+LM6zCMVZJDOTEWC5TuL/JXL31Du1wdjlVgSy3Z58Pc
         ji8xdT0/RuWrVq4d0Xe/YPblYTQux5qYwTWG7S7I/3pvcYi4FLbbeVoYKrYj8SZugwqr
         5UrXyPcFvlgxW+zXVDNC/zJAySUO3b9f40t0uM3YykTkH+1MlhF/8i9C6T6ImE+PPn/d
         tmyg==
X-Gm-Message-State: AOJu0Yx6U/AMiqdYJ/tJZVtXzFn4U02HEgRO8CnUIv41ZpwiQRoshTZP
        Qo0CG012dOWnq8YHzkSXSbw6gg==
X-Google-Smtp-Source: AGHT+IFV5ma+vFvWKPuinROG/8U8XkA/Z+MG4UB0zyFovn/dAHerT6RzI8EcZV01tcRCF6pJsXNwtg==
X-Received: by 2002:a05:600c:2a4e:b0:404:732b:674f with SMTP id x14-20020a05600c2a4e00b00404732b674fmr7828883wme.34.1696596792244;
        Fri, 06 Oct 2023 05:53:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t14-20020a1c770e000000b004054dcbf92asm3690460wmi.20.2023.10.06.05.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 05:53:12 -0700 (PDT)
Date:   Fri, 6 Oct 2023 15:53:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Simon Horman <horms@kernel.org>
Cc:     Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net v2] ixgbe: fix crash with empty VF macvlan list
Message-ID: <ZSADNdIw8zFx1xw2@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The adapter->vf_mvs.l list needs to be initialized even if the list is
empty.  Otherwise it will lead to crashes.

Fixes: a1cbb15c1397 ("ixgbe: Add macvlan support for VF")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Use the correct fixes tag.  Thanks, Simon.

 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
index a703ba975205..9cfdfa8a4355 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
@@ -28,6 +28,9 @@ static inline void ixgbe_alloc_vf_macvlans(struct ixgbe_adapter *adapter,
 	struct vf_macvlans *mv_list;
 	int num_vf_macvlans, i;
 
+	/* Initialize list of VF macvlans */
+	INIT_LIST_HEAD(&adapter->vf_mvs.l);
+
 	num_vf_macvlans = hw->mac.num_rar_entries -
 			  (IXGBE_MAX_PF_MACVLANS + 1 + num_vfs);
 	if (!num_vf_macvlans)
@@ -36,8 +39,6 @@ static inline void ixgbe_alloc_vf_macvlans(struct ixgbe_adapter *adapter,
 	mv_list = kcalloc(num_vf_macvlans, sizeof(struct vf_macvlans),
 			  GFP_KERNEL);
 	if (mv_list) {
-		/* Initialize list of VF macvlans */
-		INIT_LIST_HEAD(&adapter->vf_mvs.l);
 		for (i = 0; i < num_vf_macvlans; i++) {
 			mv_list[i].vf = -1;
 			mv_list[i].free = true;
-- 
2.39.2
