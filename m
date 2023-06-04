Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4263C7EE23
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Jun 2023 04:44:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbjFDEoX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Jun 2023 00:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjFDEoV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Jun 2023 00:44:21 -0400
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759C8D8
        for <kernel-janitors@vger.kernel.org>; Sat,  3 Jun 2023 21:44:20 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id 5fbGqlk8R8aX95fbGqkWVn; Sun, 04 Jun 2023 06:44:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1685853858;
        bh=yuCvWJusB0jjXwJ/HnT0XtQ4exUNOe6cHL/s4AWv+dQ=;
        h=From:To:Cc:Subject:Date;
        b=aTFm+I9YSsneXEOM9vJJVrcWs/ud1UsnfbBeeaaPXgDK2MLld+4yfcytK3Yo6H7zl
         Dr0uVon4mdyX0pha25rbg/aAGyDp3lCvCVwMlp3FjU4TiLMAt7QeCw6xyG0jSjsfOL
         e6dXBKjpgDBRTY141rPV0MZLruGkKJdCYM/veS78wgOBL9xBCIkFEu91Id4KVlj6Fu
         PIj2fwqSSRF+P7mq1JT6YdZ0tdquMlLJedaV9XPj2not3B+IGr29xHp5Qln0VwfRj/
         kc9/IFM+EkS7O7yNdiVZX3aAH2eqjLLYLc6c/yGGEoSPXVEa/07+85yfYOYTUK9EUB
         +Y2H2yicOoj1w==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 04 Jun 2023 06:44:18 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] cdx: Drop useless LIST_HEAD
Date:   Sun,  4 Jun 2023 06:44:17 +0200
Message-Id: <cee692c7babd754c1c36186af116c4bb4dad0a17.1685853842.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'cleanup_list' is unused, so drop it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/cdx/controller/mcdi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cdx/controller/mcdi.c b/drivers/cdx/controller/mcdi.c
index a211a2ca762e..03e34f214aea 100644
--- a/drivers/cdx/controller/mcdi.c
+++ b/drivers/cdx/controller/mcdi.c
@@ -611,7 +611,6 @@ void cdx_mcdi_process_cmd(struct cdx_mcdi *cdx, struct cdx_dword *outbuf, int le
 {
 	struct cdx_mcdi_iface *mcdi;
 	struct cdx_mcdi_cmd *cmd;
-	LIST_HEAD(cleanup_list);
 	unsigned int respseq;
 
 	if (!len || !outbuf) {
-- 
2.34.1

