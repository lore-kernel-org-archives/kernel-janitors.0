Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77C5C433B4
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 May 2021 09:24:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA2AF61073
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 May 2021 09:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347840AbhERJZ6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 May 2021 05:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344886AbhERJZ5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 May 2021 05:25:57 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABAAC061573;
        Tue, 18 May 2021 02:24:40 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id C4AEF2FA; Tue, 18 May 2021 11:24:38 +0200 (CEST)
Date:   Tue, 18 May 2021 11:24:37 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Will Deacon <will@kernel.org>,
        virtualization@lists.linux-foundation.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] iommu/virtio: Add missing MODULE_DEVICE_TABLE
Message-ID: <YKOH1SvN0CrfRgZ9@8bytes.org>
References: <20210508031451.53493-1-cuibixuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508031451.53493-1-cuibixuan@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 08, 2021 at 11:14:51AM +0800, Bixuan Cui wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---
>  drivers/iommu/virtio-iommu.c | 1 +
>  1 file changed, 1 insertion(+)

Applied for v5.13, thanks.
