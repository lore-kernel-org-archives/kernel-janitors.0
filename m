Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECBBC3DA78
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 Jan 2023 14:18:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjAQOS4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 17 Jan 2023 09:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbjAQOSa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Jan 2023 09:18:30 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8B23BDB2
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Jan 2023 06:18:28 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id h16so30720411wrz.12
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Jan 2023 06:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SFh+3lbdE6jsmEVbwvg26U0x4uFR9Yrq9uod9E3sVak=;
        b=in2p+zBKBbwEm1tsXkvajM6BS4MJpF2qhucutldG3OTRLdzV3hHbmjsV5FiPcK4opR
         3LbXcPj/28GLexgr4YTBpBjCdAW2auGi5S34yq7hFBIMrkYQiRcK94Sp9NQQBxh920dT
         pZieFLmGt/8EenLUcL+YbEJZFw14+ZkrbYaSvQ0Xq52FSLG6OQF+IaHHkkG5FPdCyiZz
         ue0knS8j8kAhLyAp92niH6ojI8xfyH6lKbc5TiUmMdmRNYScvgfHWMDJVRcbEwUuAU7W
         L9sxELF+lRRwLra4rAqum/vQqZKC2oKcObYM2u7lBvLsCkq2sTzNTY7ApO9UNvi7/LvW
         Uwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFh+3lbdE6jsmEVbwvg26U0x4uFR9Yrq9uod9E3sVak=;
        b=noAZA5fX+M7lJ5mF02veQ2Ez2H3Q7A0k+BqzQNIbHIesT6idLQ3qDza/h8PDlizmGq
         Gr2A82kM5H5KRF7Mo/CkznOKSFrKBdjC2dUV3xAWUXGj6XQQHFYOb+LvRHr6EkHIthDB
         G6u2EpN5bEagIU3Xu1zQnKXmVNOY1lNGabIHj9yrZm4ovOwiaoQ3YoUoKXQdmDS7XRkT
         JodvFdSfDtrAnWhAfXVMlBwBdZTw5HueeGfPJovuwWHReivPuVPfrTmfpAykC7QHMqj7
         /FOQV2QCUK1bQgN1Ck8Mr8JopV6M3dQ/hD32bVv56Bh040V/FxKBwZvArgFKT66K8B8u
         VFLw==
X-Gm-Message-State: AFqh2krrUy6z+uZFa7gSUJ9DImr9A3IX+j0+4JGNpANs5CRHV2Wc79Lq
        QtKd7md3vMpsHj1UTmeCqRo=
X-Google-Smtp-Source: AMrXdXsPsSrGl5WUUEEK+3CXkRaUo9YvprrP1+uEq50CAs400GlEVVDsuANwlQXYuz8r3Z+X25Bd/g==
X-Received: by 2002:a5d:6387:0:b0:2bd:ef73:3b6e with SMTP id p7-20020a5d6387000000b002bdef733b6emr2919622wru.35.1673965106946;
        Tue, 17 Jan 2023 06:18:26 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d4588000000b002bdfb97e029sm6898957wrq.19.2023.01.17.06.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:18:25 -0800 (PST)
Date:   Tue, 17 Jan 2023 17:18:19 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     andrew@lunn.ch
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: mdio: Add dedicated C45 API to MDIO bus drivers
Message-ID: <Y8auKyhinOCcLqn2@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Andrew Lunn,

The patch 4e4aafcddbbf: "net: mdio: Add dedicated C45 API to MDIO bus
drivers" from Jan 9, 2023, leads to the following Smatch static
checker warning:

drivers/net/phy/mdio_bus.c:1003 mdiobus_c45_read() warn: sleeping in atomic context
drivers/net/phy/mdio_bus.c:1104 mdiobus_c45_write() warn: sleeping in atomic context

drivers/net/phy/mdio_bus.c
    993  * @regnum: register number to read
    994  *
    995  * NOTE: MUST NOT be called from interrupt context,
    996  * because the bus read/write functions may wait for an interrupt
    997  * to conclude the operation.
    998  */
    999 int mdiobus_c45_read(struct mii_bus *bus, int addr, int devad, u32 regnum)
    1000 {
    1001         int retval;
    1002 
--> 1003         mutex_lock(&bus->mdio_lock);
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
This takes a mutex.

    1004         retval = __mdiobus_c45_read(bus, addr, devad, regnum);
    1005         mutex_unlock(&bus->mdio_lock);
    1006 
    1007         return retval;
    1008 }

The problematic call tree is:

b44_ioctl() <- disables preempt
-> phy_mii_ioctl()
   -> mdiobus_c45_read()

regards,
dan carpenter
