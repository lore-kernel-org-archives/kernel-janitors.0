Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AD7C7EE39
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 08:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236627AbjFFIZP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236540AbjFFIYx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 04:24:53 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B470E77
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 01:24:43 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f739ec88b2so19404085e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 01:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686039882; x=1688631882;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulda920MoEBfiQNDSTKpW6DY53+RA5BrFUBbmLU+FA0=;
        b=AxDLlKVDNuDGgr1PV6+6IhHrLPrS7727qHradhZ7q9MeKsG8e14HO89q3SbyJGNURh
         h5lnGX1gjGI6TTTe/TPxF4pQTnlYctWL9e1b/6VNFC7TuOu45bOjoF7tl9rDl33R/iDz
         xTonI0+0FMh23vX25QQ7ePcHyTUPsD3q5/e3zi0jcgMC7S9XvL+jHxzZnpj7ldCQHv0Z
         xP4W6f8recthfKJwVvQRjiStaG+OuCO9xg8SEd/sIE6GUL5sT0wvzaXzl7U/Jtrc8HmF
         S5g6jsn9aAWeVwOf4z3vRYowICUzqtwFD7UgDtOM3bZoBgoBrpDWOP/nJkmYS+i+nKbV
         56kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686039882; x=1688631882;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulda920MoEBfiQNDSTKpW6DY53+RA5BrFUBbmLU+FA0=;
        b=HLhtbAr8THxDf0qoeff3ng6pMlrYKcrX0arABZwmdOolT7IvzTYivmfR5Y9xFkQdC2
         26nH6hY4s5im4j5SJ7i+xMPhqNKEMYsrvr9YcSobcFDIjY5IvOL19wAAwNYN7Zi8WoaW
         yEnNrTzUHJcc9SpwDpbDyZLPAqxTrbub6wiwkRXdlBIptYQrSasLecfsXXfZu6hOqgNW
         0lCNEXmqgzLgVUUO6tcs5tyG7qTYRUreHCnXFN4YT4YUiYAomjVrN+1CehpYMpfxbhvG
         0mqdq4MjWg7McISkr79o2WDg8JhuFSrKHOSoYl/EmRGJ39zlr+Srx5JGxbRwPjh579gJ
         AO8w==
X-Gm-Message-State: AC+VfDy+Df+Zuxekfnan2FmCCf962QNvUagRulbGfP9HWaipm10UzkQ0
        2gcjPBUIZgqBS8oxswSUkXdxSQ==
X-Google-Smtp-Source: ACHHUZ52toXt1UWuUbI3LD+6T1MtXylmTGTlpvsFH4LmxGIWTLg1+uJ+sOsiCv1/osqHD0mDTgxh7Q==
X-Received: by 2002:a7b:c7d4:0:b0:3f6:3497:aaaf with SMTP id z20-20020a7bc7d4000000b003f63497aaafmr1315611wmk.9.1686039882546;
        Tue, 06 Jun 2023 01:24:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b11-20020a05600010cb00b0030ae973c2e7sm11962020wrx.83.2023.06.06.01.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:24:41 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:24:37 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Vladimir Oltean <vladimir.oltean@nxp.com>
Cc:     Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Gerhard Engleder <gerhard@engleder-embedded.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: dsa: ocelot: unlock on error in
 vsc9959_qos_port_tas_set()
Message-ID: <ZH7tRX2weHlhV4hm@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This error path needs call mutex_unlock(&ocelot->tas_lock) before
returning.

Fixes: 2d800bc500fb ("net/sched: taprio: replace tc_taprio_qopt_offload :: enable with a "cmd" enum")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/dsa/ocelot/felix_vsc9959.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/ocelot/felix_vsc9959.c b/drivers/net/dsa/ocelot/felix_vsc9959.c
index 5de6a27052fc..903532ea9fa4 100644
--- a/drivers/net/dsa/ocelot/felix_vsc9959.c
+++ b/drivers/net/dsa/ocelot/felix_vsc9959.c
@@ -1424,7 +1424,8 @@ static int vsc9959_qos_port_tas_set(struct ocelot *ocelot, int port,
 		mutex_unlock(&ocelot->tas_lock);
 		return 0;
 	} else if (taprio->cmd != TAPRIO_CMD_REPLACE) {
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		goto err_unlock;
 	}
 
 	ret = ocelot_port_mqprio(ocelot, port, &taprio->mqprio);
-- 
2.39.2

