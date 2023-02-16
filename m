Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55EBC636CC
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Feb 2023 15:55:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjBPPzs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Feb 2023 10:55:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjBPPzr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Feb 2023 10:55:47 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1143518D1
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Feb 2023 07:55:45 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id fi26so4542857edb.7
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Feb 2023 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WdIfwlRIe3SYaIXYr3EC0QymFFpkOZ3GX+rKOSeGo9k=;
        b=C44oIW4KGd0tZLVeDb4PEnp/YMmnvoP9BkJIg+IOeCUL5m3C8rI0UvE6dDDJ2RQlQt
         4bLM3YwBtptCwxM4/qqPtTuwHtXxhxBLvS4+cxKceQVgmguCHoRcgP0WoPmK3lfU+dUS
         ctFQ0PXDrIE3N9IF+6+JLKB4AV6squMe+fa1q2gHnqX4lOoaIzqIXe+fREGpSK0pHYai
         NrR2LUdWHbQDNPek+rSKWZaDXfEmWiDB6py2gDkqjqRqw0tOmTfmO5kn+4V2X1unGPPm
         FrW9bk9n2qkJcwucPfoI/ort+lkobJmvKPStODO8sx9hMUZ4Igv56/ZV7ew4FAbk6PUS
         6ELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WdIfwlRIe3SYaIXYr3EC0QymFFpkOZ3GX+rKOSeGo9k=;
        b=auSHhG06tOg+i3mXGULTeRcBceMfcRe2NVaAUAcfMpDiH0yv0X5Rv/T0CvEXU9nZLf
         iGEwR6Noqv1hNdIGQFCwcUAN7ELn/jUMjGWK0zTSkmBZGvw6QFoH61M5UYSPAzX3Fbax
         1ZIRGbHy9T7UG27gmeTONKz2l1CyFdzVhiqwadsdjn0Xj8GDyRKoOeqmaNU0D6dje8aU
         VM2IdezPcSmvnIVyBI+EXtQ19N446ZW/8l/izdS2dY4OVDAoXUv9J7UB/Xdw9UghKH4o
         2Cj3KN1vvkEoHPOuWjmFlJ1afaeMcgB22oLtho1powrcqTP2KLiw29iPnuLLNCnsVE2b
         GU8g==
X-Gm-Message-State: AO0yUKXSX/umWlipf97UOprBMrnTAYEyolcGVzOPyakg2PEEC+HnvhJU
        2/yaFFdP7ibNdpuKdQ0KoaA=
X-Google-Smtp-Source: AK7set99FVcz/jR+kDQV/zD5ibcfbSPYiRPpSLRlzGeAMsdFeYZDbIMo8vlaC2tz2lw/vagzRr1zAg==
X-Received: by 2002:a17:907:2cc1:b0:8a4:7806:6eed with SMTP id hg1-20020a1709072cc100b008a478066eedmr6014341ejc.63.1676562944197;
        Thu, 16 Feb 2023 07:55:44 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id mj8-20020a170906af8800b008b12c368ba0sm962476ejb.45.2023.02.16.07.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 07:55:43 -0800 (PST)
Date:   Thu, 16 Feb 2023 18:55:34 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     ozsh@nvidia.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net/mlx5e: TC, map tc action cookie to a hw counter
Message-ID: <Y+5R9kYqVeaAsKUk@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Oz Shlomo,

The patch d13674b1d14c: "net/mlx5e: TC, map tc action cookie to a hw
counter" from Feb 12, 2023, leads to the following Smatch static
checker warning:

drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:5032 mlx5e_stats_flower() warn: missing error code here? 'mlx5e_tc_get_counter()' failed. 'err' = '0'
drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:5019 mlx5e_stats_flower() warn: missing error code here? 'mlx5_devcom_get_peer_data()' failed. 'err' = '0'
drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:5379 mlx5e_tc_nic_init() warn: missing error code 'err'
drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:5515 mlx5e_tc_esw_init() warn: missing error code 'err'

drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
    5375         mlx5e_tc_debugfs_init(tc, mlx5e_fs_get_debugfs_root(priv->fs));
    5376 
    5377         tc->action_stats_handle = mlx5e_tc_act_stats_create();
    5378         if (IS_ERR(tc->action_stats_handle))
--> 5379                 goto err_act_stats;

This one is clearly a bug, but I'm not really sure about the first two
warnings.

    5380 
    5381         return 0;
    5382 
    5383 err_act_stats:
    5384         unregister_netdevice_notifier_dev_net(priv->netdev,
    5385                                               &tc->netdevice_nb,
    5386                                               &tc->netdevice_nn);
    5387 err_reg:
    5388         mlx5_tc_ct_clean(tc->ct);
    5389         mlx5e_tc_post_act_destroy(tc->post_act);
    5390         mlx5_chains_destroy(tc->chains);
    5391 err_miss:
    5392         mlx5e_tc_nic_destroy_miss_table(priv);
    5393 err_chains:
    5394         mapping_destroy(chains_mapping);
    5395 err_mapping:
    5396         rhashtable_destroy(&tc->ht);
    5397         return err;
    5398 }

regards,
dan carpenter
