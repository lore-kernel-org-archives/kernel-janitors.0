Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98B9C433E0
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Mar 2021 10:18:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9985364E64
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Mar 2021 10:18:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhCOKSV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Mar 2021 06:18:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229494AbhCOKSM (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Mar 2021 06:18:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E78C964E20;
        Mon, 15 Mar 2021 10:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615803491;
        bh=ztjFnSOab3cV+QvMlWw4cQyrFbAfKoySuSingAe7PWo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CriePN21pXzt27lJKRwsNzeZG2D32OdMximKQQOJn299UKT/IrWzURTlXoOu8qhyr
         QRo3rtv23QkzPIwLhU2DnqPBBf4iCtyTznIwRCVZ5kVQgCyhqNRvpNGdHk+QVYAZW/
         6KBj5eZd7jQrXMFq8BQrB2xOVjPquiGt8Bg/bmjV2WZVcnMe71UiPseXsgoZLUPJVh
         D7fCYHXns7++I0BWpLEBVuRDpRQdcxizxnj/UcrPFA/uePVA84TjxajHPSqAppJRqG
         Vktz8QjduBqy5aPQJQSD8Pv3WIkAtzVKgSI/AANPq6/Gn3V8Yesgjc53Dse01B85vR
         1tAEcdApbKawQ==
Date:   Mon, 15 Mar 2021 15:48:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] phy: ralink: phy-mt7621-pci: fix return value
 check in mt7621_pci_phy_probe()
Message-ID: <YE80X9uGCEsnuR3F@vkoul-mobl>
References: <20210305034931.3237558-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305034931.3237558-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 05-03-21, 03:49, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Fix the return value check which testing the wrong variable
> in mt7621_pci_phy_probe().

Applied, thanks

-- 
~Vinod
