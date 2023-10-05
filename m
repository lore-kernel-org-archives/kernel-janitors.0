Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05620E92706
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Oct 2023 14:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237301AbjJEOi4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235975AbjJEOg0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Oct 2023 10:36:26 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB0C3B49E
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Oct 2023 07:00:22 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40684f53d11so9598115e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Oct 2023 07:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696514415; x=1697119215; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKYvXra/D0tLphe3ZYt8M2FkTUMUP0fbv8DSSHNP3AU=;
        b=q4HA2HFPnByx2wqryKNgqw7msNORxZy4rtAadz53kSnuGzKXoU5CALJUlPMjAkIcws
         qaj7dSLiV6U1u8lFE1A7o79bCJTHxXe2NC3PIwNgo6vwY1VdjMArA4Jg4zKlbf9Z5kwK
         XknL/scw5r5t6yLHgfpQ7g68TBkQIt86sO0YRS+DQylp1sGM+hMvtKcsIyDjZzPd3GWp
         xcvy2ow0i4UHquJrs8fMN47sdLEcg2NcJkeY05Cn5TkOv9L2/Q2cIp07f7EE54OiDcFk
         BuljjSEQDhwPeHQV9UthYNhdEBXVbxWU1sV3/If1j2dvHuB+k82B4FfOm+ravcz5LKA+
         hRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696514415; x=1697119215;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XKYvXra/D0tLphe3ZYt8M2FkTUMUP0fbv8DSSHNP3AU=;
        b=qa8fU8Ok++jzugsGJ7KaoAu+Qht0WBVmnRQxrRga+TlHKwX2zbTxQj0DnjU5zrzJ4o
         6izSZKUmCTEm/QCgJKsrMxXKz1nVL9w+v+0lzpLF5T3kiA4g3IT4Mn9g7SefRxmMnx1G
         YBiD78lSOfqB2JtmJULmy1TBAmvHqE2moAPvQsaUuSVhNAVcMXjQ3PzgGN4KMhT0iUPx
         SoK5cgP0LbzvbLOl9FrkUntOpwbtzKA+pFQ1tFLo9fiMrBliy6cXiYpn1xHrDe5apqAP
         6mEyXGJJueBo++BrCiBO3nbNued+G/W3dhBupZIEEVEn4PmjQseGj9SUgLyyQx8mYkSQ
         qMQw==
X-Gm-Message-State: AOJu0YxWEDNUIXTL7Whv5U8OHL3h6dlZ38SVemB63rj4ns2zftxLqvas
        vkoOBe3jVKxNxq2PGY9s1UD7Zw==
X-Google-Smtp-Source: AGHT+IFeXTKirNHzitQdtS6ll6h532Honm6zVck6PvhrBG0gk4w02aInvnn9ivNnit9lXF/4TmElFA==
X-Received: by 2002:a05:600c:2981:b0:403:8fb9:8d69 with SMTP id r1-20020a05600c298100b004038fb98d69mr4991682wmd.25.1696514415402;
        Thu, 05 Oct 2023 07:00:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id hn32-20020a05600ca3a000b004053e9276easm3840958wmb.32.2023.10.05.07.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:00:15 -0700 (PDT)
Date:   Thu, 5 Oct 2023 17:00:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Ido Schimmel <idosch@mellanox.com>
Cc:     Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net] mlxsw: fix mlxsw_sp2_nve_vxlan_learning_set() return type
Message-ID: <6b2eb847-1d23-4b72-a1da-204df03f69d3@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The mlxsw_sp2_nve_vxlan_learning_set() function is supposed to return
zero on success or negative error codes.  So it needs to be type int
instead of bool.

Fixes: 4ee70efab68d ("mlxsw: spectrum_nve: Add support for VXLAN on Spectrum-2")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum_nve_vxlan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_nve_vxlan.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_nve_vxlan.c
index bb8eeb86edf7..52c2fe3644d4 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_nve_vxlan.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_nve_vxlan.c
@@ -310,8 +310,8 @@ const struct mlxsw_sp_nve_ops mlxsw_sp1_nve_vxlan_ops = {
 	.fdb_clear_offload = mlxsw_sp_nve_vxlan_clear_offload,
 };
 
-static bool mlxsw_sp2_nve_vxlan_learning_set(struct mlxsw_sp *mlxsw_sp,
-					     bool learning_en)
+static int mlxsw_sp2_nve_vxlan_learning_set(struct mlxsw_sp *mlxsw_sp,
+					    bool learning_en)
 {
 	char tnpc_pl[MLXSW_REG_TNPC_LEN];
 
-- 
2.39.2

