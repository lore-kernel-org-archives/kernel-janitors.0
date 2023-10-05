Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAC6E92708
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Oct 2023 14:38:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237061AbjJEOiD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235241AbjJEOfD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Oct 2023 10:35:03 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F18327B10
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Oct 2023 06:57:09 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-405524e6768so9435025e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Oct 2023 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696514226; x=1697119026; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIDUUDyPCMDnmf6dgpyyTfj6uNBxPsdSSFa0JLZBazw=;
        b=lCazjyMTJzIespSvCCMrWe3Xzr0lRGcJ3t0VvohDnyzfrci/2V54iBYcMhzui1tANx
         XeWEHijdBumD7/ZLLR/JQrP0t0516N0yrVmwZKGUgypW+JEVt6qavbfgDhASN7ZLB/Pu
         8Ucm430cVWVnkwyRpywxCIP1rsOMuP66TQ7d8Pem1x25E1WS10p1nMHEPrzKFYLawQQA
         tx7rSFtzGmr9kgNXcdDbHd36zqbyhvljVmYfqix42po9Zhv+Zv/t5yjP+TfmpKDNgduF
         J5ef/2t9eeWc8N1LqjF3RNw3iWtag8Vu0qby240Fuea5EGIbgZmtm9HQYmQrIxnu1Ms2
         eraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696514226; x=1697119026;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kIDUUDyPCMDnmf6dgpyyTfj6uNBxPsdSSFa0JLZBazw=;
        b=j7rlihAzyXaA1dTfmqGRrGZSlDxEzOvUBIKG5SH+I+QOIEe5nIiN6F1nhA2DA7ePOk
         ZRFm6PVidpEK8OzgHKC9LvQdy0j7vztSW3P1hKujRD8joJVmMPvjIEYyhs8vtk89zHtU
         VFLmFbUYvnj4BGvyqLAAEZieiJqMlVSghoZgjxKS4RnBIFSsEmv6n3p0bUbosU+cA5os
         ym9u6Y6K1NcDOg1s+Uk5AR/+qJ+2LcyGy0vBrvQuWmn5Dx763AADHEIVJU158vfxjdwF
         kj+reIUUlGUKjkPwlCcABpbT8r0p57/V/Vq/5/0Q3vvcMUpGWLxkQpchPQrdopTci1Ep
         w8Yg==
X-Gm-Message-State: AOJu0YyLlNDsy3OWJwPqKwhmdkTpMRZMaFWycOiYziLLUj3147rKT6AV
        ExKC3tyGiQ1AAiMX8iJ9gYqSPg==
X-Google-Smtp-Source: AGHT+IH+50km3L9x7FNGDdpi8jFVFT/mSqPZ1f1vTJoCUCMCRuejoPXyRAO7AbAoq0zfWgzr9nEAVw==
X-Received: by 2002:a05:600c:211:b0:401:bf56:8ba6 with SMTP id 17-20020a05600c021100b00401bf568ba6mr5087166wmi.28.1696514226615;
        Thu, 05 Oct 2023 06:57:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c3b9000b0040684abb623sm3774428wms.24.2023.10.05.06.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 06:57:06 -0700 (PDT)
Date:   Thu, 5 Oct 2023 16:57:02 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Greg Rose <gregory.v.rose@intel.com>
Cc:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net] ixgbe: fix crash with empty VF macvlan list
Message-ID: <3cee09b8-4c49-4a39-b889-75c0798dfe1c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The adapter->vf_mvs.l list needs to be initialized even if the list is
empty.  Otherwise it will lead to crashes.

Fixes: c6bda30a06d9 ("ixgbe: Reconfigure SR-IOV Init")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
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

