Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1775CC433EF
	for <kernel-janitors@archiver.kernel.org>; Sun, 23 Jan 2022 14:04:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236653AbiAWOEc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 23 Jan 2022 09:04:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233165AbiAWOEc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 23 Jan 2022 09:04:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4994FC06173B
        for <kernel-janitors@vger.kernel.org>; Sun, 23 Jan 2022 06:04:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F2D46B80CEE
        for <kernel-janitors@vger.kernel.org>; Sun, 23 Jan 2022 14:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE27C340E2;
        Sun, 23 Jan 2022 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642946668;
        bh=hVmka7E7LtDJ7yqUAlY3ND4Y2b2jX8U28hzoFzaJHW0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QZPSaLgPAgB8iu+/2baqDruGVT90M6F+qLDAY55lL6CZFTITbe1nG8gXrhabPsf+p
         qAYIVKI7peI2GUJi9f65H3juCkS/orlf2njgoFgkdOjG7nlDjUvZ44DA/9CRAwY+0C
         DqSprkNUW0EqSDlr42R2aSQ8jYnkCfshKBup48SY1il+0gnDv9/0+6GAytWrEeXkdI
         L9UUaCTHSDq+MFWH48D456exm+was4ywuXGPQDGTU0avEQ6W08LCIgGMbQw2JDg9UI
         EHq1DGDrXBWAGxC+NcDtJtDUmAHoXRr8Jyy1OPznL7izbov/48qZixymtlmpMExDJa
         31p+yC+mZK1dA==
Date:   Sun, 23 Jan 2022 19:34:24 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Alan Douglas <adouglas@cadence.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Swapnil Jakhade <sjakhade@cadence.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        linux-phy@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] phy: cadence: Sierra: fix error handling bugs in probe()
Message-ID: <Ye1gaFOYziZDVs25@matsya>
References: <20220115115146.GC7552@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220115115146.GC7552@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 15-01-22, 14:51, Dan Carpenter wrote:
> There are two bugs in the error handling:
> 1: If devm_of_phy_provider_register() fails then there was no cleanup.
> 2: The error handling called of_node_put(child) improperly leading to
>    a use after free.  We are only holding the reference inside the loop
>    so the last two gotos after the loop lead to a use after free bug.
>    Fix this by cleaning up the partial allocations (or partial iterations)
>    in the loop before doing the goto.

Applied, thanks

-- 
~Vinod
