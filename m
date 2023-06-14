Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE99CEB64DC
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Jun 2023 07:05:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbjFNHFK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 14 Jun 2023 03:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232697AbjFNHEP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 14 Jun 2023 03:04:15 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA51B19A7
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 00:04:05 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f78a32266bso4050755e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686726244; x=1689318244;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dqIK+JrRD/w1Gt88Di+paTgCGEYvpSh0GC+h6+bW3yw=;
        b=iCwy9RDb84tB4kdaKWth75H7OmawV3HZ4X8FhNc+nYNfBbl/NigevNY/cmxfdscO0/
         fWJemgiaosp8IDhkT1QFQ3X3IYVZX0YwkqV3NwXl37UlyxA0FuiADy8+ecyuDFgFz6nk
         16CcxdUdY4+zxFszfXkIcovxD6xSspKN5w69rcVQTmVkYIyynXMLSoUm0oPr7NxSDt/C
         wh7UwBq7F78RofgfuiAP19lEm2Qgk6mbTIKf74/M23O1W+cvGc5Vo3PIYrxH5FwLhuH+
         TFOLfgS2mE4VbygkDAhE4HEeuKDRZYQUekm4flyfOoA+KxExoXZO8V7Uy58Z3wyapbVK
         Ay8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686726244; x=1689318244;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqIK+JrRD/w1Gt88Di+paTgCGEYvpSh0GC+h6+bW3yw=;
        b=BLvjQkDzCRuZcfh1GiEozf7FI16RFo0yyN57sl6//u9aTC/odmmJ1H6DU9qPZ9V3K2
         xUqPYo1mByD7eABfrj3vS+joKwudvt36dNwytP/6vqNTzzMZM5BNpoqaHwvijqoYaypc
         YzwM+WM1/CKdvHjU8cGt3a87RxADHyy6s1rJqM8wKMMN6w8C0HtP0YjCXiTq3oXmItih
         ZAar5MsssE3hNO1bteqYP899pf4ABAmrUHtCvO+LQMdOrW3BjNiPZMA3To9t5hzZwn5b
         r8D+SmMLmSB7PtgZjynv6EJYpTGl7DfrL7fs/00LemkbCdKOMTgKIxxVt6OokQ7If+ui
         acVg==
X-Gm-Message-State: AC+VfDwHJ4llBtJvu6rO8dvQnyzfTskvPmKPorEMmdB2EuXw/3n9RzlB
        eNOoSdThK3Fwz551dnyw98jHfA==
X-Google-Smtp-Source: ACHHUZ6oGuWWPlZXUkigPMZkc4obcChtgd4nGGd8losWL+Kf8Mic51FCYSQDA7U2hPFcoyYH0McUmg==
X-Received: by 2002:a1c:ed06:0:b0:3f7:f584:5796 with SMTP id l6-20020a1ced06000000b003f7f5845796mr11528366wmh.2.1686726244098;
        Wed, 14 Jun 2023 00:04:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k15-20020a7bc40f000000b003f7f1b3aff1sm16475105wmi.26.2023.06.14.00.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 00:04:02 -0700 (PDT)
Date:   Wed, 14 Jun 2023 10:03:59 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        netdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 net-next resend] leds: trigger: netdev: uninitialized
 variable in netdev_trig_activate()
Message-ID: <ZIlmX/ClDXwxQncL@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The qca8k_cled_hw_control_get() function which implements ->hw_control_get
sets the appropriate bits but does not clear them.  This leads to an
uninitialized variable bug.  Fix this by setting mode to zero at the
start.

Fixes: e0256648c831 ("net: dsa: qca8k: implement hw_control ops")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Resending because this actually goes through net-next and not the led
subsystem.

v2: In the original patch I fixed qca8k_cled_hw_control_get() instead
so that patch went to netdev instead of to the led subsystem.
https://lore.kernel.org/all/5dff3719-f827-45b6-a0d3-a00efed1099b@moroto.mountain/
Fixing it here is a more reliable way to do it.

 drivers/leds/trigger/ledtrig-netdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index b0a6f2749552..2311dae7f070 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -445,7 +445,7 @@ static void netdev_trig_work(struct work_struct *work)
 static int netdev_trig_activate(struct led_classdev *led_cdev)
 {
 	struct led_netdev_data *trigger_data;
-	unsigned long mode;
+	unsigned long mode = 0;
 	struct device *dev;
 	int rc;
 
-- 
2.39.2
