Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F195CC636D7
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Feb 2023 04:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbjBWE4z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 22 Feb 2023 23:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233212AbjBWE4x (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Feb 2023 23:56:53 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1CD38657
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Feb 2023 20:56:50 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id l1so9408051wry.10
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Feb 2023 20:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2R0sh426zdxJcYRmlW0yZ+09D9f1DNUVgybrCsmB0pI=;
        b=LomTDdY7B+xteEBNM8Sr/UsefZg1KftLMLeoPtAMEPELptwaphTxZoMoxPGQmzSETo
         ZyKsu/VdeP6RLj9cFefmhKKj2ZJz3kVbkUdKEL97n5xOTjKGLqlrbeaiZwPtAB7RPXEe
         8275GzTG7ADaHFNELyer6sDdOcEpGg5ICvYRgmD3tod9Y02fAu7ti3lL60xtlWTYEW0H
         h8FAaK0X6MuSCYgC7TqLRQXff4xyCej98Q+xyI029NpTkEEHDKDU1j1bpVH/omyPF1Of
         lFlP97dVMWVYkiSQwv+Ec6c2z9rqH95uTUtZMHIgRqxP6pfdwigIxjX7TI2fGBt15qpS
         +DnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2R0sh426zdxJcYRmlW0yZ+09D9f1DNUVgybrCsmB0pI=;
        b=yokT7y1nEwllb5G92iUvxNzM/98oFEK588Jg6MmN8kKpybzt8GNPriry8ZvRAsF7Pp
         g2n+VsFYJIXvkXD+1oP3ME+Y+MCzuIzIYCUPBDSKsefk0qvpGu65EIn+Zx0Lw6+Ygc2S
         cX7euiHsk6jdAn2o6QEgEaBvpbQUEC2ppJ7qQTceonAt6OtK3EA3BAfOVzcjV4AgW7rx
         1uJM7gzwR96nFxwZxgAe2Ti5QULO9F7aeKmDAN/uR/tozMv01Mv06LarePVthmzkRtj0
         g94mLMhCti2uPQwrKLSnEH59+iveyOXuvQIAUbsXoY2SfQZzVOQrWalpLBefHLKxfI3M
         LnCg==
X-Gm-Message-State: AO0yUKVQL2WHTTw0M8YHIfqe3alTrbSTtw9qAhWgTuGTtmkWG5fuXCHV
        aPccV7qrEEVz09xCcdEbILY=
X-Google-Smtp-Source: AK7set/DuGd2NbN/UGGTXOnVxgkpBEybfcGkMUu2ipuCPleBOX+imPbZsC5/xGrF7RqT2D6V/+ohgA==
X-Received: by 2002:adf:fb06:0:b0:2c5:4af3:3d26 with SMTP id c6-20020adffb06000000b002c54af33d26mr9513656wrr.9.1677128208714;
        Wed, 22 Feb 2023 20:56:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e16-20020adfe390000000b002c54c8e70b1sm9116990wrm.9.2023.02.22.20.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:56:48 -0800 (PST)
Date:   Wed, 22 Feb 2023 10:47:35 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     linux@rempel-privat.de
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: phy: add genphy_c45_ethtool_get/set_eee() support
Message-ID: <Y/XIl7Q4gw9Nuj/Z@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Oleksij Rempel,

The patch 022c3f87f88e: "net: phy: add
genphy_c45_ethtool_get/set_eee() support" from Feb 11, 2023, leads to
the following Smatch static checker warning:

	drivers/net/phy/phy-c45.c:716 genphy_c45_write_eee_adv()
	error: uninitialized symbol 'changed'.

drivers/net/phy/phy-c45.c
    673 int genphy_c45_write_eee_adv(struct phy_device *phydev, unsigned long *adv)
    674 {
    675         int val, changed;

changed = 0;  similar to a bug I reported last week but a different
function.

    676 
    677         if (linkmode_intersects(phydev->supported, PHY_EEE_CAP1_FEATURES)) {
    678                 val = linkmode_to_mii_eee_cap1_t(adv);
    679 
    680                 /* In eee_broken_modes are stored MDIO_AN_EEE_ADV specific raw
    681                  * register values.
    682                  */
    683                 val &= ~phydev->eee_broken_modes;
    684 
    685                 /* IEEE 802.3-2018 45.2.7.13 EEE advertisement 1
    686                  * (Register 7.60)
    687                  */
    688                 val = phy_modify_mmd_changed(phydev, MDIO_MMD_AN,
    689                                              MDIO_AN_EEE_ADV,
    690                                              MDIO_EEE_100TX | MDIO_EEE_1000T |
    691                                              MDIO_EEE_10GT | MDIO_EEE_1000KX |
    692                                              MDIO_EEE_10GKX4 | MDIO_EEE_10GKR,
    693                                              val);
    694                 if (val < 0)
    695                         return val;
    696                 if (val > 0)
    697                         changed = 1;
    698         }
    699 
    700         if (linkmode_test_bit(ETHTOOL_LINK_MODE_10baseT1L_Full_BIT,
    701                               phydev->supported_eee)) {
    702                 val = linkmode_adv_to_mii_10base_t1_t(adv);
    703                 /* IEEE 802.3cg-2019 45.2.7.25 10BASE-T1 AN control register
    704                  * (Register 7.526)
    705                  */
    706                 val = phy_modify_mmd_changed(phydev, MDIO_MMD_AN,
    707                                              MDIO_AN_10BT1_AN_CTRL,
    708                                              MDIO_AN_10BT1_AN_CTRL_ADV_EEE_T1L,
    709                                              val);
    710                 if (val < 0)
    711                         return val;
    712                 if (val > 0)
    713                         changed = 1;
    714         }
    715 
--> 716         return changed;
    717 }

regards,
dan carpenter
