Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8EEC54EE9
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Sep 2022 08:35:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiITIff (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Sep 2022 04:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiITIei (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Sep 2022 04:34:38 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8769E65803;
        Tue, 20 Sep 2022 01:34:18 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id CD3D1200011;
        Tue, 20 Sep 2022 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1663662857;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rOwFYv/H167Jq2tKcIfit4SwJjZQJhU3ar7V8zFQDPQ=;
        b=EWrXbC1zQQDNP2M18sF/5bzyfkcEx9v+VeaDYW+GLm3+sy1vAxB1PW2tX5yfbOvB44sOGN
        tAJYW/R2nMfSYfYnv8lGGQjJ8FOQrVRM6cu+jf999nwUzLs/SI+Q+0RHzEGYT6vyD0zkGP
        4U+5DRpJj0n+x5x5JJjqp8zLHxUEqkZVtVI32//lnWREf6FP2mBSjxy9g0ue1eBgppga4y
        zffEcmmCgNp8mN9oMm7uQPLmY1dQQ4AMuFah2aQHPhPnVmnzqQT62QjynDm1pzrTzHUNQ+
        +To4K8idIR2vcYBK5txzTr0XQe0c6DmCqiTov89abKCzHl47ZzaVKCCZGY7+vg==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: orion: Use devm_clk_get_optional()
Date:   Tue, 20 Sep 2022 10:34:15 +0200
Message-Id: <20220920083415.601259-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To:  <a5bde48e3e1165dd65d1d1c1739e03ace1bef5d3.1659907229.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd50a0d3f26f8f1841b4375df35871f1273eb5686'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 2022-08-07 at 21:20:51 UTC, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> 
> While at it, use dev_err_probe() to further simplify the code. This is also
> less verbose if clk_get() returns -EPROBE_DEFER.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
