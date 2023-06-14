Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350ACEB64D8
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Jun 2023 13:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244106AbjFNNA6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 14 Jun 2023 09:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244794AbjFNNA4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 14 Jun 2023 09:00:56 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF211BC5
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 06:00:54 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f739ec88b2so5199745e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 06:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686747653; x=1689339653;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJnIdDJGr0TTHG99WpuVkZMKdyGw8FjvIvxdBw6UFC8=;
        b=hiM5g67OQi2VvgCoEQxTrF3J6EK1xW4DtTfAgKWB5Fst0chRPVi4M8CJewAwH0UTnc
         +BLZ6yR6hLY9BpYlraUHJds6HQvMEq9ppr1kqu2ELuu1wT+6m6M65bCAbbYsWzUyiULb
         qgUJl1+NyJNXpWkr8STOn9Jbm1zLi88FmXsYQhvz72r1SJwLHdRTvfo+rb4ZB6nSVxCI
         gPL88EQFoHeEn+SEhLotBOyIR3kZI/V2y89nKSdyqIo36HREPSLP8tGictsLMkA0UeOa
         aubDdcW1eylHg7+S2hg7AOtjXq4+O8ZIUYEj+Dk/OUAFctEvmUQ3gxKvoBWwdRLPzhRM
         dtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747653; x=1689339653;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJnIdDJGr0TTHG99WpuVkZMKdyGw8FjvIvxdBw6UFC8=;
        b=dTZz0SMmlg+fpf5WhdA+gSVBC77xaUERCSkuQdvgE4NGBl9pUUFCowLVeyI97188Ep
         cMM887NlzHoGMo30jUV07AAldO5fHyLu98YsCPI5Sg2NQbBLlXHg6Tay7UjDUyGyPp/r
         y70P0thuhaBJYws+m+nB+ny4X05gBxg+zus2fzRWWdrhxiHsiisqACpHV4O8Bb7W92Wb
         x1w98l1au0UjC2FzB+KxseSTrDBe1m37eIc2vTwwtUnfs7Id42ZUaaKOZvxa1v3XOS+2
         pVVgWQA9K9Srv42RNO6eeo1qmZw4MuaNphA1w16M/xDPIBSNYNDj5IW35D8Ah9U95dnK
         7fLg==
X-Gm-Message-State: AC+VfDwxzX6u17A2dxz/fELdyPTCVNqVXCdCIi7Oo2sbByxPkRjhopJM
        l4aYfdbJYo4heisw5AJDaWU0BtURifcmKq0786c=
X-Google-Smtp-Source: ACHHUZ5uQ9/fgMEn/TyPfzq3uQ8WM/k+uKEhEAetIOOxwLwekdIXvTqqWIY0v80nypTo9/+/qGhTQg==
X-Received: by 2002:a05:600c:c2:b0:3f7:30c0:c6a with SMTP id u2-20020a05600c00c200b003f730c00c6amr10023654wmm.25.1686747652920;
        Wed, 14 Jun 2023 06:00:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c228b00b003f7361ca753sm17370301wmf.24.2023.06.14.06.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:00:51 -0700 (PDT)
Date:   Wed, 14 Jun 2023 16:00:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     shayd@nvidia.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net/mlx5: Move esw multiport devlink param to eswitch
 code
Message-ID: <dcf9c2cd-25d1-48b2-bdec-3d57de6da81e@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Shay Drory,

The patch 3f90840305e2: "net/mlx5: Move esw multiport devlink param
to eswitch code" from May 17, 2023, leads to the following Smatch
static checker warning:

	drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1848 mlx5_eswitch_cleanup()
	error: dereferencing freed memory 'esw'

drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
    1828 void mlx5_eswitch_cleanup(struct mlx5_eswitch *esw)
    1829 {
    1830         if (!esw)
    1831                 return;
    1832 
    1833         esw_info(esw->dev, "cleanup\n");
    1834 
    1835         esw->dev->priv.eswitch = NULL;
    1836         destroy_workqueue(esw->work_queue);
    1837         WARN_ON(refcount_read(&esw->qos.refcnt));
    1838         mutex_destroy(&esw->state_lock);
    1839         WARN_ON(!xa_empty(&esw->offloads.vhca_map));
    1840         xa_destroy(&esw->offloads.vhca_map);
    1841         ida_destroy(&esw->offloads.vport_metadata_ida);
    1842         mlx5e_mod_hdr_tbl_destroy(&esw->offloads.mod_hdr);
    1843         mutex_destroy(&esw->offloads.encap_tbl_lock);
    1844         mutex_destroy(&esw->offloads.decap_tbl_lock);
    1845         esw_offloads_cleanup(esw);
    1846         mlx5_esw_vports_cleanup(esw);
    1847         kfree(esw);
                       ^^^
Free.

--> 1848         devl_params_unregister(priv_to_devlink(esw->dev), mlx5_eswitch_params,
                                                        ^^^^^^^^
Use after free.

    1849                                ARRAY_SIZE(mlx5_eswitch_params));
    1850 }

regards,
dan carpenter
