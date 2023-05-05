Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC0BC7EE22
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 May 2023 06:16:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjEEGQL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 May 2023 02:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjEEGQK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 May 2023 02:16:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E190150E3
        for <kernel-janitors@vger.kernel.org>; Thu,  4 May 2023 23:16:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2721D63B54
        for <kernel-janitors@vger.kernel.org>; Fri,  5 May 2023 06:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8018FC433A7
        for <kernel-janitors@vger.kernel.org>; Fri,  5 May 2023 06:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683267368;
        bh=hrper4WhtLjFNY18UGFgjzsA+mCk03IQ4Jteq7M1Jnc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qc1OUzYOL54KzabNb7zVzYcpjXyOq+v6EG5saKsoR7ih6oANfnzED/Xoe0BB6royG
         zklHltMsn7pTqDXVGkyejcrVlh3k6V9UbrfEgxXbwBSdXhLY4WC9noS9I8Z5jfbwYL
         F3HBkJGRyliTSOfTx//LdoHhP+HS5376R+UBBcskXy8Zyv+YB5/LnFIIciXfS3Qx2I
         lmQMqWfOXAWRW4F81ahlxFrN4V7qejrNPvqwLm2r+Z/DDFepy0FmPH+NCg9ejWLXbG
         YrqfTEuonelu2l8klGacDjUJxY0EZe84ar0di4l9Zkr4hkPxLSpjZvg/XS0ov8Q+Cy
         NJN2vz3BxJj2w==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-958bb7731a9so241146066b.0
        for <kernel-janitors@vger.kernel.org>; Thu, 04 May 2023 23:16:08 -0700 (PDT)
X-Gm-Message-State: AC+VfDzZJytOhRQJrR7Z4F+b9Cdf0xWb1c4QwXMcsDHCa52tkndPoT+O
        2+b7TpWyPisOK8sf52WVU8EW0uOZ+56qGFM636A=
X-Google-Smtp-Source: ACHHUZ6RfU0q/eWQU+IF/RV0AY+yhq6TUsivMtMzC8Rgkla6BMNJdv8oIeorZBtaL7imZBSIYYh4jNrIjXnXmgO7NxI=
X-Received: by 2002:a17:907:3f9a:b0:961:be96:b093 with SMTP id
 hr26-20020a1709073f9a00b00961be96b093mr213111ejc.36.1683267366674; Thu, 04
 May 2023 23:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com>
In-Reply-To: <CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com>
From:   Guo Ren <guoren@kernel.org>
Date:   Fri, 5 May 2023 14:15:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRNxex0JBMt21HLeHDKh78e9aBEw81Q3TVyb-=CunSH4Q@mail.gmail.com>
Message-ID: <CAJF2gTRNxex0JBMt21HLeHDKh78e9aBEw81Q3TVyb-=CunSH4Q@mail.gmail.com>
Subject: Re: In-flight collision: ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP renaming
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
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

On Mon, Apr 24, 2023 at 5:40=E2=80=AFPM Lukas Bulwahn <lukas.bulwahn@gmail.=
com> wrote:
>
> Dear Guo Ren, dear Palmer,
>
> on linux-next, I have noticed that you have submitted and added the
> commit a3c7d6b642e4 ("riscv: mm: hugetlb: Enable
> ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP"), that adds the select
> ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP to the RISCV config. As it
> seems, Aneesh Kumar K.V has concurrently renamed this config
> throughout the tree with commit 215218dddd25 ("mm/hugetlb_vmemmap:
> rename ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP"), but your commit was
> not visible to that renaming. When both commits are merged in a common
> tree---as happens with linux-next, and will soon happen with Linus'
> tree, your commit a3c7d6b642e4 will do nothing (select no existing
> config anymore).
>
> It is easy to fix, adjust this one line to the renaming and 'select
> ARCH_WANT_OPTIMIZE_VMEMMAP'. For now, I am just reporting to let you
> know; probably, it is best to get a quick fix-up patch with -rc2, once
> all the changes landed in -rc1.
Thx for taking care; please fix that.

>
>
> Best regards,
>
> Lukas



--=20
Best Regards
 Guo Ren
