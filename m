Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4093DC3A5A7
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Dec 2022 15:59:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiLHP7x (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Dec 2022 10:59:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiLHP7v (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Dec 2022 10:59:51 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C84D489AEA
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Dec 2022 07:59:49 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id o5so2154421wrm.1
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Dec 2022 07:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ysNU0WciW05GAPzeGrFUdoMgUySDIhh5CqZw5I3Xxs=;
        b=hls+w8uFaBUT1FFNYEoBoDlOaxPpAc6u1V5JutEGuSdt+odnaBD0dVmflsNrsyobeB
         Xc8dO0qtf2JbPjSfhUnst9yER284k5yyOg/kBxCFOJXFDcV2fHfEjEe6GBRqlDOPzVIA
         jTJB4HpFtyEfUi+Y3JQ9f5JqGTYD6XgJTvbSBXNj5FkZNz2OayzPUrbuNm0iyqA9I/3y
         GFfoJs9UpPcMzEef1pOc0eidBRGR1ceb1mhBL0nFxbqd1jkyWlU0UwLnrgn8kGyI1Bae
         zJhSnj0NVaqlvjWaQPXAwZPzruN85IPkD6o54cykhl2nZB5wrq/n9ye7BUwevfBX8KWA
         D8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ysNU0WciW05GAPzeGrFUdoMgUySDIhh5CqZw5I3Xxs=;
        b=I74UoEZ/+SCibnN4rcI/3VDppNNnbRBAED64a2V3IVEesRTYywGsg2ajEIB5wbEyA1
         XNY6ZPm36FROx7X48ujr2O7+K9mSeN+2rU13AvFfEWPRaVLRzv8/RY0IeNOX682dHfdQ
         8lB1qifdsMT40U4GM7pEcjmPZQhKDfMfaaeVm5MOqhT2tZWEsspoR1HV4/lERntU/iVb
         Cxy/KezWyFQDkK2Agl3HRirA4HZL/KIA4B2BecKgkMnr6I8U8wjkjVI1LqAEZCrKpgI5
         JfCFbSniOVyDh7fJE1GgmaYYqo/q1ooyWzrFLee+G1NzU4TNMScojZQOg7yyN9/L4Xmo
         rDlw==
X-Gm-Message-State: ANoB5plSLpJNeMLgOZbbUofyU3tBqPTPCYAfUlo1U9wzdXrdjv6tIN52
        HHFuauPSTyIBriZ8iiS/nZ20OI6pOcOtDA==
X-Google-Smtp-Source: AA0mqf4LEGwkmc1CyKtTbSf+9IYROtnRpBqGOxyLhLP9pE2zDQs9LozmmQxWkOiVnwtG2MOnlCYvoA==
X-Received: by 2002:a5d:488f:0:b0:236:74c5:7ec with SMTP id g15-20020a5d488f000000b0023674c507ecmr1543822wrq.13.1670515188221;
        Thu, 08 Dec 2022 07:59:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f7-20020adffcc7000000b00236883f2f5csm22407426wrs.94.2022.12.08.07.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 07:59:47 -0800 (PST)
Date:   Thu, 8 Dec 2022 18:59:38 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     horatiu.vultur@microchip.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: microchip: vcap: Add vcap_get_rule
Message-ID: <Y5IJ6huWhdBN8afS@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Horatiu Vultur,

The patch 610c32b2ce66: "net: microchip: vcap: Add vcap_get_rule"
from Dec 3, 2022, leads to the following Smatch static checker
warning:

	drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c:275 vcap_show_admin()
	warn: passing zero to 'PTR_ERR'

drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
    263 static int vcap_show_admin(struct vcap_control *vctrl,
    264                            struct vcap_admin *admin,
    265                            struct vcap_output_print *out)
    266 {
    267         struct vcap_rule_internal *elem;
    268         struct vcap_rule *vrule;
    269         int ret = 0;
    270 
    271         vcap_show_admin_info(vctrl, admin, out);
    272         list_for_each_entry(elem, &admin->rules, list) {
    273                 vrule = vcap_get_rule(vctrl, elem->data.id);
    274                 if (IS_ERR_OR_NULL(vrule)) {
--> 275                         ret = PTR_ERR(vrule);
    276                         break;
    277                 }

There aren't any comments explaing what a NULL means...

Intuitively this doesn't feel like the correct way to handle NULL
returns.  It feels like it should be:

		vrule = vcap_get_rule(vctrl, elem->data.id);
		if (!vrule)
			continue;
		if (IS_ERR(vrule)) {
			ret = PTR_ERR(vrule);
			break;
		}

    278 
    279                 out->prf(out->dst, "\n");
    280                 vcap_show_admin_rule(vctrl, admin, out, to_intrule(vrule));
    281                 vcap_free_rule(vrule);
    282         }
    283         return ret;
    284 }

regards,
dan carpenter
