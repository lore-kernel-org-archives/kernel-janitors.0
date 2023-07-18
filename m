Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D89DEB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 07:06:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbjGRHGe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 03:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjGRHGd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 03:06:33 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C2CD1B6
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:06:32 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbea147034so49593035e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689663990; x=1692255990;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3nYEWW1rnYJ4+p9oyWKImYPOQZG79ilAZkGR7JuMrcw=;
        b=pcgAsvi9wUNhcHiej3FU0UeGbe7JCQZCMbOxx5waqBCBWKJWyGxhvqsQYKcQpVCeDn
         NomZymyke1mB5EMucg8AC8LJ9/WFloNEVsYyHa1DKCwQd6VDNmzkhtsLn4RWKGu6spyM
         iPlAVlbUCuuHetVbNyxnclMedkJBUBwLZ3oyZesh4ZRWw4z1dnXE6ECDguQur0T2JAph
         GsOjyhqY7cjmx8txtkdE5cBRAic7yjXCliRBqc2APopBCrfJalPevJGH9oU9iXt3KX9d
         wLAe2t5tYSb+D0n7EYNv20xTfPz4g4R5W3okKftOYqyvJca69WfQPfTNb2HRg+Ct8Rgo
         r3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663990; x=1692255990;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nYEWW1rnYJ4+p9oyWKImYPOQZG79ilAZkGR7JuMrcw=;
        b=S+Gh/Kim8drxV5W6BLNvroFoPelLKrvQR0yE8KQlL1HbM15TaOJdYjHm405QeSImYH
         wZrLAhbcBb2dwznMAT1hpX/vi3UXwkTNHhaDx8FQFyZKCRkfjXUGMIADM/60zrb6MPo3
         iCVzrutKxSUenUpYRGZVpISnLfKlVuARWeiHmJiHO9nk/1XyFp26TSEVFVcEtFCmuZiq
         h1MHdCNV2VwgYSf91GdxI09TOpbfV1bQrwS6okVV3dGobhkypBBWOcGM5kBktoxiyVwg
         weD7yKCmOSguoDzqiUs0xp0BzHKDzo9gPgqlwu4a6eBHgEnb/GWoRKmUg+Ahxr/QS30L
         CYag==
X-Gm-Message-State: ABy/qLbgHCJPl0eS8AB4n/QTXfwh3/7ZvQh2pYzUEpNoC2Hv3Y+MM5qY
        +VYd1gl8rU8cZOT1adhCzlNgSHQjkdV9ofjSNY4=
X-Google-Smtp-Source: APBJJlGOZE6KupIQ7yqcRQlXMRNIAssWNmqpglYqqUPh0NEQbt4ta+EhUaW7tpuNYDOlzNVxkg6IIA==
X-Received: by 2002:a7b:ce98:0:b0:3fb:ffef:d058 with SMTP id q24-20020a7bce98000000b003fbffefd058mr1022654wmj.0.1689663990770;
        Tue, 18 Jul 2023 00:06:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y4-20020a1c4b04000000b003fbc0a49b57sm1394794wma.6.2023.07.18.00.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:06:29 -0700 (PDT)
Date:   Tue, 18 Jul 2023 10:06:26 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jorge Lopez <jorge.lopez2@hp.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: hp-bioscfg: fix error reporting in
 hp_add_other_attributes()
Message-ID: <138641cc-52c0-41a5-8176-ad01c7e28c67@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad0a6ad9-099b-40a4-ae91-b9dca622ff4e@moroto.mountain>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Return a negative error code instead of returning success.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 32d9c36ca553..8c4f9e12f018 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -630,13 +630,18 @@ static int hp_add_other_attributes(int attr_type)
 	switch (attr_type) {
 	case HPWMI_SECURE_PLATFORM_TYPE:
 		ret = hp_populate_secure_platform_data(attr_name_kobj);
+		if (ret)
+			goto err_other_attr_init;
 		break;
 
 	case HPWMI_SURE_START_TYPE:
 		ret = hp_populate_sure_start_data(attr_name_kobj);
+		if (ret)
+			goto err_other_attr_init;
 		break;
 
 	default:
+		ret = -EINVAL;
 		goto err_other_attr_init;
 	}
 
-- 
2.39.2

