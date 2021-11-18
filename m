Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3F9C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 19:37:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE92F61507
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 19:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbhKRTkZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Nov 2021 14:40:25 -0500
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:53163 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232573AbhKRTkY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Nov 2021 14:40:24 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id nnDgmyLViMxZunnDgmeMWx; Thu, 18 Nov 2021 20:37:23 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 18 Nov 2021 20:37:23 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     elder@kernel.org, davem@davemloft.net, kuba@kernel.org
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] net: ipa: Use 'for_each_clear_bit' when possible
Date:   Thu, 18 Nov 2021 20:37:15 +0100
Message-Id: <07566ce40d155d88b60c643fee2d030989037405.1637264172.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use 'for_each_clear_bit()' instead of hand writing it. It is much less
version.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ipa/ipa_mem.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
index 4337b0920d3d..1e9eae208e44 100644
--- a/drivers/net/ipa/ipa_mem.c
+++ b/drivers/net/ipa/ipa_mem.c
@@ -266,9 +266,7 @@ static bool ipa_mem_valid(struct ipa *ipa, const struct ipa_mem_data *mem_data)
 	}
 
 	/* Now see if any required regions are not defined */
-	for (mem_id = find_first_zero_bit(regions, IPA_MEM_COUNT);
-	     mem_id < IPA_MEM_COUNT;
-	     mem_id = find_next_zero_bit(regions, IPA_MEM_COUNT, mem_id + 1)) {
+	for_each_clear_bit(mem_id, regions, IPA_MEM_COUNT) {
 		if (ipa_mem_id_required(ipa, mem_id))
 			dev_err(dev, "required memory region %u missing\n",
 				mem_id);
-- 
2.30.2

