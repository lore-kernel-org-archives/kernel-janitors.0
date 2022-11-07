Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3C9C433FE
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Nov 2022 16:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbiKGQ1b (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Nov 2022 11:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232601AbiKGQ0m (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Nov 2022 11:26:42 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 994C422506
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Nov 2022 08:22:54 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5484BFF80B;
        Mon,  7 Nov 2022 16:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667838165;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PndAaPKemHvlm2tLxb20P+WzuvGUnNrFNVEmOkXku6c=;
        b=feg9F5/mvBOx7RbnKmvlvp3aWIduN9dXsALMILBj6ARS8InNYVxk6SHpSmZ8PZmj3QLn7y
        otFym7bEXiLIIR2/RABX0Ma547l+4JgG+4vshtWeF3C1hv2hTEters5AzVeorrGXxqi+2v
        UCH7YYuCFCMENRKRM8f5E29+9CkK+FJE4RYZS5slQNHYRV2JQ5yMNWHGn1dC9AMhK5YOch
        0vLvKHG14gnHXLr+tMERMvtjdt1jYhqd/87pnO5kPswM6Vm1JWulQYUYPoOhT1JsJcSuow
        DpcYN+WCF9LQfyLQxW08DUsnadEjOaoWO+AXOwpTITFMR1IFTfD7lRLLoPz7lQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: tplink_safeloader: fix uninitialized variable bug
Date:   Mon,  7 Nov 2022 17:22:42 +0100
Message-Id: <20221107162242.49236-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Y1gCALFWXYYwqV1P@kili>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6c0a15a3dc6b45156c5b9568c8308e3f0d802af0'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 2022-10-25 at 15:34:24 UTC, Dan Carpenter wrote:
> On 64 bit systems, the highest 32 bits of the "offset" variable are
> not initialized.  Also the existing code is not endian safe (it will
> fail on big endian systems).  Change the type of "offset" to a u32.
> 
> Fixes: aec4d5f5ffd0 ("mtd: parsers: add TP-Link SafeLoader partitions table parser")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Rafał Miłecki <rafal@milecki.pl>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
