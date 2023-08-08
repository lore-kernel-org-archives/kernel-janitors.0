Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E73C001DB
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Aug 2023 18:08:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235279AbjHHSIj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235277AbjHHSIQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Aug 2023 14:08:16 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B0AA604
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Aug 2023 10:09:44 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99c136ee106so861268566b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Aug 2023 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691514582; x=1692119382;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aY6ou3nWSYAFAbpL5fcsmF7g+TKRxVKltr2+VptchpE=;
        b=Q4WTtsiJJC7q+yG8kkXEcExLwziJtIJ9JoiUu0eB5O1cp8woR+DFT2QyDYHgxxHXY+
         6LpBuS7L4ATeSLOpGk5cauPlMhGnO+EIu+6r4yMZPMl39XCN4wns5XCoI/shl9Q01Dgw
         gLsnvomgn1W19dLUbeeOpVRcGkC1ql1827HtPbOtwwkPDnXWpIk/PaS3/AYxZ5CwS3yh
         ZVVDF1YB76Aipcf23MVHMd/7A9/u5+N//ZyByt/bQWvis7qzYsZJDkz+jzheUSnSf18b
         +As289mmYU9v82zwCilJ7BnTPp+ytfj6nDwu1n/Mb/rYZUaNbKYRQEKnK4em++Tv7XwA
         FS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691514582; x=1692119382;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aY6ou3nWSYAFAbpL5fcsmF7g+TKRxVKltr2+VptchpE=;
        b=GCZNlsJQcXYmR84uQynNWz0qSAxHYV4lSrIghNogImUFG7WJHmwIulqeoUDaB/1flv
         qovZOp4WnuM4bFSNs1Lm09OvSysQQ4FCh9xMD8LCNGd2O0iFOC6aleHfr101bJVPrGEs
         fAKY/EGLY24R3p6G19Ku4l/28kuAuhF9bZ6iDVEqOkR50ZM8nRa6k3r65D4gLfeCJfyn
         WSoZyvZYiQAiHsMaeMePXn9bUZe/c8rL82I5FEB5Op/UQ/fyGqeHMct95Lx3R5LG370Y
         vUgqH0Ysk0rtDVUJbrS/WT+++jMVK9p9rzkSXcMSEfbIyIJpEhXOoKh3D5iNEoeTr/07
         hfuQ==
X-Gm-Message-State: AOJu0YyZQx4CLxMkOssFuCqoucRky96h1Ibx5dM0stb+SExjKU8cUJ74
        uJ+9JiBU4xoJQSk58UpnR/R2rMGUWJSmPlPs/Us=
X-Google-Smtp-Source: AGHT+IE4GCEBg8RVyD837dgKBOWFoI5qD31p1ESEay2d0rA46DdwzPmszKIjNeRfJy90BuMZJvtjPA==
X-Received: by 2002:a17:907:78cf:b0:997:e79c:99dc with SMTP id kv15-20020a17090778cf00b00997e79c99dcmr10365115ejc.74.1691472974377;
        Mon, 07 Aug 2023 22:36:14 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id j11-20020a1709062a0b00b0099bd5d28dc4sm6056478eje.195.2023.08.07.22.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 22:36:14 -0700 (PDT)
Date:   Tue, 8 Aug 2023 08:36:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Chin-Yen Lee <timlee@realtek.com>
Cc:     Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>,
        linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: rtw89: fix a width vs precision bug
Message-ID: <0700c7b9-bfd3-4aa6-82bf-5bf3c74644e1@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "buf" is skb->data that comes from the firmware.  We want to print
"len" number of bytes.  But there is a missing period so the "len"
variable is used for formatting (width) instead of limiting the output
(precision).

Fixes: cad2bd8a136c ("wifi: rtw89: support firmware log with formatted text")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/realtek/rtw89/fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/fw.c b/drivers/net/wireless/realtek/rtw89/fw.c
index 2811a94b5f69..bcd9050f989f 100644
--- a/drivers/net/wireless/realtek/rtw89/fw.c
+++ b/drivers/net/wireless/realtek/rtw89/fw.c
@@ -1165,7 +1165,7 @@ void rtw89_fw_log_dump(struct rtw89_dev *rtwdev, u8 *buf, u32 len)
 	return;
 
 plain_log:
-	rtw89_info(rtwdev, "C2H log: %*s", len, buf);
+	rtw89_info(rtwdev, "C2H log: %.*s", len, buf);
 
 }
 
-- 
2.39.2

