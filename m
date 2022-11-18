Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB4BC4332F
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Nov 2022 11:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbiKRLVb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Nov 2022 06:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240866AbiKRLVB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Nov 2022 06:21:01 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD35697C1
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Nov 2022 03:20:59 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id bs21so8769348wrb.4
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Nov 2022 03:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wI8VnwsOTsKELjFhbeJN//XEX4AhQdiT05+NuNvYyZg=;
        b=SG+t1B5MXfqsF6dMQAHnfNNGjwmxe21f91krmdpYMeIdRfvl4XncbcrtjUMma0X4V5
         wDYtIQ0jRAwyVpzGomwO6hI82TLjUR1QosCGMlMjsy7fpHuJLdGhpC5DctRE9mZAdclH
         IIGOhePzswL5aGbGbySyS4tNw0o5IJ/bxuo2Ks3SWhSOg/XvPYFdSWLP5BqDS+sYpJKu
         1x2eIioZdcpOiiN4mzQKitY49zPvroGqQtiVNPu106SVkVpq6YQqZsQQ4DIhHNIwgcF5
         9QWVN0i1OeYiAC631HkqtSBRsb/U41WEVKedFhB2LvfqEakdS4SXI+Id531NOadilzGd
         7Wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wI8VnwsOTsKELjFhbeJN//XEX4AhQdiT05+NuNvYyZg=;
        b=dpJ0NXY2NwAzX9rrmhCMBFvB+EZdZHfVpnfpHBsgUyy+LGe8lSG6qkACVnTgYZb78V
         70Bn+XeycnnroQA/NLNSRKMSlhLG5hiQQUFuQOcwrUDfWg8iqrbpG4G/HouBotKVFl4z
         VX9Um451SknDgVSCPQFbX7P4B+jaPgCmZAO/dqQbVboXB1DmIHSrULrn78p6fPFF9jPG
         u01RjZB/MV6RyQwQm+rbOLlU40TfzP5bwf6CfHX/BvhI239hCITH9IGavgZrHn27Esyo
         +S8GiRdwdnXrzSgleWsdtmKk87rv2oLbFmq6CNDF3eGGZkPsCS3YnovDc6qiZNZgoYXu
         krXw==
X-Gm-Message-State: ANoB5pk+fApOMZ9pux0zj8TuPX3u5lib6MN13HnOzwyDTLCcGopsC+Xz
        Eubfn6acWS2YBuzg3Nv1E/FANuqtmsktIA==
X-Google-Smtp-Source: AA0mqf7DGT7HH1nL4/i8LoObtfwOXBYRO1zVgfp0Yp1rqwL5GF6kXlgAaBYOuLlox73Du1FSl/d/Rw==
X-Received: by 2002:a05:6000:1148:b0:236:71cd:1a71 with SMTP id d8-20020a056000114800b0023671cd1a71mr4024507wrx.712.1668770458275;
        Fri, 18 Nov 2022 03:20:58 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c3-20020a5d4cc3000000b00241c4bd6c09sm809845wrt.33.2022.11.18.03.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:20:57 -0800 (PST)
Date:   Fri, 18 Nov 2022 14:20:55 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     cai.huoqing@linux.dev
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: hinic: Add support for configuration of
 rx-vlan-filter by ethtool
Message-ID: <Y3dql2JP3jyTBPYs@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Cai Huoqing,

This is a semi-automatic email about new static checker warnings.

The patch 2acf960e3be6: "net: hinic: Add support for configuration of
rx-vlan-filter by ethtool" from Nov 3, 2022, leads to the following
Smatch complaint:

    drivers/net/ethernet/huawei/hinic/hinic_port.c:459 hinic_set_vlan_fliter()
                                                                      ^^^^
This should be "filter" instead of "fliter" (swap the li).

    warn: variable dereferenced before check 'hwdev' (see line 453)

drivers/net/ethernet/huawei/hinic/hinic_port.c
   452		struct hinic_hwdev *hwdev = nic_dev->hwdev;
   453		struct hinic_hwif *hwif = hwdev->hwif;
                                          ^^^^^^^^^^^
Dereference.

   454		struct pci_dev *pdev = hwif->pdev;
   455		struct hinic_vlan_filter vlan_filter;
   456		u16 out_size = sizeof(vlan_filter);
   457		int err;
   458	
   459		if (!hwdev)
                    ^^^^^^
Checked too late.

   460			return -EINVAL;
   461	

regards,
dan carpenter
