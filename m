Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C07C77B73
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 11:46:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237263AbjEZLqG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 07:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236478AbjEZLqF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 07:46:05 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0EF116
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 04:46:02 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-96fb45a5258so111226666b.2
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 04:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685101561; x=1687693561;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vlt+5VLC7KI/CuMwSmVCoc1T0RjObSqqBqBI2FUoWI=;
        b=abDSY2fbWfc/NpEno6lPCk1ECWzGdg/c0ZJO1PungQgyLhJWQl76dcMVxO/+NkvkJ7
         ZTKZo5jTqwHAtIdUBhtv500uC6LwwqfGjYiV4Ry6kQ0Is86AoPfmVdbb9h/eIgxfTg1G
         oIAQlFz+0mGelva57WyQqGHh/KnU31DZfuHcoZYZ2IlK4VsjOBqZe2Y2gvYnbseYN6fW
         +pGTpXqPckNIAIZ54bUgFRmD+KnJMzxN3QL4ZH8yvSGe3cM4sTudhN2WbKPDDU8gSgU0
         BG/GtnHtMVHl7nu2rnG6WtFou89Qovc8MDTLSJ3MmzQxUUZe7XXOmgKLILHD5l5C4DSs
         3+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685101561; x=1687693561;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vlt+5VLC7KI/CuMwSmVCoc1T0RjObSqqBqBI2FUoWI=;
        b=NamsIgVQemitBAcEyKNRwZfOZmvVlxSxon1eGpHYc34KOEpdrrai3oj5vjIl4Jdv62
         NJDKAnx2MAUFCeHw0XqjPK7RPVgVqcGm5p82i3FJ70MOq3itM3nngmX2DypkotslaW+x
         WES3VL9an46zFrtRS1aus+woofnH+vD6EZlYS+olxGK5/nzHw7oJw3iJrnOjRYYOQQ3C
         tGPhW7RFO8kEEkfNb9SfFogK9STBAfKC4W9lKu5y3f3C+hcs7Ya3O6euvLN6l2Zwfyru
         CfmbNLPEZe5A2IMwMyFsgCl915AJooEHLX0BtjD09YaaL1hCJ2/l31JWFjQ66VEEea4j
         uq0w==
X-Gm-Message-State: AC+VfDxtJQvQ9DxnsUGnLayA7mOwqi0Nh6/5sUahomGnEm3GrlwWYr0A
        68aQvy0e6NBxYsvlFWj5TR8N3w==
X-Google-Smtp-Source: ACHHUZ582mOEkzgQjppredkDpk8pe+heNFACxpfj1l33/h7T9wXg7DUZDmFAfhnCrlTTCh4EwAFbMw==
X-Received: by 2002:a17:907:9708:b0:970:925:6563 with SMTP id jg8-20020a170907970800b0097009256563mr1837879ejc.8.1685101560854;
        Fri, 26 May 2023 04:46:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w24-20020a17090649d800b009666523d52dsm2043491ejv.156.2023.05.26.04.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 04:45:59 -0700 (PDT)
Date:   Fri, 26 May 2023 14:45:54 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Oleksij Rempel <linux@rempel-privat.de>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: phy: fix a signedness bug in genphy_loopback()
Message-ID: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "val" variable is used to store error codes from phy_read() so
it needs to be signed for the error handling to work as expected.

Fixes: 014068dcb5b1 ("net: phy: genphy_loopback: add link speed configuration")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/phy/phy_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 2cad9cc3f6b8..d52dd699ae0b 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -2700,8 +2700,8 @@ EXPORT_SYMBOL(genphy_resume);
 int genphy_loopback(struct phy_device *phydev, bool enable)
 {
 	if (enable) {
-		u16 val, ctl = BMCR_LOOPBACK;
-		int ret;
+		u16 ctl = BMCR_LOOPBACK;
+		int val, ret;
 
 		ctl |= mii_bmcr_encode_fixed(phydev->speed, phydev->duplex);
 
-- 
2.39.2

