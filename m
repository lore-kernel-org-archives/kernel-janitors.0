Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777E0C6FD1C
	for <kernel-janitors@archiver.kernel.org>; Sat, 25 Mar 2023 07:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCYHfK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 25 Mar 2023 03:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjCYHfJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 25 Mar 2023 03:35:09 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1D493C5
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Mar 2023 00:35:07 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id y4so16281736edo.2
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Mar 2023 00:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679729706;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xq6cHljyVfxp4pPtvgru9AgrIGWOZ06TvlxxbjJmGjA=;
        b=nl3zmvm81hbhPusJPRCZ9r290yh0BlBOc0WocGAKDuwrSVgnDBYEKh+0lGC2Nom3HS
         T16eHuClIfhXWjGMVGXDIbbtGt2SIaN6TneVQz6AXgms1n8IXtHpk5mHz3NImQxoLJKD
         WRICtQKP36Pu2LMpjBuLtzzzAXvZk/EB/L+iNc1lU+fjIrQyRU7F9HE5cpwF6zI2YkFz
         VbtGlXVL7Ye9Q1TWoG/jWUh+fBe8mbFAq9UNRfH4qQKEUbhz4ZSlYHcJQ7tzclq/NHCf
         dDRC+W3diWv9ZvmlMHC5KPJ/+YrGOf0q6hXOme+qcj/en0JhukluDOYHT0y5HcwmYvpz
         E4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679729706;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq6cHljyVfxp4pPtvgru9AgrIGWOZ06TvlxxbjJmGjA=;
        b=Q+1pBrdnvtX+S9IXFboSPPC3S90GqK7sQENhPBRAwq2YmZ1Kae0m87OaLuhKTBxWVH
         AZ3271ke8RWwNNhIsro62RPlAssEHfZi0jz+twNkD5c7BwSQrM/vnlqLkXEnt4G5qNEw
         2m1NY19Pne6/QI8qKiS8Ddhg1mxkgJsB2ZMHK/7lwN4fw2GnzW6HBq1cLfvDJ1lbfeCb
         TaA4f9v1E4WV3r3H1vuP4jSryrWY1y722s90kE2NZHihyMUtw7S7udA/Lo6TC1u5x/hl
         rYPMV7oOTsD5QAlapXDuVVKYz8Tvvv7yoHg5ETlaBcC2e8M8eMQAl53lNO8rlCwbtD1z
         xl5Q==
X-Gm-Message-State: AAQBX9evgV3iP65zGtYyTwQBY5mebmfN67rfVdz6wy9pnQ1tpmWC19VX
        2zGsqsSGyvXXbvVJ4OwSyX5n8T1A7ekHrA==
X-Google-Smtp-Source: AKy350bRlv9FWC65gE5N9A8TX/EOnF3JsUrlPtQvjycmaHrsJyMOl79SZQtP1nUlfH4ZWKqw44FdGg==
X-Received: by 2002:aa7:c98b:0:b0:500:4c0e:cb8d with SMTP id c11-20020aa7c98b000000b005004c0ecb8dmr5451476edt.5.1679729706062;
        Sat, 25 Mar 2023 00:35:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y70-20020a50bb4c000000b004fa380a14e7sm11899460ede.77.2023.03.25.00.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 00:35:05 -0700 (PDT)
Date:   Sat, 25 Mar 2023 10:35:01 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     steen.hegelund@microchip.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: microchip: sparx5: Adding KUNIT tests of
 key/action values in VCAP API
Message-ID: <7bffefc6-219a-4f71-baa0-ad4526e5c198@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Steen Hegelund,

The patch c956b9b318d9: "net: microchip: sparx5: Adding KUNIT tests
of key/action values in VCAP API" from Nov 9, 2022, leads to the
following Smatch static checker warning:

	drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:1416 vcap_api_encode_rule_test()
	warn: 'rule' was already freed.

drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c
    1406 
    1407         /* Check that the rule has been added */
    1408         ret = list_empty(&is2_admin.rules);
    1409         KUNIT_EXPECT_EQ(test, false, ret);
    1410         KUNIT_EXPECT_EQ(test, 0, ret);
    1411         vcap_free_rule(rule);
    1412 
    1413         /* Check that the rule has been freed: tricky to access since this
    1414          * memory should not be accessible anymore
    1415          */
--> 1416         KUNIT_EXPECT_PTR_NE(test, NULL, rule);

Obviously the comments say that this is already free so it's going to be
"tricky".  :P  What's happening here?  This is to test that KASan will
crash properly?  Could we put that in the normal KASan tset directory so
that we can ignore those deliberate crashing bugs?

    1417         ret = list_empty(&rule->keyfields);
    1418         KUNIT_EXPECT_EQ(test, true, ret);
    1419         ret = list_empty(&rule->actionfields);
    1420         KUNIT_EXPECT_EQ(test, true, ret);
    1421 }

regards,
dan carpenter
