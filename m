Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B96C38145
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Sep 2022 08:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbiIGIuw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Sep 2022 04:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiIGIut (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Sep 2022 04:50:49 -0400
X-Greylist: delayed 395 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 07 Sep 2022 01:50:47 PDT
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6AD1867C9B
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Sep 2022 01:50:46 -0700 (PDT)
Received: from 8bytes.org (p4ff2bb62.dip0.t-ipconnect.de [79.242.187.98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 073E92409C6;
        Wed,  7 Sep 2022 10:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1662540178;
        bh=aeiwbQEgBpapvaY7ytdFXeTg25jW4Hho6BQgko/uSo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ybrvhuHH/0sg1fsiTj3xXvm7D6/3/FoRWzLfkVes9BH5BckhJWiA9sO2useBgL0F6
         D/km/dQBfJ9a1CcIiFJdkR+x8bGmVRDc67aqVciFVMaQ2pdxY28TB/kkh4u+qT4+qD
         Ymg8xe7mkW5IssYhgYkEGQQ2So35beEjUo8QoGQ1PB36+PFDZcuFL75SjaezUUJMkx
         iRSTPkUaSAVMC0EdY6vL85GweUbx+gKc21We8y300j1CILSqr8eOIKUVM00qDywKvW
         IysM5xiCcgOPnPjIfaBWIZZqxthWKe2lx9XesiYHjSv87Hp7lG6eIvXY9wy83NROUn
         Le27lTQGmj5qg==
Date:   Wed, 7 Sep 2022 10:42:56 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Suman Anna <s-anna@ti.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        iommu@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/omap: fix buffer overflow in debugfs
Message-ID: <YxhZkCUD4UbUKLOp@8bytes.org>
References: <YuvYh1JbE3v+abd5@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuvYh1JbE3v+abd5@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 04, 2022 at 05:32:39PM +0300, Dan Carpenter wrote:
>  drivers/iommu/omap-iommu-debug.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.
