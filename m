Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C15C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Nov 2021 20:00:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82BE76109F
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Nov 2021 20:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhKCUDN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Nov 2021 16:03:13 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:52100 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbhKCUDN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Nov 2021 16:03:13 -0400
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id iMR0mtlAhUGqliMR1msAVW; Wed, 03 Nov 2021 21:00:35 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 03 Nov 2021 21:00:35 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     leoyang.li@nxp.com, tyreld@linux.ibm.com
Cc:     linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] soc: fsl: guts: Add a missing memory allocation failure check
Date:   Wed,  3 Nov 2021 21:00:33 +0100
Message-Id: <4890990418ecbcfb8921efe8adb2019a03e5a1c1.1635969326.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1063e5a4738d897adcaffce2ab8e4e45f07998ff.1635969326.git.christophe.jaillet@wanadoo.fr>
References: <1063e5a4738d897adcaffce2ab8e4e45f07998ff.1635969326.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If 'devm_kstrdup()' fails, we should return -ENOMEM.

While at it, move the 'of_node_put()' call in the error handling path and
after the 'machine' has been copied.
Better safe than sorry.

Suggested-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure of which Fixes tag to add. Should be a6fc3b698130, but since
another commit needs to be reverted for this patch to make sense, I'm
unsure of what to do. :(
So, none is given.
---
 drivers/soc/fsl/guts.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index af7741eafc57..5ed2fc1c53a0 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -158,9 +158,14 @@ static int fsl_guts_probe(struct platform_device *pdev)
 	root = of_find_node_by_path("/");
 	if (of_property_read_string(root, "model", &machine))
 		of_property_read_string_index(root, "compatible", 0, &machine);
-	of_node_put(root);
-	if (machine)
+	if (machine) {
 		soc_dev_attr.machine = devm_kstrdup(dev, machine, GFP_KERNEL);
+		if (!soc_dev_attr.machine) {
+			of_node_put(root);
+			return -ENOMEM;
+		}
+	}
+	of_node_put(root);
 
 	svr = fsl_guts_get_svr();
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
-- 
2.30.2

