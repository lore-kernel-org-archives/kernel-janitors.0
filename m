Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE45C6FD1D
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Mar 2023 06:39:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbjCUGjU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Mar 2023 02:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjCUGjS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Mar 2023 02:39:18 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11CE6DBC3
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Mar 2023 23:39:07 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id l15-20020a05600c4f0f00b003ed58a9a15eso8794439wmq.5
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Mar 2023 23:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679380746;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2x3KMifqt64fuH2SN7GNi8R/2HnyOseMgBW/UypRh0=;
        b=YtSrk0NxH6LgK0Du77Im5HweToS2JLVLz4zwNTxt0V2yfupJrGZ4jpHXSAKr4Md/jm
         4EGaFO6lHdHxqzCQZSypyyVKaR1kQUU4SUsQFmi6xQXGjAmrIqpG8eYKbWdh6WijQODn
         BFEzHwFdFeS4o62JXW4bFthcBLcJvzdJ7xXy8GQ/WpQcAfqjXxzuBgW7+a3k8vXuuocd
         S804IYebYIgOl8jjlgHXKPY0GTO+JSXmobPKhDuSjfR1v+OYyyZwpyFEpdvT8voMk9Xn
         KSFd7YkSlSVto2YHeANwdXIhcUXbXn3KSQWEwmzsKTBdFeuwV47j4HRTFMPURAw5la5W
         HLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380746;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2x3KMifqt64fuH2SN7GNi8R/2HnyOseMgBW/UypRh0=;
        b=F9w6SVmCSyVFsaVNEtQlstIQyb7sypOSbiQ+68lFSU4tJgzyQ2U7dbSyuxsRutXTh7
         mxv3gxxNNBjSqIOFvMuxEIHcwmGmO0sMrwIwLvjogNPy1ZBCfHWUi5uMW88RWGG4OYQq
         aX7BXFu1GYVzFGF7+cT916bWxTjF6xaqdUCKpu90Nc7N/Wif5y2huH85GhA1UUm2yf/R
         LOR6Qz1RSy8vx1TIWdZuNwhiedZF6qmAq0Ps+7c2hGay1rZHPuswRWzVlxdfFQcHdIpt
         O8rxUosZOc3A03lOdrb1J3cx6G1yYfV6ryVpmDcxYv4F9qUpAOwDIE9UajWViMrtpjht
         V15w==
X-Gm-Message-State: AO0yUKW3MFsF1qY2yXX1odHYrG1OHCMIhZY2t2yUaT7MGgTNZt9QOYsy
        vMYir1Jhzh/71fjv0ZsBHLEnje0l9tY=
X-Google-Smtp-Source: AK7set/KA+1XLFB6ccuNzuHD3DAW3WXj7868sB1iOXpHjxBUyAT3E+xm5XAAXqSGE76I3kfd6SK6cQ==
X-Received: by 2002:a7b:c383:0:b0:3dc:5b88:e6dd with SMTP id s3-20020a7bc383000000b003dc5b88e6ddmr1415492wmj.10.1679380746030;
        Mon, 20 Mar 2023 23:39:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v15-20020a05600c444f00b003edddce5b00sm6602940wmn.12.2023.03.20.23.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:39:05 -0700 (PDT)
Date:   Wed, 15 Mar 2023 16:55:06 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     quan@os.amperecomputing.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] misc: smpro-errmon: Add dimm training failure syndrome
Message-ID: <21218ec0-144e-419e-81e0-600ac28d951f@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Quan Nguyen,

The patch c2c99326cc01: "misc: smpro-errmon: Add dimm training
failure syndrome" from Mar 10, 2023, leads to the following Smatch
static checker warning:

	drivers/misc/smpro-errmon.c:491 smpro_dimm_syndrome_read()
	warn: missing error code? 'ret'

drivers/misc/smpro-errmon.c
    477 static ssize_t smpro_dimm_syndrome_read(struct device *dev, struct device_attribute *da,
    478                                         char *buf, unsigned int slot)
    479 {
    480         struct smpro_errmon *errmon = dev_get_drvdata(dev);
    481         unsigned int data;
    482         int ret;
    483 
    484         ret = regmap_read(errmon->regmap, BOOTSTAGE, &data);
    485         if (ret)
    486                 return ret;
    487 
    488         /* check for valid stage */
    489         data = (data >> 8) & 0xff;
    490         if (data != DIMM_SYNDROME_STAGE)
--> 491                 return ret;

Please either return 0; or return -ERROR_SOMETHING;

    492 
    493         /* Write the slot ID to retrieve Error Syndrome */
    494         ret = regmap_write(errmon->regmap, DIMM_SYNDROME_SEL, slot);
    495         if (ret)
    496                 return ret;
    497 
    498         /* Read the Syndrome error */
    499         ret = regmap_read(errmon->regmap, DIMM_SYNDROME_ERR, &data);
    500         if (ret || !data)
                           ^^^^^
This is incorrect.  I have been meaning to add a static checker warning
for code like this.  It looks like the intent was:

	if (ret)
		return ret;
	if (!data)
		return -EINVAL;

To be honest, I would be tempted to just delete the check for zero and
print a zero in the sysfs_emit().

    501                 return ret;
    502 
    503         return sysfs_emit(buf, "%04x\n", data);
    504 }

regards,
dan carpenter
