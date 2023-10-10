Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC54CD6911
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Oct 2023 09:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjJJJ1Q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 10 Oct 2023 05:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjJJJ1O (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Oct 2023 05:27:14 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D7D94
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Oct 2023 02:27:12 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32615eaa312so4957362f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Oct 2023 02:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696930031; x=1697534831; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7556bqaVA1z+2Gm5kzPcXp2IdjVYqv32wgrZvs/ywM=;
        b=ZGLApvL7Z89SBZtn/1f6U3RVZd//falsK51hiEsX/g2d1J3sDVsq5NPYiJ411DCFxu
         tpj1qGZDWRHZYjM5995yDkxZAYFR1Q68PTn47vQj8bPKefkeNZdPZQr1xbr5kqLUkYVG
         k7jMmpi4K/AqwkihGVrIK9aO66UWrTzZFvaJ1ZCtxBzdmKbioEF5zmP2LwCwx+B/HFjq
         5E4EMWllTGmN0SJxnwU05urES8AwuxL2FexFHVdPIt1Y9b5hFd7mCM2x6jQ32DYeiIwb
         QXQQ9MytEtpbqGMxFBeMy1rKZBNkQYBgGJ4RWHjuLru89b9XTy8To2DdT4fxre8XnXgk
         PDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930031; x=1697534831;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7556bqaVA1z+2Gm5kzPcXp2IdjVYqv32wgrZvs/ywM=;
        b=wHusrUPDBwUMs3nw8CGsoBT+phifuUph8cUlyhGZBTZMDbuF05GwGUrJNxMwOXHaQa
         P6h1c8XtByxNPQxPIWNZ2q8/FQBVADDOrAdY+RZFsIUbnPsA0KfSliTurqt7wcn8T9xU
         Q4YaivroUdCkP8AoFbqWF1mEq6csCI2KyG9A+zQyaptX+3WdNEw9aXo05KBvWEb3R8uF
         Nt4zf8RVvWmp86taftzxAhKLS6InxqNBqbPHD6aTc2SZrB20KH77LzyViP2iRkucLfRY
         eXIEYwV+Ex2gAue9PfhhIBF4Wi94A9Bqo3hdvqvcjMW1j9nplvpxsOHfQ0Qpq6qXnC6a
         Kzbg==
X-Gm-Message-State: AOJu0Yx+H4CzH0ZyqUD1hrQwmZmPWX8AhWKY8MF5VwbktXeRkFuBJyRD
        PpCR0IQmyrASv4pA1kshrO6dxw==
X-Google-Smtp-Source: AGHT+IFZigw9WTtZa3PWB9cP0/Oj5BKtjSycL8r9GtOvrOnzFlqtaM025sDupteUqPjUjvRPJWB0pg==
X-Received: by 2002:a5d:58ca:0:b0:31f:f65f:74ac with SMTP id o10-20020a5d58ca000000b0031ff65f74acmr13930500wrf.70.1696930031187;
        Tue, 10 Oct 2023 02:27:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h12-20020a056000000c00b003176aa612b1sm12114160wrx.38.2023.10.10.02.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:27:10 -0700 (PDT)
Date:   Tue, 10 Oct 2023 12:27:07 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     stanley_chang@realtek.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] extcon: add Realtek DHC RTD SoC Type-C driver
Message-ID: <a469dd51-f5d5-4e8f-ba36-6c7cea046fb8@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Stanley Chang,

The patch 8a590d7371f0: "extcon: add Realtek DHC RTD SoC Type-C
driver" from Sep 4, 2023 (linux-next), leads to the following Smatch
static checker warning:

	drivers/extcon/extcon-rtk-type-c.c:905 __updated_type_c_parameter_by_efuse()
	error: 'buf' dereferencing possible ERR_PTR()

drivers/extcon/extcon-rtk-type-c.c
    873 static int __updated_type_c_parameter_by_efuse(struct type_c_data *type_c)
    874 {
    875         struct type_c_cfg *type_c_cfg = type_c->type_c_cfg;
    876         struct cc_param *cc_param;
    877         struct nvmem_cell *cell;
    878         s8 cc1_4p7k = 0;
    879         s8 cc1_12k = 0;
    880         s8 cc1_0p2v = 0;
    881         s8 cc1_0p8v = 0;
    882         s8 cc1_2p6v = 0;
    883         s8 cc1_0p66v = 0;
    884         s8 cc1_1p23v = 0;
    885         s8 cc2_4p7k = 0;
    886         s8 cc2_12k = 0;
    887         s8 cc2_0p2v = 0;
    888         s8 cc2_0p8v = 0;
    889         s8 cc2_2p6v = 0;
    890         s8 cc2_0p66v = 0;
    891         s8 cc2_1p23v = 0;
    892 
    893         cell = nvmem_cell_get(type_c->dev, "usb-cal");
    894         if (IS_ERR(cell)) {
    895                 dev_warn(type_c->dev, "%s failed to get usb-cal: %ld\n",
    896                          __func__, PTR_ERR(cell));
    897         } else {
    898                 unsigned char *buf;
    899                 size_t buf_size;
    900                 int value_size = 4;
    901                 int value_mask = (BIT(value_size) - 1);
    902 
    903                 buf = nvmem_cell_read(cell, &buf_size);
                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This does a variable size allocation.  Not sure how large.  But
allocations need to be checked for failure.

    904 
--> 905                 cc1_0p2v = get_value((buf[0] >> value_size * 0) & value_mask);
                                              ^^^^^^
Or it leads to a crash.

    906                 cc1_0p8v = get_value((buf[0] >> value_size * 1) & value_mask);
    907                 cc1_2p6v = get_value((buf[1] >> value_size * 0) & value_mask);
    908                 cc1_0p66v = get_value((buf[1] >> value_size * 1) & value_mask);
    909                 cc1_1p23v = get_value((buf[2] >> value_size * 0) & value_mask);
    910 
    911                 cc2_0p2v = get_value((buf[3] >> value_size * 0) & value_mask);
    912                 cc2_0p8v = get_value((buf[3] >> value_size * 1) & value_mask);
    913                 cc2_2p6v = get_value((buf[4] >> value_size * 0) & value_mask);
    914                 cc2_0p66v = get_value((buf[4] >> value_size * 1) & value_mask);
    915                 cc2_1p23v = get_value((buf[5] >> value_size * 0) & value_mask);
    916 
    917                 cc1_4p7k = get_value((buf[6] >> value_size * 0) & value_mask);
    918                 cc1_12k = get_value((buf[6] >> value_size * 1) & value_mask);
    919                 cc2_4p7k = get_value((buf[7] >> value_size * 0) & value_mask);
    920                 cc2_12k = get_value((buf[7] >> value_size * 1) & value_mask);
    921 
    922                 kfree(buf);
    923                 nvmem_cell_put(cell);
    924         }
    925 
    926         dev_dbg(type_c->dev, "check efuse cc1_4p7k=%d cc1_12k=%d cc2_4p7k=%d cc2_12k=%d\n",
    927                 cc1_4p7k, cc1_12k, cc2_4p7k, cc2_12k);
    928         dev_dbg(type_c->dev, "check efuse cc1_0p2v=%d cc1_0p8v=%d cc1_2p6v=%d cc1_0p66v=%d cc1_1p23v=%d\n",
    929                 cc1_0p2v, cc1_0p8v, cc1_2p6v, cc1_0p66v, cc1_1p23v);
    930         dev_dbg(type_c->dev, "check efuse cc2_0p2v=%d cc2_0p8v=%d cc2_2p6v=%d cc2_0p66v=%d cc2_1p23v=%d\n",
    931                 cc2_0p2v, cc2_0p8v, cc2_2p6v, cc2_0p66v, cc2_1p23v);
    932 
    933         cc_param = &type_c_cfg->cc1_param;
    934         cc_param->rp_4p7k_code = cc_param->rp_4p7k_code + cc1_4p7k;
    935         cc_param->rp_12k_code = cc_param->rp_12k_code + cc1_12k;
    936 
    937         cc_param->vref_1p23v = cc_param->vref_1p23v + cc1_1p23v;
    938         cc_param->vref_0p66v = cc_param->vref_0p66v + cc1_0p66v;
    939         cc_param->vref_2p6v = cc_param->vref_2p6v + cc1_2p6v;
    940         cc_param->vref_0p8v = cc_param->vref_0p8v + cc1_0p8v;
    941         cc_param->vref_0p2v = cc_param->vref_0p2v + cc1_0p2v;
    942 
    943         cc_param = &type_c_cfg->cc2_param;
    944         cc_param->rp_4p7k_code = cc_param->rp_4p7k_code + cc2_4p7k;
    945         cc_param->rp_12k_code = cc_param->rp_12k_code + cc2_12k;
    946 
    947         cc_param->vref_1p23v = cc_param->vref_1p23v + cc2_1p23v;
    948         cc_param->vref_0p66v = cc_param->vref_0p66v + cc2_0p66v;
    949         cc_param->vref_2p6v = cc_param->vref_2p6v + cc2_2p6v;
    950         cc_param->vref_0p8v = cc_param->vref_0p8v + cc2_0p8v;
    951         cc_param->vref_0p2v = cc_param->vref_0p2v + cc2_0p2v;
    952 
    953         return 0;
    954 }

regards,
dan carpenter
