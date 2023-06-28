Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7E0EB64D7
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Jun 2023 12:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbjF1M3b (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 28 Jun 2023 08:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbjF1M3a (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 28 Jun 2023 08:29:30 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5392111
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Jun 2023 05:29:29 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-313f3cd6bb4so3049342f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Jun 2023 05:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687955367; x=1690547367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y+/73Hn30Z9/qFlAesgRRh1yqPTxLtGthW/sft72KEE=;
        b=biTFYwLWFXgAh7bC73xZA1eta3vNuT/uPCAiX3RUNlQIesyL3vayeQoPILYKyl40tz
         +9FZgJhBKE/rS1cQzR3+ZINCITlLUe/3+gMwcQyfDSrNtjPUAU5TmSNfChyxswx1K470
         LmJaEHQY1JzBTMjwd/JOnmDr0IpODglPqCmHxRan+XS8WufyMlY/940g43KyTUXrimPZ
         meLgvWj63vCyxwHMICaM21gOo4ERn2pM4ibk1vQ32sFTuhi1SLY4gzWs341IJ8hafhpv
         jDDeR5URGQNClyuLnr5utfsDLye0WuQX1y01qz98tz8t/V4g5FpiXvgiESfX+9YHwgpQ
         KDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687955367; x=1690547367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+/73Hn30Z9/qFlAesgRRh1yqPTxLtGthW/sft72KEE=;
        b=ivEv26Nq94idrh1jTVSfw5uqEXPbHrUC0lI2udHHccPXw1yeNgXdiPE7tDUfR5W2qT
         BCy50CNclIF9Yi5Lif2QRXhu9VOwROyGgFCXS3G1DSrZlWOGp4BGanw8PV1qVlqOAc1B
         9+V4Z8VvhvDnCWDA6+GVcyjlz4vLAA4IpccnkUZ5jqZKels64LIUZgmPfLs8Wzc5rV6h
         VxY9OVN3MuE0RUFfT32QkbuXdYaV+QoUO3B9QmU+n11ukO63BN664fWrbIXNiewv1WXj
         rU4nnkY5lMXRzR3AQqb0RMhOjzZpuL9khlOM9HLInn1ZSZUpwUCenqvRVWlhyO0kzMUd
         SZGA==
X-Gm-Message-State: AC+VfDyWxl2DJq3RLTR7Cvbow/jRznyBGEYUZt0mkMGA1CrFQVktVLav
        EI9vaNKPgXkDFx0FmeA3fXsXUQ==
X-Google-Smtp-Source: ACHHUZ7Py18273KjWJU/FbRcTvns9S7wOmxcd7KNdChxScd1mSJl7GXIZLWx+YoWuBYMA8dTprdbGQ==
X-Received: by 2002:a05:6000:1292:b0:313:f7da:2b7e with SMTP id f18-20020a056000129200b00313f7da2b7emr5491984wrx.20.1687955367689;
        Wed, 28 Jun 2023 05:29:27 -0700 (PDT)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm13382663wri.73.2023.06.28.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 05:29:27 -0700 (PDT)
Date:   Wed, 28 Jun 2023 14:29:25 +0200
From:   Samuel Ortiz <sameo@rivosinc.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Hongren Zheng <i@zenithal.me>, linux-riscv@lists.infradead.org,
        kernel-janitors@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
        Jiatai He <jiatai2021@iscas.ac.cn>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        LKML <linux-kernel@vger.kernel.org>, linux@rivosinc.com,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Evan Green <evan@rivosinc.com>, Guo Ren <guoren@kernel.org>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko.stuebner@vrull.eu>,
        Stefan O'Rear <sorear@fastmail.com>
Subject: Re: [PATCH 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Message-ID: <ZJwnpTieyeWvEkJ5@vermeer>
References: <20230627143747.1599218-2-sameo@rivosinc.com>
 <97a7d701-3b48-252e-6d78-ef3d0e7f8f03@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97a7d701-3b48-252e-6d78-ef3d0e7f8f03@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 28, 2023 at 01:21:01PM +0200, Markus Elfring wrote:
> …
> > This patch also changes the logical id of
> …
> 
> Does such a wording really fit to the known requirement “Solve only one problem per patch.”?

That comment is inaccurate anyways. I removed it from v2 of the patch
set.

Cheers,
Samuel.


> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.4#n81
> 
> 
> Please choose an imperative change suggestion.
> 
> Regards,
> Markus
