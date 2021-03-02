Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD170C433E0
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Mar 2021 06:15:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 704D164EC6
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Mar 2021 06:15:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345145AbhCCGHC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 01:07:02 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:53901 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835423AbhCBTGX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Mar 2021 14:06:23 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 902CE3A88B0;
        Tue,  2 Mar 2021 16:35:58 +0000 (UTC)
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E999CFF80E;
        Tue,  2 Mar 2021 16:32:42 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vipin Kumar <vipin.kumar@st.com>
Cc:     Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: fsmc: Fix error code in fsmc_nand_probe()
Date:   Tue,  2 Mar 2021 17:32:42 +0100
Message-Id: <20210302163242.23393-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <YCqaOZ83OvPOzLwh@mwanda>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: d49ecd70c82d89c7448f5623ae08d0a4a488dc72
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 2021-02-15 at 15:58:49 UTC, Dan Carpenter wrote:
> If dma_request_channel() fails then the probe fails and it should
> return a negative error code, but currently it returns success.
> 
> fixes: 4774fb0a48aa ("mtd: nand/fsmc: Add DMA support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
