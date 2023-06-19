Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0713DEB64D9
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 09:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbjFSJqa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 05:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjFSJq3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 05:46:29 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D6583
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 02:46:28 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f904dcc1e2so21076805e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 02:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687167986; x=1689759986;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6M9Rv0KlgnxeJQrvA7IK6DuAaqKWzv6g00dkXzmNXDc=;
        b=fcSQc1deD1URFXbdWlSSIfn7u8lDlCzInRP/xq+zdBDEC1M3eHxfZ0OBAYT8Jw9R6P
         0uLNQyifA7TLRfdUWgSVKQPi/QoX8aL2FOrhrua5lgdeIxL8iEHI17Ymw7+JGMd8nFss
         xkuswJfc4FC//LUVQ0zNelxKy9Otqb0pDcELj5kiMXzQXteACI5CXzLg9L55VeHZgBP0
         P6vhI75TAYS2d/lysUMP9eMaSZTny2lHju6axCMdjBtq9ZkObyKB2LEW259Nj7aSvz+g
         gJ574nJMEEDUeoKXo/jXNVxgZuUTDWIFDP8lkFkoZ6FcEZaAu4LB1RrAJ9n/RQYa6UVD
         qj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687167986; x=1689759986;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6M9Rv0KlgnxeJQrvA7IK6DuAaqKWzv6g00dkXzmNXDc=;
        b=IWJ+58CUzNjKoiX63JfJYJHGJ0p889QnKEceKTBujm4qtBR1bmpiFL01NAfvYuL3Ct
         HvFReGOoWVtOSNbiSUcJwJ/j840dLkLAjRjPmlryoxnUuTETd+VBYrzdebWviH9VPWO5
         y3BD266jh8441P2nJUVZHuaUYY4xqtsnQ7+kK7Pjip8uK8WJPsTaP5+9qAnbfQk6f4R3
         6yT0IqFMB8BhIkTElAijhwWMpgBGOBwOaRdLW/6Vy1fuIMhqyVn+tDuU/GSOa7M2GYZ1
         14GvSv/7bx5S1qRjqDkxAqpYIxg6yVakTEf0cE9s6+kFEdCtLcIH8wlrD88nIW5ZXbGT
         2hpQ==
X-Gm-Message-State: AC+VfDw/au/dgzHoQUDqBKNLw7rXbDMNX3txqxqnq3/5w7l1yyiGr6tT
        fVRFCojhrHaNgQw0mESvyvXgbQ==
X-Google-Smtp-Source: ACHHUZ5NQJ8ggkO7cpuJuj6BsZIKvkW1PIxL0Dka2zvsKVvBrN+Is6Kmtk9wWAGEt+IbtA9DktOfFw==
X-Received: by 2002:a1c:7211:0:b0:3f9:206:c3a6 with SMTP id n17-20020a1c7211000000b003f90206c3a6mr5152307wmc.20.1687167986646;
        Mon, 19 Jun 2023 02:46:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w19-20020a1cf613000000b003f8c5ceeb77sm10125244wmc.21.2023.06.19.02.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:46:25 -0700 (PDT)
Date:   Mon, 19 Jun 2023 12:46:21 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Yingkun Meng <mengyingkun@loongson.cn>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: loongson: fix error codes in loongson_card_parse_acpi()
Message-ID: <fb14815d-2f9a-4b42-b193-cec61e7417ca@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The acpi_node_get_property_reference() function returns kernel error
codes and not ACPI error codes.  So, although it does not affect the
compiled code, using the ACPI_FAILURE() macro is wrong.  Secondly,
if the is_acpi_device_node() function returns false, then we should
return -ENOENT instead of returning success.

Fixes: d24028606e76 ("ASoC: loongson: Add Loongson ASoC Sound Card Support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/loongson/loongson_card.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 965eaf4e9109..08df05cb4328 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -81,9 +81,9 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
 	/* fixup platform name based on reference node */
 	memset(&args, 0, sizeof(args));
 	ret = acpi_node_get_property_reference(fwnode, "cpu", 0, &args);
-	if (ACPI_FAILURE(ret) || !is_acpi_device_node(args.fwnode)) {
+	if (ret || !is_acpi_device_node(args.fwnode)) {
 		dev_err(card->dev, "No matching phy in ACPI table\n");
-		return ret;
+		return ret ?: -ENOENT;
 	}
 	adev = to_acpi_device_node(args.fwnode);
 	phy_dev = acpi_get_first_physical_node(adev);
@@ -95,9 +95,9 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
 	/* fixup codec name based on reference node */
 	memset(&args, 0, sizeof(args));
 	ret = acpi_node_get_property_reference(fwnode, "codec", 0, &args);
-	if (ACPI_FAILURE(ret) || !is_acpi_device_node(args.fwnode)) {
+	if (ret || !is_acpi_device_node(args.fwnode)) {
 		dev_err(card->dev, "No matching phy in ACPI table\n");
-		return ret;
+		return ret ?: -ENOENT;
 	}
 	adev = to_acpi_device_node(args.fwnode);
 	snprintf(codec_name, sizeof(codec_name), "i2c-%s", acpi_dev_name(adev));
-- 
2.39.2

