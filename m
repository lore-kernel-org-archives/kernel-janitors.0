Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0522CC63709
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Dec 2022 14:02:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiLGOCa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Dec 2022 09:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbiLGOBj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Dec 2022 09:01:39 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0854D5E3D0
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Dec 2022 06:00:49 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id x22so14146869ejs.11
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Dec 2022 06:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfRkMHNrRkp1qLY537DSP04mPwW9szmx8pniSmiTIl8=;
        b=mqcNT3ExPz5YjeGN/Jn7t22ZzS9zuRG2UD5pvjrBMUEj2dQlKDvi6pFca9ZcDPcRLl
         dv3yOFH0afgtZ0mOlcCbaJa9UD7BzL+zpPT+zH+91apwm/cyfWMisr3BMY7wNzSrokFn
         LsVzPO8YkXIVDUrgMyh0gBt2CLcnIqlwrSFiFcDEdw5eJio2h62VzHXvenV22zyVBNtL
         OrzZwfVa3DTgGE0FhTrXKGZTqMY05sz+JQG6a9DiBrLcJZtV2mFk/P7iBKo6A+tDH9x8
         rJlP2rABfZ3veXE2zjwcLaTl6rgE3WDypXCr8djQKITx+PltF98oslvQzZbFm3zKixAC
         Z3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jfRkMHNrRkp1qLY537DSP04mPwW9szmx8pniSmiTIl8=;
        b=pXmdgTC+nSbmlrQr8d5smz9020IiihM14o/SISJ2T6V1YGzE2MVAbHLv9Jq5BD3yeD
         3bqwM6BmYe9ezXmmSCa/NE9Ei+1L6d+3iiIWI1C0vX2ktlgqg7b+/hrLdupuI20mEKMg
         FGqtQTYkQMZHRZ8x1S0ILK/sscQ4EKKfizoqNT4sYDYZ6GCUMcdJ7VvChD/R4+uq9FeC
         CvOsYzQEWchSZByrpT/R/2SWAqHzZuNLmmV/dnLyzGLux+9Gyi4ed2vRD1lIye4HSEp6
         cH40778eYNUSA2AqqwKMK8gks7jKhU2phjDU42SIxe/WNhCSROQJfq1Wag5Lo++unwjM
         KMuQ==
X-Gm-Message-State: ANoB5plnv3A1HshBf3grPpeilP2jstc+bKTS0oOmdNHEg5OtrociDnF+
        THmEH7LGUETQNLkpcaDkvTA=
X-Google-Smtp-Source: AA0mqf6tGtcQiB1pfq3u+wqBZOMVAwFc2sR4CTneNWQMvND/A7e5Gp5bm83HUUU1BK2Lev/cgnwBgw==
X-Received: by 2002:a17:906:a148:b0:7ad:b286:8ee2 with SMTP id bu8-20020a170906a14800b007adb2868ee2mr33552244ejb.511.1670421647365;
        Wed, 07 Dec 2022 06:00:47 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d71792c8dsm8506372ejf.180.2022.12.07.06.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 06:00:46 -0800 (PST)
Date:   Wed, 7 Dec 2022 17:00:43 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     idosch@nvidia.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] mlxsw: spectrum: Apply RIF configuration when joining a
 LAG
Message-ID: <Y5Cci6U4sb4hYNUL@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ido Schimmel,

The patch 31e1de4f1242: "mlxsw: spectrum: Apply RIF configuration
when joining a LAG" from Dec 6, 2020, leads to the following Smatch
static checker warning:

	drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:8546 mlxsw_sp_port_vlan_router_join()
	warn: missing error code here? 'mlxsw_sp_rif_find_by_dev()' failed. 'err' = '0'

drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
    8534 int
    8535 mlxsw_sp_port_vlan_router_join(struct mlxsw_sp_port_vlan *mlxsw_sp_port_vlan,
    8536                                struct net_device *l3_dev,
    8537                                struct netlink_ext_ack *extack)
    8538 {
    8539         struct mlxsw_sp *mlxsw_sp = mlxsw_sp_port_vlan->mlxsw_sp_port->mlxsw_sp;
    8540         struct mlxsw_sp_rif *rif;
    8541         int err = 0;
    8542 
    8543         mutex_lock(&mlxsw_sp->router->lock);
    8544         rif = mlxsw_sp_rif_find_by_dev(mlxsw_sp, l3_dev);
    8545         if (!rif)
--> 8546                 goto out;
                         ^^^^^^^^
Is this an error path?

    8547 
    8548         err = __mlxsw_sp_port_vlan_router_join(mlxsw_sp_port_vlan, l3_dev,
    8549                                                extack);
    8550 out:
    8551         mutex_unlock(&mlxsw_sp->router->lock);
    8552         return err;
    8553 }

regards,
dan carpenter
