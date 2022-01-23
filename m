Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32F5C433FE
	for <kernel-janitors@archiver.kernel.org>; Sun, 23 Jan 2022 15:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237438AbiAWPXJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 23 Jan 2022 10:23:09 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:57177 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237432AbiAWPXH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 23 Jan 2022 10:23:07 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id F2A67100005;
        Sun, 23 Jan 2022 15:22:56 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Joern Engel <joern@lazybastard.org>,
        yangerkun <yangerkun@huawei.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] mtd: phram: Prevent divide by zero bug in phram_setup()
Date:   Sun, 23 Jan 2022 16:22:56 +0100
Message-Id: <20220123152256.529296-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220121115505.GI1978@kadam>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4f82eb6b4aec9d584c9dd370087db7a87c88bcb6'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 2022-01-21 at 11:55:05 UTC, Dan Carpenter wrote:
> The problem is that "erasesize" is a uint64_t type so it might be
> non-zero but the lower 32 bits are zero so when it's truncated,
> "(uint32_t)erasesize", then that value is zero. This leads to a
> divide by zero bug.
> 
> Avoid the bug by delaying the divide until after we have validated
> that "erasesize" is non-zero and within the uint32_t range.
> 
> Fixes: dc2b3e5cbc80 ("mtd: phram: use div_u64_rem to stop overwrite len in phram_setup")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
