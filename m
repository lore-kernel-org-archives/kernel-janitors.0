Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76041C433B4
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Apr 2021 12:05:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39EF761042
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Apr 2021 12:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbhDTMFs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Apr 2021 08:05:48 -0400
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:18696 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232066AbhDTMFr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Apr 2021 08:05:47 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d66 with ME
        id v05C2400Q21Fzsu0305CQX; Tue, 20 Apr 2021 14:05:13 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 20 Apr 2021 14:05:13 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     gregkh@linuxfoundation.org
Cc:     linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] staging: octeon: Use 'for_each_child_of_node'
Date:   Tue, 20 Apr 2021 14:05:10 +0200
Message-Id: <eaffe388e6c51e97caf3e8fa474de74428575455.1618920182.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use 'for_each_child_of_node' instead of hand writing it.
This saves a few line of code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/octeon/ethernet.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index da7c2cd8ebb8..dcbba9621b21 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -610,14 +610,11 @@ static const struct net_device_ops cvm_oct_pow_netdev_ops = {
 static struct device_node *cvm_oct_of_get_child
 				(const struct device_node *parent, int reg_val)
 {
-	struct device_node *node = NULL;
-	int size;
+	struct device_node *node;
 	const __be32 *addr;
+	int size;
 
-	for (;;) {
-		node = of_get_next_child(parent, node);
-		if (!node)
-			break;
+	for_each_child_of_node(parent, node) {
 		addr = of_get_property(node, "reg", &size);
 		if (addr && (be32_to_cpu(*addr) == reg_val))
 			break;
-- 
2.27.0

