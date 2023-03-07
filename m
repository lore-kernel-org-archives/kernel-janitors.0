Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 234A5C678D4
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Mar 2023 19:34:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbjCGTe6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Mar 2023 14:34:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233221AbjCGTej (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Mar 2023 14:34:39 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30714A0F32;
        Tue,  7 Mar 2023 11:21:32 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9AF451BF205;
        Tue,  7 Mar 2023 19:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1678216891;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RxdKgF0FoJ8o93pAtFh/ei+gKLeFCdS2rikMZuG/uH0=;
        b=Y2NDczmdy4t+ddy4/B7pcehkSH7NVY7Yh9fCf/HP/QTBG6VfvC2+qeuZiq3PT2TtZEvHrh
        dNskcRbXB3YfRTcr9S35hQNf/r+GT0yGxphzV8C6QBz8AEZMwu+pCrG0Iz76pPhlLh4/NU
        ijID7TxI6NhaqnC2BrIwT0cHLsfyX+3HYlmIuNAy8uk5soatKdReOvBmBHRJdzvpSx//zl
        Fi+wCcmqlJAkGvmbrJfamt7FXMNSsE+KeE+GDXMGbmkccpso6uvHyStZc2gMhlwk6P2cKU
        icL5Ue1qo6pSFqC7qYd7lafsir/AWK7Y2ZGGCO5DlLAhtkYNfMNiTimhQ42Phg==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: mxic-ecc: Fix mxic_ecc_data_xfer_wait_for_completion() when irq is used
Date:   Tue,  7 Mar 2023 20:21:27 +0100
Message-Id: <20230307192127.274869-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To:  <beddbc374557e44ceec897e68c4a5d12764ddbb9.1676459308.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'75dce6a941e3f16c3b4878c8b2f46d5d07c619ce'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 2023-02-15 at 11:08:45 UTC, Christophe JAILLET wrote:
> wait_for_completion_timeout() and readl_poll_timeout() don't handle their
> return value the same way.
> 
> wait_for_completion_timeout() returns 0 on time out (and >0 in all other
> cases)
> readl_poll_timeout() returns 0 on success and -ETIMEDOUT upon a timeout.
> 
> In order for the error handling path to work in both cases, the logic
> against wait_for_completion_timeout() needs to be inverted.
> 
> Fixes: 48e6633a9fa2 ("mtd: nand: mxic-ecc: Add Macronix external ECC engine support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel
