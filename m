Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB06C7EE2E
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jun 2023 07:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbjFLHiI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jun 2023 03:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234633AbjFLHiF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 03:38:05 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A9210DA
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 00:37:13 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-516a008e495so8250496a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 00:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686555184; x=1689147184;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+Qi8JTAYiLDVqnRPgJbhci7OK6Vh1X6mg5NofF+Ffg=;
        b=L9LxJvau9qqhOhKJ33jBC02yPir5iwYed2GcsUzMyGom6mcY9FjocehHg58cd09At4
         ek6CraCqu7JIfsMOFczJujQ0gWdrchs7lr/gVustwCLT6lMCUxhG44EwdLNOHplDPqVq
         1qVHfJfCW3Mv0YqJkoQS7taD7MKqlZ2NRdf5nO6xJf0JK4k9o/F+S8+WkJR3pNuhomuP
         RvwOUDtHyr3sOlWAAA3sXMtOFXayO2/oktwjWUJiJOuhL0N9XOF1czVw4kPEV1+SPCev
         dLDeeWAmX0NSqiCnO0sUFlMpwuheXsdtztYHCTal/7VcBS5lieldk06jqoazQQiT65Uj
         lNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686555184; x=1689147184;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w+Qi8JTAYiLDVqnRPgJbhci7OK6Vh1X6mg5NofF+Ffg=;
        b=RJYSGlBYW8iojR3ZWlQoksh2Fd83ENL8IglAODD2EVLrXEM6Nh/tt1p4lr4rdH+Zaq
         kXIUu15H+aBvoGgnyGOv1OKHmyZTRvIY23PFghw3ND0+n37ycAy34cVf0lMx+NftDo3I
         iyfm7HmCzhFZD5bpobp8JMpkUCG1Td0rimkmE6OdkU8nl4nXF2T0jPBjJin13yH+3wBY
         4YuiQx4Oz6WR6VtakAX2Oud2/9D/htKE8Kt+gGDPPY1G/SaSTBYNZp6VDo4zmmXW/6Wr
         GBbeL3f+X0QI3/C+UpspfLG4tR+tjOSmsHmMNp+nLVVkgTR8/fQ0l+Rhq1gBDdHHq94Z
         LKtQ==
X-Gm-Message-State: AC+VfDx9wfPnNSvGuJRJRUCxGPaUEfJtsoDtiuKZlsJVqLhWHP/D7WRi
        AQvbDf3lYIm1WdCcumejL2zRPZP/v14FGxOj2YQ=
X-Google-Smtp-Source: ACHHUZ7o8sqiMBOcVwAWkcIW5b3yD5lxoIbzeQr0yV6BoqSehrk0Rwwz+R5qoAip8C55vGsL/exYZw==
X-Received: by 2002:a7b:c7da:0:b0:3f7:a20a:561d with SMTP id z26-20020a7bc7da000000b003f7a20a561dmr7027654wmk.8.1686554460503;
        Mon, 12 Jun 2023 00:21:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x19-20020a1c7c13000000b003f7aad8c160sm10401419wmc.11.2023.06.12.00.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 00:20:59 -0700 (PDT)
Date:   Mon, 12 Jun 2023 10:20:55 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-XXX] net: dsa: qca8k: uninitialized variable in
 hw_control_get()
Message-ID: <5dff3719-f827-45b6-a0d3-a00efed1099b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The caller, netdev_trig_activate(), passes an uninitialized value for
*rules.  This function sets bits to one but it doesn't zero out any
bits so there is a potential for uninitialized data to be used.
Zero out the *rules at the start of the function.

Fixes: e0256648c831 ("net: dsa: qca8k: implement hw_control ops")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/dsa/qca/qca8k-leds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/dsa/qca/qca8k-leds.c b/drivers/net/dsa/qca/qca8k-leds.c
index 6f02029b454b..772478156e4e 100644
--- a/drivers/net/dsa/qca/qca8k-leds.c
+++ b/drivers/net/dsa/qca/qca8k-leds.c
@@ -304,6 +304,8 @@ qca8k_cled_hw_control_get(struct led_classdev *ldev, unsigned long *rules)
 	u32 val;
 	int ret;
 
+	*rules = 0;
+
 	/* With hw control not active return err */
 	if (!qca8k_cled_hw_control_status(ldev))
 		return -EINVAL;
-- 
2.39.2

