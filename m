Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0557BC433F5
	for <kernel-janitors@archiver.kernel.org>; Fri,  3 Dec 2021 13:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244714AbhLCNws (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 3 Dec 2021 08:52:48 -0500
Received: from mslow1.mail.gandi.net ([217.70.178.240]:44447 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238055AbhLCNwn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Dec 2021 08:52:43 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id B9655CA9C6
        for <kernel-janitors@vger.kernel.org>; Fri,  3 Dec 2021 13:37:49 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4705FFF812;
        Fri,  3 Dec 2021 13:37:26 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc:     linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: gen_probe: Use bitmap_zalloc() when applicable
Date:   Fri,  3 Dec 2021 14:37:25 +0100
Message-Id: <20211203133725.1449978-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To:  <a6fe58dffe553a3e79303777d3ba9c60d7613c5b.1637510255.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c4f0d9a63fab954e2c00152919eabc5be67205ec'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 2021-11-21 at 15:59:12 UTC, Christophe JAILLET wrote:
> 'chip_map' is a bitmap. So use 'bitmap_zalloc()' to simplify code,
> improve the semantic and avoid some open-coded arithmetic in allocator
> arguments.
> 
> Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
> consistency.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
