Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19261C77B7F
	for <kernel-janitors@archiver.kernel.org>; Mon,  8 May 2023 04:53:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjEHExP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 8 May 2023 00:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbjEHExO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 May 2023 00:53:14 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F221086B4
        for <kernel-janitors@vger.kernel.org>; Sun,  7 May 2023 21:53:10 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-965e93f915aso544638766b.2
        for <kernel-janitors@vger.kernel.org>; Sun, 07 May 2023 21:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683521589; x=1686113589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj282JyJVQUgRutNdXOQYurEIFEN0tNVyi4CZOQ3wIM=;
        b=G/3XOrDA/b6w37PRj/w1YQKfSatKaHvpnfAp9lE9NyC61Q36cK+VV9xC6ev1D3boZY
         D2ORv2EjmUiGKqkpi73/IUbMglDluyQuc3km+gVAAqmH/OdXNlqKOCINb06cdW6JK1Pg
         60ENB4zGDGAFuFnp1bTVht5+V4tUQMS1IpEswdNj6KW8btKwrEfF73FEou7F3WzGV87y
         jqe1EcqKFsHYZtA0gvuIJSoD/cMnH/jVTiUfjY7vTDgF/we/cgsGZwVwUhd6WdSp/jL7
         mQlDwCCGKBD9eKKHDhtix6o8xGAXTm8GJQdx1Wxw0iqMlqL1KsRi5TZPiSUDt61SNfK7
         YpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683521589; x=1686113589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj282JyJVQUgRutNdXOQYurEIFEN0tNVyi4CZOQ3wIM=;
        b=ZvpQiMacJtNEH34DNJXvXBPLi6ddM/zzRFm2vtV0X/B50KgzE/UFBxM7n84cjlfZ2j
         +b7HppmBqqvZFkVm+DvHWOYgjd3qpd/XFFEuohUPCayynPn1wglU8q5pWqSQ0cY3td1O
         JxQXKEGbSJRHVdFPwezmzrx35kLJUrWm12WBF5Ii3QY+GICEP2mb1UBCwNZsMzY1gNRP
         daylQayysJdcHeVKtPLXd4gId40DpHW+wcYPkUxKYC9IxFLVvb4mWQey96SF3Jmg4NGy
         M+XyJqU+vIbyk28xX8QWNc/XImU9BAp49W9AnW5RFy9tAzY+VYSdorzLprJTN4B+Xu34
         hyTQ==
X-Gm-Message-State: AC+VfDwJl3s7OOw6+7WMxyaLrNk2DnXYuq3bkzjGB2lEQQmEZRF1bVyG
        0Jx995dSybooHoBTeC51Lo/6SYzPeAd9LdT+so4=
X-Google-Smtp-Source: ACHHUZ6BwAPhomteCeBltcZmEsbA/mGMQbj0BYwkXjY/2amuBNCqHy5iRGTfDOHRx3rr1LiNDsIKhORiWyAsJrJ4uRg=
X-Received: by 2002:a17:907:31c9:b0:94f:6627:22b5 with SMTP id
 xf9-20020a17090731c900b0094f662722b5mr7060809ejb.47.1683521589347; Sun, 07
 May 2023 21:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com>
 <CAJF2gTRNxex0JBMt21HLeHDKh78e9aBEw81Q3TVyb-=CunSH4Q@mail.gmail.com>
In-Reply-To: <CAJF2gTRNxex0JBMt21HLeHDKh78e9aBEw81Q3TVyb-=CunSH4Q@mail.gmail.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Mon, 8 May 2023 06:52:58 +0200
Message-ID: <CAKXUXMwgmFTB5dxcGBWMnJjHS5jB+PXxTm2GEG7bezyqD=cbSA@mail.gmail.com>
Subject: Re: In-flight collision: ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP renaming
To:     Guo Ren <guoren@kernel.org>
Cc:     Guo Ren <guoren@linux.alibaba.com>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        linux-riscv@lists.infradead.org, Linux-MM <linux-mm@kvack.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 5, 2023 at 8:16=E2=80=AFAM Guo Ren <guoren@kernel.org> wrote:
>
> On Mon, Apr 24, 2023 at 5:40=E2=80=AFPM Lukas Bulwahn <lukas.bulwahn@gmai=
l.com> wrote:
> >
> > Dear Guo Ren, dear Palmer,
> >
> > on linux-next, I have noticed that you have submitted and added the
> > commit a3c7d6b642e4 ("riscv: mm: hugetlb: Enable
> > ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP"), that adds the select
> > ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP to the RISCV config. As it
> > seems, Aneesh Kumar K.V has concurrently renamed this config
> > throughout the tree with commit 215218dddd25 ("mm/hugetlb_vmemmap:
> > rename ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP"), but your commit was
> > not visible to that renaming. When both commits are merged in a common
> > tree---as happens with linux-next, and will soon happen with Linus'
> > tree, your commit a3c7d6b642e4 will do nothing (select no existing
> > config anymore).
> >
> > It is easy to fix, adjust this one line to the renaming and 'select
> > ARCH_WANT_OPTIMIZE_VMEMMAP'. For now, I am just reporting to let you
> > know; probably, it is best to get a quick fix-up patch with -rc2, once
> > all the changes landed in -rc1.
> Thx for taking care; please fix that.
>

Just for the record:

Conor Dooley sent a patch after the merge of the two trees, addressing
the issue. This patch is included in v6.4-rc1 as commit 26b0812f4cf8
("RISC-V: fixup in-flight collision with ARCH_WANT_OPTIMIZE_VMEMMAP
rename")

So, the issue is resolved.

Lukas
