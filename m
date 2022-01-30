Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4B3C433EF
	for <kernel-janitors@archiver.kernel.org>; Sun, 30 Jan 2022 08:20:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354384AbiA3IUt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 30 Jan 2022 03:20:49 -0500
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:58112 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354378AbiA3IUr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 30 Jan 2022 03:20:47 -0500
Received: from pop-os.home ([90.126.236.122])
        by smtp.orange.fr with ESMTPA
        id E5S2nTPu9uCn2E5S2n1kH4; Sun, 30 Jan 2022 09:20:46 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 30 Jan 2022 09:20:46 +0100
X-ME-IP: 90.126.236.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-input@vger.kernel.org
Subject: [PATCH] Input: spear-keyboard - Simplify resource management
Date:   Sun, 30 Jan 2022 09:20:44 +0100
Message-Id: <c4b6e8b122259198ce76f42bf786b75cfd0cbffc.1643530826.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Since the commit in the Fixes tag below, 'kbd->input' is a managed resource
that doesn't need to be explicitly unregistered or freed (see
devm_input_allocate_device() documentation)

So, remove a unless line of code to slightly simplify it.

Fixes: 6102752eb354 ("Input: spear-keyboard - switch to using managed resources")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/input/keyboard/spear-keyboard.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index 9838c79cb288..c36836159fb3 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -278,7 +278,6 @@ static int spear_kbd_remove(struct platform_device *pdev)
 {
 	struct spear_kbd *kbd = platform_get_drvdata(pdev);
 
-	input_unregister_device(kbd->input);
 	clk_unprepare(kbd->clk);
 
 	return 0;
-- 
2.32.0

