Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3696DEB64DA
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 07:05:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbjGRHFO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 03:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjGRHFN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 03:05:13 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7481A8
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:05:11 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fb77f21c63so8687252e87.2
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689663910; x=1692255910;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNTNkZfchafTwTJREj+ToAD7R4WLXmRRjUKgrluLXZo=;
        b=cpTB1lAZI8/axJ8BZni7/dKxtSt9wMxy6x0x4TdEY284Ks51Bb2pefnzO6aaOcHIEW
         4/+zcI0SGSMssDri73Co5/kkN/owyZGz2aT43iJUW/gCwkIfocR3oEvIfSola23Kox/d
         Ws+/4MUh7r75DXcPMLFNaQW3gdtYBa1U9FowPwtmKpEVJ+FsAYSMhT9mwJp1ySJcxb3h
         bCnp6+R6E12ofFI1ZpQYKQk3qiJ4TI1/Uri0Km0lx+0nTkvj/XgBZ4AtgjpXnU74SEEp
         hB+VBJL2dBQMSOqv7eXNSS3udQoX+nMOpB4M4p8qLbyY7IN69STVqwuvZQ45gbSC/xkJ
         cUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663910; x=1692255910;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNTNkZfchafTwTJREj+ToAD7R4WLXmRRjUKgrluLXZo=;
        b=O9bnLSB8IDpUFFL9TwEqzg8P2esow96IYypHcGzb9hZATiL5QBfqUx3ZmhRHQmrh1c
         C0RuAJ4SROz5lA73WqJ8pdrEcheBfoluiBOQb6r+BiHeRdi2ZQ3+izRmQ+m4gGBG50rA
         EFDL/DlIMaXg1qLMWtdK4jYHLsmhpss+A0kHE3zJ3b9TiGibdQbWDA8E1J2DrqqIIuki
         Pt9beyeJ7orEIg7d5rYNx0Uy7G4x0oo/5ALjsBywvEkwiqdYn4FH0ZwlBNGBsIZkUAK1
         u18QwWNwt9plmKQJiONyAu02oZwPGcx2kADwFIOE0PYcSPEFgcNFHM0rYFhFkKu3BT0L
         GrFA==
X-Gm-Message-State: ABy/qLZWTAzOCOklbmlU4BIiK1479FaXQmf2bspUnTI8y6htx11QQp8z
        fA2mWcic1ZDydQwZTM/kLB/2Dw==
X-Google-Smtp-Source: APBJJlFprFEIw6wa/exoNAAwx1p9HSAarILIfqBRkoZ/2vt9oulGwK7u9GaAsLyl6Ba82+Fd96OAWg==
X-Received: by 2002:ac2:5973:0:b0:4f8:770f:1b0b with SMTP id h19-20020ac25973000000b004f8770f1b0bmr9175041lfp.33.1689663910159;
        Tue, 18 Jul 2023 00:05:10 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b11-20020a5d40cb000000b003142eb75724sm1466128wrq.24.2023.07.18.00.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:05:08 -0700 (PDT)
Date:   Tue, 18 Jul 2023 10:05:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jorge Lopez <jorge.lopez2@hp.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: hp-bioscfg: fix a signedness bug in
 hp_wmi_perform_query()
Message-ID: <ad0a6ad9-099b-40a4-ae91-b9dca622ff4e@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The error handling won't work if "mid" is unsigned.  "ret" is used to
store negative error codes and declaring it as a u32 won't cause a bug
but it's ugly.  The "actual_outsize" variable is a number between 0-4096
so it can be declared as int as well.

Fixes: 69ea03e38f24 ("platform/x86: hp-bioscfg: biosattr-interface")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
index 1d59ad600b84..dea54f35b8b5 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
@@ -123,7 +123,7 @@ int hp_wmi_perform_query(int query, enum hp_wmi_command command, void *buffer,
 	struct bios_return *bios_return;
 	union acpi_object *obj = NULL;
 	struct bios_args *args = NULL;
-	u32 mid, actual_outsize, ret;
+	int mid, actual_outsize, ret;
 	size_t bios_args_size;
 
 	mid = hp_encode_outsize_for_pvsz(outsize);
-- 
2.39.2

