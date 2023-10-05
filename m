Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28433E92702
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Oct 2023 14:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237060AbjJEOiB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235245AbjJEOfe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Oct 2023 10:35:34 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37940902A
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Oct 2023 06:58:23 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3226b8de467so1029635f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Oct 2023 06:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696514285; x=1697119085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cbV1aUniv7FDwoYe4l9QjP2aDA1u/O0qniF8u91BDus=;
        b=pZrE38V/8z8QcVKvZoFHf9jCSpU3SPDoj1toEPUHTKaxcyzxQg8HngyjXDQfifmtI4
         eNT8EEh6tZyPDu3KWaR7tDH2/qyezYGAw0Q0N2NQnY4AYb696fLFQ/J5srNnY5n3S2Hp
         9CDcJRd7bJAx3Cq6C7NZd4QRTwViH4gmEkt03F3QGERB1Gl7M1Kk29xJOEFSRgokOVAq
         5db2kL7hiPyjfubPVx4Qp8bC0sieI6gy30HTFrFVFMyGDYCwTHzcEdO//SFhtBM8z1Ck
         ljdVEsO8mElBTB2XQhRGaqLBRLw4rNCkxUOoyCt8LFM4FX8DP9hO2l9C3X7JLnysd2NC
         QnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696514285; x=1697119085;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbV1aUniv7FDwoYe4l9QjP2aDA1u/O0qniF8u91BDus=;
        b=ZouvWgnu9v8DLUhqP/zATGnkrlXsmZMYXbZCFtwQRZjJqPFQi8tc3kBgojrXYFzPzL
         xCs/zKg41SSGA2s69T5nkwHTUD5A/dWs1hwH6u0IJe9beT/q5yKusDJzTK5k6bIyvfTZ
         OdqfjYGEZTbRspji+cujEcOVuQ6jL9UB8uz2WY2gzKmBtFjt5LQ8/LaLwAoLvlBwRkqD
         8DbbmrKMUn1zV7uU5pxzH3Q22T53jmqJU0sgpmxxW3qs7WZZ/1tNTqosA7y0cOLADCge
         +PkYzqzS6rh4XUu1JzbQloaI/pJV3+9B8hNhFxYSDg8Y8YdNr7gufIfh9G4izjdMYMZr
         mJ/w==
X-Gm-Message-State: AOJu0Ywn8wlm5gfr7QM83M1CoIRKoCuz4KRj17pbS2+niZoHXa7yMiTE
        eTwqbpGpP1omx1t4qap+d6S4Tw==
X-Google-Smtp-Source: AGHT+IE/iWnwqmpAF4wqaA6W5GsdMwBdfNIcUdBB5OSIxRFtjMweSLN1TdvH9Iybz2DfnfNeSgB9KA==
X-Received: by 2002:a5d:538e:0:b0:317:6a7c:6e07 with SMTP id d14-20020a5d538e000000b003176a7c6e07mr4788087wrv.32.1696514284749;
        Thu, 05 Oct 2023 06:58:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e14-20020a5d594e000000b0030ae53550f5sm1858644wri.51.2023.10.05.06.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 06:58:04 -0700 (PDT)
Date:   Thu, 5 Oct 2023 16:58:01 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jinjie Ruan <ruanjinjie@huawei.com>
Cc:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Simon Horman <horms@kernel.org>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net-next 2/2] ixgbe: fix end of loop test in
 ixgbe_set_vf_macvlan()
Message-ID: <34603f41-1d51-48df-9bca-a28fd5b27a53@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d61f086-c7b4-4762-b025-0ba5df08968b@moroto.mountain>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The list iterator in a list_for_each_entry() loop can never be NULL.
If the loop exits without hitting a break then the iterator points
to an offset off the list head and dereferencing it is an out of
bounds access.

Before we transitioned to using list_for_each_entry() loops, then
it was possible for "entry" to be NULL and the comments mention
this.  I have updated the comments to match the new code.

Fixes: c1fec890458a ("ethernet/intel: Use list_for_each_entry() helper")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../net/ethernet/intel/ixgbe/ixgbe_sriov.c    | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
index 4c6e2a485d8e..a703ba975205 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
@@ -639,6 +639,7 @@ static int ixgbe_set_vf_macvlan(struct ixgbe_adapter *adapter,
 				int vf, int index, unsigned char *mac_addr)
 {
 	struct vf_macvlans *entry;
+	bool found = false;
 	int retval = 0;
 
 	if (index <= 1) {
@@ -660,22 +661,22 @@ static int ixgbe_set_vf_macvlan(struct ixgbe_adapter *adapter,
 	if (!index)
 		return 0;
 
-	entry = NULL;
-
 	list_for_each_entry(entry, &adapter->vf_mvs.l, l) {
-		if (entry->free)
+		if (entry->free) {
+			found = true;
 			break;
+		}
 	}
 
 	/*
 	 * If we traversed the entire list and didn't find a free entry
-	 * then we're out of space on the RAR table.  Also entry may
-	 * be NULL because the original memory allocation for the list
-	 * failed, which is not fatal but does mean we can't support
-	 * VF requests for MACVLAN because we couldn't allocate
-	 * memory for the list management required.
+	 * then we're out of space on the RAR table.  It's also possible
+	 * for the &adapter->vf_mvs.l list to be empty because the original
+	 * memory allocation for the list failed, which is not fatal but does
+	 * mean we can't support VF requests for MACVLAN because we couldn't
+	 * allocate memory for the list management required.
 	 */
-	if (!entry || !entry->free)
+	if (!found)
 		return -ENOSPC;
 
 	retval = ixgbe_add_mac_filter(adapter, mac_addr, vf);
-- 
2.39.2

