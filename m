Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5043EB64DA
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 08:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbjFSInP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 04:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbjFSImz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 04:42:55 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B893A9E
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 01:40:49 -0700 (PDT)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1687163975;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MT6uDaSkCDJITV06UAl2h0AfMSfuqotMYDYo0551NCk=;
        b=W1jYyYog3H4BR24DLohzhRwLtxM9EFAsZK1tS2ADvcS6DP7AWOxbTOg75u1s1VdxxuTA6I
        7l1Wp7rlwGeTtrWovPVRMtjdEcCPxEVDWr7jUIkY9GGbtP1mAAG5aUL+EnnxZXPmnLOL3A
        tjj6k4++lmMPhdXKJmS9ZiU4SGiDYhwSiQk7kmaqwCqQVumj/6XNYLMCZjv4IN9eFjZAK0
        CvgFUPlp+O4fEwajlfP7QT9oYcJhLnA2CnBc1KSCtoIJ4FQ+o4RNOqPrs5B7Vadzh8gY4X
        7sp7PsBC+kCx3AznY9TLfGh85KW1K+R6WbaKdTKoJri05zL49U/bJAdcKMyjtw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A89591BF206;
        Mon, 19 Jun 2023 08:39:34 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: otp: clean up on error in mtd_otp_nvmem_add()
Date:   Mon, 19 Jun 2023 10:39:34 +0200
Message-Id: <20230619083934.2940387-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <fe7ef901-9571-4c6e-a40e-449046efe2c6@moroto.mountain>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cefa1aaa31bd7bb73a37c15ec66a9353753b2abc'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2023-06-15 at 06:09:20 UTC, Dan Carpenter wrote:
> Smatch complains that these error paths are missing cleanup:
> 
>     drivers/mtd/mtdcore.c:983 mtd_otp_nvmem_add()
>     warn: missing unwind goto?
> 
> This needs to call nvmem_unregister(mtd->otp_user_nvmem) before
> returning.
> 
> Fixes: 3b270fac8443 ("mtd: otp: Put factory OTP/NVRAM into the entropy pool")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
