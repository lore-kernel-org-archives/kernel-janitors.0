Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A75C7618E
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Apr 2023 09:40:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjDXJkt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Apr 2023 05:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjDXJks (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Apr 2023 05:40:48 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D7F2D4A
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Apr 2023 02:40:38 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-959a3e2dd27so151969966b.3
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Apr 2023 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682329237; x=1684921237;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LujyabMpn2d5pNDJ/5qq2RowvsHuvRO01dfnOaHAMfg=;
        b=frFI24846pDpSPiJXrXJWh0bSaphVNclGAdPzueexxmWH8+yY7UV/8yXAdIi9gZiHY
         GmIsCBOnXOZXeAdVk6Iu6anv1IOnarQ6139Y7rU0ac+PIDoADUnEhR2q3aYZ86LUfPLn
         QRqUu0Et/+qXSLA6w/X7zwRK6KSKpJgPsvV6iaj4E9PUKBD4BD7obUH9RQPP5HK6EFDu
         XCo7zuU/V1xfxXRjOoY0CkHFCmr/qbYQ4q7g1vSB/h1GaMhj8PVYZx4f3rG1Hi0kAvRd
         XpITk7F/cngYDl17a98ZKGO3oOd4ee1RY57qe2mJ+ipWfD6zSifzDwik8RfEy+3xRmrB
         ThlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682329237; x=1684921237;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LujyabMpn2d5pNDJ/5qq2RowvsHuvRO01dfnOaHAMfg=;
        b=CGoo734mkQ3UoGAEr8CG86609X/W9a/E/eexZ//jUNC46eyRj81yCMsJK51FvexCma
         qGdzJnp47Gz9KFgRpvRxtD1mqbEZpzoXMDU6AldkSQ57pMhu8pAdfWjtbqOYi6NtzjA9
         vFbxy4eJcVCN/5sG0rQGVQJNCK9xXG0aDSNoUcZ6VSoktjbGduXMjoNKg14pXn9vkgca
         dbCUVQ3HZqJN+RCgbqYTTDl1U037rwNkUNaNFjcAPWvKL6fsQp5GpkUy1tWYUC4JHO+Y
         KL25UrGBvDEr7dsXeFCePYMlLZS2zZeAe7PtDLsPA8RSANZ2yL9ZuQZZBPNIERdMMquG
         nsHQ==
X-Gm-Message-State: AAQBX9fVr0lsWfxK1qdjfetcmYrGTvUC0g4lrGMjlipi9gM1sVv6RB9S
        1IIoSLZeM1q7gSbFTKUbXvGaDLV2VXjf9LTZkLc=
X-Google-Smtp-Source: AKy350ZUTIn8HTpY0mszT227QXjYxn5o4V65d2N3WGOhz/k1yNV382n3FiHO5GiwIz3+ss8Gt1HiTwVUcs0ybOCGnug=
X-Received: by 2002:a17:906:aada:b0:94a:8ead:c7f with SMTP id
 kt26-20020a170906aada00b0094a8ead0c7fmr8984862ejb.23.1682329236945; Mon, 24
 Apr 2023 02:40:36 -0700 (PDT)
MIME-Version: 1.0
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Mon, 24 Apr 2023 11:40:25 +0200
Message-ID: <CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com>
Subject: In-flight collision: ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP renaming
To:     Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        linux-riscv@lists.infradead.org, Linux-MM <linux-mm@kvack.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>
Cc:     Muchun Song <songmuchun@bytedance.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dear Guo Ren, dear Palmer,

on linux-next, I have noticed that you have submitted and added the
commit a3c7d6b642e4 ("riscv: mm: hugetlb: Enable
ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP"), that adds the select
ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP to the RISCV config. As it
seems, Aneesh Kumar K.V has concurrently renamed this config
throughout the tree with commit 215218dddd25 ("mm/hugetlb_vmemmap:
rename ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP"), but your commit was
not visible to that renaming. When both commits are merged in a common
tree---as happens with linux-next, and will soon happen with Linus'
tree, your commit a3c7d6b642e4 will do nothing (select no existing
config anymore).

It is easy to fix, adjust this one line to the renaming and 'select
ARCH_WANT_OPTIMIZE_VMEMMAP'. For now, I am just reporting to let you
know; probably, it is best to get a quick fix-up patch with -rc2, once
all the changes landed in -rc1.


Best regards,

Lukas
