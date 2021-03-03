Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B146C433DB
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22BB864DDA
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245157AbhCDAVI convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:21:08 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:49669 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842906AbhCCKWW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 05:22:22 -0500
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 5E7503B0C2F;
        Wed,  3 Mar 2021 09:47:16 +0000 (UTC)
X-Originating-IP: 86.206.8.148
Received: from xps13 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 87D3BE0003;
        Wed,  3 Mar 2021 09:46:52 +0000 (UTC)
Date:   Wed, 3 Mar 2021 10:46:51 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: nand: Fix error handling in
 nand_prog_page_op
Message-ID: <20210303104651.2d49fb2c@xps13>
In-Reply-To: <20210303094246.5724-1-colin.king@canonical.com>
References: <20210303094246.5724-1-colin.king@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

Colin King <colin.king@canonical.com> wrote on Wed,  3 Mar 2021
09:42:46 +0000:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The less than zero comparison with status is always false because status
> is a u8. Fix this by using ret as the return check for the call to
> chip->legacy.waitfunc() and checking on this and assigning status to ret
> if it is OK.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 52f67def97f1 ("mtd: nand: fix error handling in nand_prog_page_op() #1")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for the fix, but this has been handled just an hour ago :)

Cheers,
Miquèl
