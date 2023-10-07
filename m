Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24702E95A61
	for <kernel-janitors@archiver.kernel.org>; Sat,  7 Oct 2023 08:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343671AbjJGI6y (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 7 Oct 2023 04:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234173AbjJGI6w (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 7 Oct 2023 04:58:52 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB30BD
        for <kernel-janitors@vger.kernel.org>; Sat,  7 Oct 2023 01:58:49 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c189dabcc3so34033261fa.1
        for <kernel-janitors@vger.kernel.org>; Sat, 07 Oct 2023 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696669128; x=1697273928; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H12pKzlY1qJNaDjNatUY0Tut5bot5lcPr1eF3WZ1ZJs=;
        b=uIhsDVZbPQqPP8pmNp3L2FsekGukrDcHlxtDKClu4IOxTEl3KxBwenfAu7BgZFpS29
         EtDVpr6b4IC5xePMiC+T3CHLohvSedrlE9Xsy6XErY8fJvvwDWo/dNJ2xgsy1Stb6S5z
         /L1hKR/7smt6RbXqMjELRiz6B9etmsGk3vD4QjCJH1MbC3f7LvDUymzQIC01RncTbxsl
         jPAwBiBZRcMsWPmaMuiYF+bJ0kR5Vr6z04OqO65YCHzXwx3ogwkcZSdh2TBj15EVrwch
         HrGhCG3uuHeak0Arl/vGG16xOUp2mdsjtOmoICKcu6izYvdXNFUqF1H50nDWlYqeyCh6
         JN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696669128; x=1697273928;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H12pKzlY1qJNaDjNatUY0Tut5bot5lcPr1eF3WZ1ZJs=;
        b=Q8nF1Y41zoEqI7Nv02wA0JWDYDqrKZ0+TtG8fYa/snSnUGmAxWS22vyu0PcATbTeOw
         kfWpo/xlMeClEHEyluR8q/Znidxm5xNAQH5XWZIP6HlcomOVirxTX2tuipOntsd3lclk
         1qXYDvQLEcS8Ak1MM2npwnP4zHuPxM78HwesSmJxcJSQ8a+gsRoJEbkpxdxmGlDpCQCP
         ru4rl7MAhvr2boJ2onAxtnq9cqLqPX/IZBBWFzDjmBrnfaxNYIFFZYEdX2qptP+QFA+5
         xSzONe8uRjiucRj8CoRgtrDNUwHaBSdHGcGxDhlkMapPR2E70OSikT6JPNW2OJnnddQq
         pUtQ==
X-Gm-Message-State: AOJu0Ywg625v3MJBZzgJjVUhvaz+5Jm2pnSot01iNAr+Sa+JQ984Xkvv
        NaBByHOL3aV0cf2oojCH4EQEcA==
X-Google-Smtp-Source: AGHT+IGuk6sVO7TRt2L2LX7v5qRMZPLQlFwREbRuAKYphYKeiQKSCZE7U+q3uVjRUnBthndq1MxRKQ==
X-Received: by 2002:ac2:5f68:0:b0:502:fe0a:af23 with SMTP id c8-20020ac25f68000000b00502fe0aaf23mr7856529lfc.56.1696669127770;
        Sat, 07 Oct 2023 01:58:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i14-20020a05600c354e00b004068de50c64sm5520658wmq.46.2023.10.07.01.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 01:58:47 -0700 (PDT)
Date:   Sat, 7 Oct 2023 11:58:44 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     masahiroy@kernel.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: liquidio: fix mixed module-builtin object
Message-ID: <512670ff-bdec-487c-9bac-e6b52b4b1a5d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Masahiro Yamada,

The patch f71be9d084c9: "net: liquidio: fix mixed module-builtin
object" from Jun 7, 2023 (linux-next), leads to the following Smatch
static checker warning:

	drivers/net/ethernet/cavium/liquidio/lio_main.c:810 liquidio_watchdog()
	error: NULL dereference inside function 'module_refcount()'.

drivers/net/ethernet/cavium/liquidio/lio_main.c
    800                 disable_all_vf_links(other_oct);
    801                 all_vf_links_are_disabled = true;
    802 
    803 #ifdef CONFIG_MODULE_UNLOAD

This code is old and buggy, but I think it's possibly the recent changes
which make this bug visible.  Modules can be enabled but it doesn't mean
that this particular driver was built as a module.  I think we want to
test #if MODULE as well?

    804                 vfs_mask1 = READ_ONCE(oct->sriov_info.vf_drv_loaded_mask);
    805                 vfs_mask2 = READ_ONCE(other_oct->sriov_info.vf_drv_loaded_mask);
    806 
    807                 vfs_referencing_pf  = hweight64(vfs_mask1);
    808                 vfs_referencing_pf += hweight64(vfs_mask2);
    809 
--> 810                 refcount = module_refcount(THIS_MODULE);
                                                   ^^^^^^^^^^^
This will crash because THIS_MODULE is NULL when it's built in to the
kernel.

    811                 if (refcount >= vfs_referencing_pf) {
    812                         while (vfs_referencing_pf) {
    813                                 module_put(THIS_MODULE);
    814                                 vfs_referencing_pf--;
    815                         }
    816                 }
    817 #endif
    818         }
    819 
    820         return 0;
    821 }

regards,
dan carpenter
