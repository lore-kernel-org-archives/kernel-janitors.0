Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFAAC001DE
	for <kernel-janitors@archiver.kernel.org>; Mon, 31 Jul 2023 14:11:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbjGaOLS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 31 Jul 2023 10:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjGaOLR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 31 Jul 2023 10:11:17 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0BFB8
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Jul 2023 07:11:16 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fe12baec61so21914335e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Jul 2023 07:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690812675; x=1691417475;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ivUVtrsGAauHV5OjxrYDWaW4CGcUknQ07Ima3p8aKfs=;
        b=wNVyPnSO1PwL2cYQkAKd6S38UtzB8Mx4C1mpMKDMcrPwQXQqSjqc8j1QuLnVGhQKml
         z1Vr6lAKsv17SXsLSTab+M0BkDCcehRyKwi/J6oW2pP9wFWh/Rlx6cS89NOcd6iIQFtI
         REHdDz4OsT1+J6HBWcXlvDSw6ned5ClsZHhjCTb2JqfgR13KKD1dMIndFRhyMnMJF5KZ
         lcVZ7QMbU18qEZEALrOAzD9YU3a5iTQFSjTtyMQLMx23dDKMGI+luoJngtI2wBM/0saC
         qHQ/jr2pL/aUL/uBIQ7wKD/Rxgqlykpz/z/loDDjV5U0yqBFiJQg0Q1fJE/LtCi/nGCv
         OuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690812675; x=1691417475;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivUVtrsGAauHV5OjxrYDWaW4CGcUknQ07Ima3p8aKfs=;
        b=Gw1qBcB4TuEWqMWzDpkD7HHZHmkfN9jhok/Dt6b4joNkpv5Ce3U+ysaIQRcnLBw4tD
         VTdei3qpHMPL6kGUhkRcxIt2LXEVMXZvoJPnUlK5KIPaSQVJ7vL1FvP3ZFjMortiusII
         6h09EvrVbKZeTgjzQZPpaHgDy26cu4GQs0+M4sqDtbcxN8c5z+paP8a90olnO+Nn4SUE
         sYPRp7ce9mbCFCSEsqPlbDUGz6uwGRX/jmo3iBuYZVG2Bd7TP9MVDyQ8CBT+7AlmNtzk
         +OuRAiYAy/mFYLqC9wYBoi1efnQbgyt2yXzC0UW2xMZ5co0RGuFpuVBXlOlfk9crgsXR
         JotQ==
X-Gm-Message-State: ABy/qLY+Pu1jd4No7d3zsJ3UAEonJSdHlaBwGqXlGbtPKpiD6kHGHdih
        W2iIfS2aGdJ/kX03q3iDNZrpFA==
X-Google-Smtp-Source: APBJJlH+Tc4oYbwlTQGYanutl6YzRik+Doi25npj2e9UfWwBoMRZ5rMcBcVzTXvSRkuaZWC6FQE15Q==
X-Received: by 2002:a7b:c3d6:0:b0:3fb:ef86:e30 with SMTP id t22-20020a7bc3d6000000b003fbef860e30mr68023wmj.10.1690812675165;
        Mon, 31 Jul 2023 07:11:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c3-20020a056000104300b003141e629cb6sm13061435wrx.101.2023.07.31.07.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 07:11:14 -0700 (PDT)
Date:   Mon, 31 Jul 2023 17:11:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     huangfq.daxian@gmail.com
Cc:     kernel-janitors@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [bug report] mfd: ezx-pcap: Replace mutex_lock with spin_lock
Message-ID: <a4139c6b-3189-407c-ab5f-db591e135c1d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Fuqian Huang,

The patch b65dc4f6b339: "mfd: ezx-pcap: Replace mutex_lock with
spin_lock" from Aug 13, 2019 (linux-next), leads to the following
Smatch static checker warning:

drivers/mfd/ezx-pcap.c:102 ezx_pcap_read() warn: sleeping in atomic context
drivers/mfd/ezx-pcap.c:102 ezx_pcap_read() warn: sleeping in IRQ context

drivers/mfd/ezx-pcap.c
    93 int ezx_pcap_read(struct pcap_chip *pcap, u8 reg_num, u32 *value)
    94 {
    95         unsigned long flags;
    96         int ret;
    97 
    98         spin_lock_irqsave(&pcap->io_lock, flags);
               ^^^^^^^^^^^^^^^^^^
Taking a spinlock.

    99         *value = PCAP_REGISTER_READ_OP_BIT
    100                 | (reg_num << PCAP_REGISTER_ADDRESS_SHIFT);
    101 
--> 102         ret = ezx_pcap_putget(pcap, value);

My static checker agrees with you that this is an IRQ function but the
ezx_pcap_putget() function takes a mutex and we can't do that from an
IRQ function.

    103         spin_unlock_irqrestore(&pcap->io_lock, flags);
    104 
    105         return ret;
    106 }

regards,
dan carpenter
