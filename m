Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137DFC07E99
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jul 2021 14:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E84D261166
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jul 2021 14:52:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235151AbhGLOzE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jul 2021 10:55:04 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:38514
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230363AbhGLOzD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jul 2021 10:55:03 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 7F50840333;
        Mon, 12 Jul 2021 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1626101534;
        bh=6mChaTRrRo5NJxfSodjvtDgtiVHur+FmvKowXRGTUv4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=quluxzmNdNi2uCeQui6xbaakshfBlhRPDysfwhQycHbV0OoIJ4uDbIpki35krlu7A
         d0BvpjZfmzLldwOpelIqfdRFKUCRAyL7h7cmIsOemNS/jAfH3etyolNSXPpZK30PRq
         mY3t48FtzMNufTeF64IRcbhRZ97j7DeyXDVqqZIVo2Y2Abnk9FZXjg74rsYzcJKZxJ
         PzdrQo7uBXkE8dsY3TcLet0UWXNtNNh1d/keAZnlbtQm62xjv4I51mzVOYHBk5zXiH
         WFcfPzOsjRO10aAekG/M//H4qT9/BrQsbDjx7OyWaZWW2T9tHAW/GxrjC3WpIVyAMI
         DS2J0jB/u8p/Q==
From:   Colin King <colin.king@canonical.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Heiko Schocher <hs@denx.de>, linux-mtd@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: devices: mchp48l640: Fix memory leak on cmd
Date:   Mon, 12 Jul 2021 15:52:14 +0100
Message-Id: <20210712145214.101377-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The allocation for cmd is not being kfree'd on the return leading to
a memory leak. Fix this by kfree'ing it.

Addresses-Coverity: ("Resource leak")
Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/devices/mchp48l640.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index efc2003bd13a..c0b1a7bb7d13 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -255,6 +255,7 @@ static int mchp48l640_read_page(struct mtd_info *mtd, loff_t from, size_t len,
 	if (!ret)
 		*retlen += len;
 
+	kfree(cmd);
 	return ret;
 
 fail:
-- 
2.31.1

