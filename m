Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48586C71153
	for <kernel-janitors@archiver.kernel.org>; Mon,  4 Sep 2023 20:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235863AbjIDUEQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 4 Sep 2023 16:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237501AbjIDUEO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Sep 2023 16:04:14 -0400
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2BD5DD
        for <kernel-janitors@vger.kernel.org>; Mon,  4 Sep 2023 13:04:10 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id dFnsqeWR37HAOdFnsqxQGU; Mon, 04 Sep 2023 22:04:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1693857849;
        bh=p/ePUhbEsRogcdOokxHPN81xEb+34R42Kt7trfh06kc=;
        h=From:To:Cc:Subject:Date;
        b=q55uE2v83Tm0Ytfab1UpSOVaNxjLh2LMFpphVfzgxA1fGQRdV4ReZ4gqEczUc+OKG
         0NFm0fWvSTkPWE4SoNN/LedDe4mVGrwlX/W+2rg+MTs/BSmV28vuw1URR7PsYYzuXk
         pbCWkovv2ZQ3mRAaUBqBBSre2CLg78EX4ZK/CLVzrCCB8tCI60yGYaPxNsjgMHbZld
         bAlbDn3Lcy2eeYB+pMMnTk1jK5D/4DagGocCmha1UPWV6qfflJZpQQgWzUDkh+UE1q
         a7VOjR36sXcVOc8Ih1A3aJQlGd2t8eZPvHSaloy/Wuuuurg8MzSFTe6rfQiOJ9rNeh
         evtZCsiE1r1YQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 04 Sep 2023 22:04:09 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] regmap: debugfs: Fix a erroneous check after snprintf()
Date:   Mon,  4 Sep 2023 22:04:06 +0200
Message-Id: <8595de2462c490561f70020a6d11f4d6b652b468.1693857825.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This error handling looks really strange.
Check if the string has been truncated instead.

Fixes: f0c2319f9f19 ("regmap: Expose the driver name in debugfs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/base/regmap/regmap-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/regmap-debugfs.c
index f36027591e1a..bdd80b73c3e6 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@ -48,7 +48,7 @@ static ssize_t regmap_name_read_file(struct file *file,
 		name = map->dev->driver->name;
 
 	ret = snprintf(buf, PAGE_SIZE, "%s\n", name);
-	if (ret < 0) {
+	if (ret >= PAGE_SIZE) {
 		kfree(buf);
 		return ret;
 	}
-- 
2.34.1

