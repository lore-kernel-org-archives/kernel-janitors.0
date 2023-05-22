Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FECC77B73
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 May 2023 16:00:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233883AbjEVQAA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 May 2023 12:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjEVP77 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 May 2023 11:59:59 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E2D8B0;
        Mon, 22 May 2023 08:59:58 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 25E971BF206;
        Mon, 22 May 2023 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1684771196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VijY4DoUw40fbRYdmVVSksPIq3IaGyWU7geZrDi9jVY=;
        b=gJdAt2AxCyojcPac3vYSG5L9kgkvZ45+X1jCPtnISIjGf8w8v4bfEXbg+xnrHYrV+vz37P
        h4Fczbm62E4yzY8K49bNaCnwIHn6K6eBD7a1q+ZU0jFYwpp+LjuavdECHFo0S16juy7zx0
        /BDeWyoGoWPotVQ9qtwAAbMPT8IX/eq8jVHgcKndvbwden3PdIcB9XOplbckbQrqxcSu4h
        zf4Sd5dG3bbf2I4srFuCMqb8MlPeD/YzhDLh1J1c6TVt12gdOhwduZ4yEoTc3lNtdJX61p
        PCuLsH82GJ+Om+MP/sggqHShHJnIBpGDuSaiaKHfqvGq2cejWWc2KGxy+ArjSw==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: st_spi_fsm: Use the devm_clk_get_enabled() helper function
Date:   Mon, 22 May 2023 17:59:55 +0200
Message-Id: <20230522155955.119637-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To:  <4025ec3980a956b0e776024e88ec960afc457501.1681636580.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a2c2690f0d747c973c6a384ab8cd88faa806e5a5'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 2023-04-16 at 09:16:36 UTC, Christophe JAILLET wrote:
> Use the devm_clk_get_enabled() helper function instead of hand-writing it.
> It saves some line of codes.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
