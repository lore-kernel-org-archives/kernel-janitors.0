Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4D2C433DB
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 11:40:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9333164FEB
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 11:40:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbhCKLjr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Mar 2021 06:39:47 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:58437 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232822AbhCKLjT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Mar 2021 06:39:19 -0500
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 87F324000B;
        Thu, 11 Mar 2021 11:39:13 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     'Wei Yongjun <weiyongjun1@huawei.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc:     linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] mtd: parsers: ofpart: make symbol 'bcm4908_partitions_quirks' static
Date:   Thu, 11 Mar 2021 12:39:13 +0100
Message-Id: <20210311113913.305948-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210304064600.3279138-1-weiyongjun1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b87b6d2d6f540e29c3f98e1572d64e560d73d6c1'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2021-03-04 at 06:46:00 UTC, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> drivers/mtd/parsers/ofpart_core.c:25:32: warning:
>  symbol 'bcm4908_partitions_quirks' was not declared. Should it be static?
> 
> This symbol is not used outside of ofpart_core.c, so this
> commit marks it static.
> 
> Fixes: 457da931b608 ("mtd: parsers: ofpart: support BCM4908 fixed partitions")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
