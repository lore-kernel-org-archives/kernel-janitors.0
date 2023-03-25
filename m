Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53C2C6FD1C
	for <kernel-janitors@archiver.kernel.org>; Sat, 25 Mar 2023 11:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbjCYLIi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 25 Mar 2023 07:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbjCYLIg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 25 Mar 2023 07:08:36 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA4C6B77D
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Mar 2023 04:08:35 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id x3so17272178edb.10
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Mar 2023 04:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679742514;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zJj1LSPaYk41ko5uT1au1gD7jweEsRNoLsEw/pT8LE=;
        b=cf6F/CvGU6ogQBZDegs7IpW4+hRVVAGGp2Psg2iDHS8xCtxXEgzN4aGdRxkBHmUus2
         jBtlP4rl2o0zq/uYOOwr+qS+TNExIspiafOFikeLZcqXsVkB85w9GFteIcfVWfvoS15L
         v1BnsJ+/1X9TfGnu8fwbgzZRD3Mog9r6xfNz0QEh1HX8Ugg0giiUZ0VOl/RFjPWF95vG
         m36HGAzCre6hA8x8I77MD2cL/JYhGm3okdxaEpDUfV3dilwUj0csASfK//GlkgTb8C//
         WyihgVw2Csh8+ng9CgPmRU/BYTatTierb7ZM0jZgfiNC195fCv0yRXb4rojGhB5ryfSa
         CYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742514;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zJj1LSPaYk41ko5uT1au1gD7jweEsRNoLsEw/pT8LE=;
        b=59OLWI4xTs6Vsxi4wWdDia2g/MqsHZVx4qhuKU6ceJFSa6sWMmdm3VxzrCRhpwfPpV
         0Wvw9XStQy+5AWR2dm/uQJ9HJlcfjtyW4Dh7MF0tHHmlOU0lphSA80KJoLBTAfAZZfcw
         mRyL4Tme9XOCHTUjG81TSuJL1bLwgyUF+0sWSh8Lc7cjzQl8WFOZ8KLCb8xe9+ogiLho
         96fFFz6YxD91iKPSTM/PE8gECH46ptK1CpRUVPkGbmzAxnyB3pZJZrF/gt4u2gNGcCDC
         0eMULGtYGH/DNmQhnqmalFS0n8enkv/nrsP4F26uGTUGRDT/THu4p4qkk/WAbhXRVbaS
         GdIQ==
X-Gm-Message-State: AAQBX9ftAkvd9fYJ+yWBIlTSrn/T6qeOdSdl06rJgrdJ3+jPOG2w16No
        9W4DNC1JHYptTkQd4wU4KkUD8SPl8yUUJg==
X-Google-Smtp-Source: AKy350afxJqYhd/5GR4gmF2FFK5fVI/O1xTxIE3PcHghyhipZzkb+hZlbb6k17zKdYcqGDbyZ8eSeQ==
X-Received: by 2002:a17:906:8c7:b0:922:6bde:2530 with SMTP id o7-20020a17090608c700b009226bde2530mr5705513eje.32.1679742514279;
        Sat, 25 Mar 2023 04:08:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709065f8a00b0092595899cfcsm11615676eju.53.2023.03.25.04.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 04:08:33 -0700 (PDT)
Date:   Sat, 25 Mar 2023 14:08:10 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     rick.p.edgecombe@intel.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] x86: Add PTRACE interface for shadow stack
Message-ID: <90af27cc-6c9d-4fb9-be3b-fc4ef378766d@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Rick Edgecombe,

The patch d84e6ee122e5: "x86: Add PTRACE interface for shadow stack"
from Mar 18, 2023, leads to the following Smatch static checker
warning:

	arch/x86/kernel/fpu/regset.c:234 ssp_set()
	error: uninitialized symbol 'user_ssp'.

arch/x86/kernel/fpu/regset.c
    212 int ssp_set(struct task_struct *target, const struct user_regset *regset,
    213             unsigned int pos, unsigned int count,
    214             const void *kbuf, const void __user *ubuf)
    215 {
    216         struct fpu *fpu = &target->thread.fpu;
    217         struct xregs_state *xsave = &fpu->fpstate->regs.xsave;
    218         struct cet_user_state *cetregs;
    219         unsigned long user_ssp;
    220         int r;
    221 
    222         if (!cpu_feature_enabled(X86_FEATURE_USER_SHSTK) ||
    223             !ssp_active(target, regset))
    224                 return -ENODEV;
    225 
    226         r = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &user_ssp, 0, -1);
                                              ^^^^^
"count" can be zero.  It comes from the user in ptrace_request().

ptrace_request()
-> ptrace_regset()
   -> copy_regset_from_user()
      -> ssp_set()

    227         if (r)
    228                 return r;
    229 
    230         /*
    231          * Some kernel instructions (IRET, etc) can cause exceptions in the case
    232          * of disallowed CET register values. Just prevent invalid values.
    233          */
--> 234         if (user_ssp >= TASK_SIZE_MAX || !IS_ALIGNED(user_ssp, 8))
                    ^^^^^^^^
Leading to an uninitialized variable here.

    235                 return -EINVAL;
    236 
    237         fpu_force_restore(fpu);
    238 
    239         cetregs = get_xsave_addr(xsave, XFEATURE_CET_USER);
    240         if (WARN_ON(!cetregs)) {
    241                 /*
    242                  * This shouldn't ever be NULL because shadow stack was
    243                  * verified to be enabled above. This means
    244                  * MSR_IA32_U_CET.CET_SHSTK_EN should be 1 and so
    245                  * XFEATURE_CET_USER should not be in the init state.
    246                  */
    247                 return -ENODEV;
    248         }
    249 
    250         cetregs->user_ssp = user_ssp;
    251         return 0;
    252 }

regards,
dan carpenter
