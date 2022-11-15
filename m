Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DB4C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 12:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbiKOMr5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 07:47:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbiKOMrz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 07:47:55 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9906227CFA
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 04:47:54 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id y16so24062297wrt.12
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 04:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffyc+3Px8lcssmkzv0y9PLX2hy8kq/CMeUXykHNYY3w=;
        b=TKaQ6SHznIORCHZi/Y66eKkDxVoWGc73sWGkOaBP1MOyhctvoRyef/iRl9OnEP7wZr
         IFHIYqq00PxZsvtPoen7Rn99qVqicDgiOIXoagCgORk2B2n11irjGzf9NPR+/myPoiaO
         Zt+S0apxpRdZGHbKwODpeGOA6lOkyVOBPndCm/4eHoe+PlLtju+99S2R8bykGFQ3wfR7
         RMEEQz7Ilr3mr+KXHPzGsL5rtAn3sULFzUPtMYieZsQF0zXyC3Ur8JtgXgwAKyn/mRWI
         lbRwvmmLKvg9bEdPrsCtGya0h3gLGMJ8D3jTcZzy5AjBlhJ8LjpHbID2Nn/0kkCzNvyp
         RcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffyc+3Px8lcssmkzv0y9PLX2hy8kq/CMeUXykHNYY3w=;
        b=ce2byiOlHx4u84ilKfmngOYd7K0YGdw2o/rWeHgk6exx6fostsjDWWTfHsH4hwdE5l
         MItuNbOQARj8JMfPlHYa7x3cx4NRnzVt6NPD71qVfjf4ipDcCJjuUcqlHyAU4crqAjcR
         LuEbOzQsqWaXgaDEVQU4OuICR8vgk5an4gSBdIC41a+iKVdKOKZ8OricDI7SnUFVaMeQ
         1B2nitzlNTMHFV4Ek1k0c/hHhq+4VZ/uPBpBOrsFkuPpgmsugKcTqkzb7V+p2NODaHkW
         Cj7nRRwVkEekbIuoLK0x6qQ9wZEFxa0jfyNiFB8YKE0Y/F3gZWLMehzfn0s2ilWiCPV/
         S9Wg==
X-Gm-Message-State: ANoB5pkp5yN9w2ffjAOxXfnHYFsRlOVlYpMfIdK1ZGTQTsMW1oMpXTX6
        G0xack2fru6ZlYJCqdjX0sIaOIKUyb8=
X-Google-Smtp-Source: AA0mqf74iXd/PeyF5Cq+YNknLb4ayLWL0kO+ZivQVD1ijNHwYsdNjqOSCwJPyIKS8ful/PtiHt9wuA==
X-Received: by 2002:adf:f00a:0:b0:236:4838:515d with SMTP id j10-20020adff00a000000b002364838515dmr10320933wro.541.1668516473180;
        Tue, 15 Nov 2022 04:47:53 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m23-20020a05600c3b1700b003cf47556f21sm23156088wms.2.2022.11.15.04.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:47:52 -0800 (PST)
From:   Dan Carpenter <error27@gmail.com>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Tue, 15 Nov 2022 15:47:49 +0300
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] iommufd: vfio: info leak in iommufd_vfio_unmap_dma()
Message-ID: <Y3OKdW/WXVr1VYbc@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If iopt_unmap_iova() fails then "unmapped" is uninitialized.  Copying it
to the user can leak stack information.

Fixes: 32c328dc9b73 ("iommufd: vfio container FD ioctl compatibility")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/iommu/iommufd/vfio_compat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/iommufd/vfio_compat.c b/drivers/iommu/iommufd/vfio_compat.c
index 976aa12b247d..30a13552d632 100644
--- a/drivers/iommu/iommufd/vfio_compat.c
+++ b/drivers/iommu/iommufd/vfio_compat.c
@@ -189,6 +189,9 @@ static int iommufd_vfio_unmap_dma(struct iommufd_ctx *ictx, unsigned int cmd,
 		rc = iopt_unmap_iova(&ioas->iopt, unmap.iova, unmap.size,
 				     &unmapped);
 	}
+	if (rc)
+		goto err_put;
+
 	unmap.size = unmapped;
 	if (copy_to_user(arg, &unmap, minsz))
 		rc = -EFAULT;
-- 
2.35.1

