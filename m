Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13094C38147
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 Jan 2023 18:54:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjARSyB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 18 Jan 2023 13:54:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjARSyA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Jan 2023 13:54:00 -0500
Received: from aib29gb127.yyz1.oracleemaildelivery.com (aib29gb127.yyz1.oracleemaildelivery.com [192.29.72.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC8865957F
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Jan 2023 10:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-2023;
 d=n8pjl.ca;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=HvmYGxZ3PCtj7Uea3ffl65o9PUU+NR2IdupH9AUgaLw=;
 b=HnD0LBFzuF0g5tMpHTp7m65pC+nCi6ZrmGp6wW7WBmtdWSzJtTimD9Ft3PdzZJP43Ekl5f1VPW9o
   NPl3ZSITzBEBIMlXwZteq6hca35BO+XFiNRmqDOUQYKZlIrWUMQWO1BHIKjjGRRCXZ0bSPGEYjkB
   whPYLjaon4/ESrWsb78dAZjGDiVb1wgCbr4jNQsitbF0ICGgVV0HwpvjQ4uAuvYz1WlT6QWBCtV6
   dAHqIvUmeM3SsS8GihuKLtPkxvRd39XHXVKafJh3mwIlxmERN8BLRATfzW9NlUQ85q8916Pr5DRQ
   kFd0O27SIFUvrGm63xCLHeKASSoMKYtp07VIGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-yyz-20200204;
 d=yyz1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=HvmYGxZ3PCtj7Uea3ffl65o9PUU+NR2IdupH9AUgaLw=;
 b=Ui3hFNx5yCNYXo2fgYbHjMyELT6IqsUMqCim7X8O3Pq0KNoDecpFEgJ2vejin2j5uVP8zDqH6odS
   37zwrWGwJKe/SSWQ5ghzTspIWDi1qyriZH3ydllJ+3f/MnvJfjMbb5aNnwrKTQaXnpAk2JhgCOAo
   IzBsLd0ISUM3O13UsmoZoxUPaTsAaEjuhjL12akxrqV/LHZfzu5oo/5ImzuUe4oIN/JAGynFcwxq
   GtfbxdgX4gE4mENKd60oBzHRoFp1ceWrJMPQswSY4cxeUekU1FEFCAqQnv8vdPnPh2EwmYkEDxD8
   08tqAOL7vnTOZEB4ByN8rNxP6Gj8lojtWS56mQ==
Received: by omta-ad1-fd3-102-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20221212 64bit (built Dec 12
 2022))
 with ESMTPS id <0ROP00AS935W6600@omta-ad1-fd3-102-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com> for
 kernel-janitors@vger.kernel.org; Wed, 18 Jan 2023 18:53:56 +0000 (GMT)
From:   Peter Lafreniere <peter@n8pjl.ca>
To:     linux-wireless@vger.kernel.org
Cc:     Peter Lafreniere <peter@n8pjl.ca>, kernel-janitors@vger.kernel.org,
        kvalo@kernel.org
Subject: [PATCH v2] wifi: rsi: Avoid defines prefixed with CONFIG
Date:   Wed, 18 Jan 2023 13:53:53 -0500
Message-id: <20230118185353.2422-1-peter@n8pjl.ca>
X-Mailer: git-send-email 2.39.0
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAHTI2vs1IyzD/vgTOy84Ji/NKLmHFHPaVHR0ZxgJPPMpuFfMChswkLkl3fhBTBo
 PiFREIAkb8Ia75rXvcZw19oB6BQ/n9ntMqXTnLKHkseNDZi9+8kZBSHRUoWG3nUG
 ex2ZHYDOxwgNJqQT9XsGd0UJIFonLiYdcIjidIbrtGj9bUisW6HFMop6RNM+vD/f
 W/Zw5b1eCN+vn4PdOEeqv4R97SXzCqsR0ocKVlzu3dbQkEzkLGtdl0niUMKGHzro
 qF4uttOkHsevQq4iAHffr00xgP7ITAcCtzG+DtM+WsFMJ/Y62RTNgjtErh7BI0IC
 ft5vCFkT1jiTgPRQH23IfDsSP1bkKGSXFAScDmGIpF3fEpUZMmGT4AW39oh+WCu2
 fVtw+VxcHXGCSYURjMIv7KLz8KSU74QpcjIoUTNtextFFYH3MFK+WBE1CA7bl+2W
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Macros prefixed with CONFIG_ are intended to be defined only by
Kconfig scripts. Here we remove the prefix from the
CONFIG_AUTO_READ_MODE define to avoid confusion when reading the code.

This causes no change to functionality.

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
v1 -> v2:
 - Use AUTO_READ_MODE instead of CONFIGURE_AUTO_READ_MODE
 - Remove netdev from cc list

 drivers/net/wireless/rsi/rsi_91x_hal.c | 4 ++--
 drivers/net/wireless/rsi/rsi_hal.h     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_hal.c b/drivers/net/wireless/rsi/rsi_91x_hal.c
index c7460fbba014..d4489b943873 100644
--- a/drivers/net/wireless/rsi/rsi_91x_hal.c
+++ b/drivers/net/wireless/rsi/rsi_91x_hal.c
@@ -894,7 +894,7 @@ static int rsi_load_9113_firmware(struct rsi_hw *adapter)
 	struct ta_metadata *metadata_p;
 	int status;
 
-	status = bl_cmd(adapter, CONFIG_AUTO_READ_MODE, CMD_PASS,
+	status = bl_cmd(adapter, AUTO_READ_MODE, CMD_PASS,
 			"AUTO_READ_CMD");
 	if (status < 0)
 		return status;
@@ -984,7 +984,7 @@ static int rsi_load_9113_firmware(struct rsi_hw *adapter)
 	}
 	rsi_dbg(ERR_ZONE, "Firmware upgrade failed\n");
 
-	status = bl_cmd(adapter, CONFIG_AUTO_READ_MODE, CMD_PASS,
+	status = bl_cmd(adapter, AUTO_READ_MODE, CMD_PASS,
 			"AUTO_READ_MODE");
 	if (status)
 		goto fail;
diff --git a/drivers/net/wireless/rsi/rsi_hal.h b/drivers/net/wireless/rsi/rsi_hal.h
index 5b07262a9740..479b1b0b57a6 100644
--- a/drivers/net/wireless/rsi/rsi_hal.h
+++ b/drivers/net/wireless/rsi/rsi_hal.h
@@ -69,7 +69,7 @@
 #define EOF_REACHED			'E'
 #define CHECK_CRC			'K'
 #define POLLING_MODE			'P'
-#define CONFIG_AUTO_READ_MODE		'R'
+#define AUTO_READ_MODE			'R'
 #define JUMP_TO_ZERO_PC			'J'
 #define FW_LOADING_SUCCESSFUL		'S'
 #define LOADING_INITIATED		'1'
-- 
2.39.0

