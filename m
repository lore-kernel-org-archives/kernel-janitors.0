Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C1AC54EBE
	for <kernel-janitors@archiver.kernel.org>; Mon, 16 Jan 2023 10:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjAPKHm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 16 Jan 2023 05:07:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjAPKHN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Jan 2023 05:07:13 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4E11B54B
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Jan 2023 02:06:49 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id o15so19575685wmr.4
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Jan 2023 02:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l8ZbtSHOUAKocMKDLySjiAo61QyKAr+kh0P7nwLFVz8=;
        b=nVswlCxitVNTLiT7uh4nFEbsUuOSEhdDRrH23xCJaSC+Rfrq4YtaiLJ5oxXmnTM9D+
         xFXJKi05w0p27LuVFi3TPZUE2C65tAklXigoqHJf5izPL1mNbHYjH+N15AOlLQvdCMi2
         n/6QQsMyP6X61SU84AT/vUc6njRjBxAIKSW3AKkna83+RTfF94EoC6Py3BRNwRlblpH5
         wmma2QnZlIEdwcugtOudctASL9DnZBamIpOoj4Vvm4uSpqLQ+8KLn6/fgyCcDIFibXLD
         9CD151eCLWnlq2BMfblrtBwKAKyMUmP+4nWHTHZ6ACW4ZD767WHTcDXhYNoLZRUT0kvS
         j/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l8ZbtSHOUAKocMKDLySjiAo61QyKAr+kh0P7nwLFVz8=;
        b=gbp9pat3vSKEjdUft5rtznoAKq4pUoWfn3DkSRfyyZTH9vVD4x72Kg6lYRuWxsd1HL
         ZoOJIpmKun/RppailMkq9gVLjv/INXbsByMC0kPYGzmDleRDDM2qAlLhVkRboe2yDoCN
         Vy+zjwNi2OoacMkQvwCyMRru2NO7Xxv6rJjFWAsloONkPeuT/O4Q/7FvF4TGbJ9q8S24
         5es/pFhwF6NtFn92lniVq3EjiumvGn5n06Dr4klf4TupClkEr3ouXx5/76FXsl2OtUsh
         /CdIviZNg28vGnbsFGOaeUoIorHSD12VlxGO0bTBNLR8f922kG19ZpKdMRNfzYxFcBwR
         lTyw==
X-Gm-Message-State: AFqh2krt1mJfmq+9KGHWZERl7n0Nq1uvQKTJ3KqV9lY7KkpnZbCNpYlI
        gQ/4GVFgWmNEB8rXWlEIWQSfAH3BLm4=
X-Google-Smtp-Source: AMrXdXteKOo/YtjCsBJ0u+t1ZYIC58kmKlq08Y/Q8ZOkMZpnDP+xIVM55DYsK+Ws0tbDQFbsKX0qCw==
X-Received: by 2002:a05:600c:1c99:b0:3da:909f:1f6b with SMTP id k25-20020a05600c1c9900b003da909f1f6bmr6177374wms.1.1673863608513;
        Mon, 16 Jan 2023 02:06:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u2-20020a05600c210200b003d98f92692fsm11656315wml.17.2023.01.16.02.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 02:06:47 -0800 (PST)
Date:   Mon, 16 Jan 2023 13:06:44 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     tariqt@nvidia.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net/mlx5e: kTLS, Add debugfs
Message-ID: <Y8UhtLhI3fEeRA++@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Tariq Toukan,

The patch 0fedee1ae9ef: "net/mlx5e: kTLS, Add debugfs" from May 3,
2022, leads to the following Smatch static checker warning:

	drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls_tx.c:897 mlx5e_tls_tx_debugfs_init()
	warn: 'tls->debugfs.dfs_tx' is an error pointer or valid

drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls_tx.c
    890 static void mlx5e_tls_tx_debugfs_init(struct mlx5e_tls *tls,
    891                                       struct dentry *dfs_root)
    892 {
    893         if (IS_ERR_OR_NULL(dfs_root))
    894                 return;
    895 
    896         tls->debugfs.dfs_tx = debugfs_create_dir("tx", dfs_root);
--> 897         if (!tls->debugfs.dfs_tx)

This isn't NULL, but also the correct way to write debugsf code is to
delete the error checking.  There are some exceptions where the driver
dereferences ->dfs_tx directly to get the inode size or whatever, but it
doesn't apply in this case.

    898                 return;
    899 
    900         debugfs_create_size_t("pool_size", 0400, tls->debugfs.dfs_tx,
    901                               &tls->tx_pool->size);
    902 }

regards,
dan carpenter
