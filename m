Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95242C4338F
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Aug 2021 14:05:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73CD660E97
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Aug 2021 14:05:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240647AbhHEOFY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Aug 2021 10:05:24 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:36335 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241829AbhHEOEd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Aug 2021 10:04:33 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MvaO8-1n2mGv19JG-00sdeU; Thu, 05 Aug 2021 16:02:39 +0200
Received: by mail-wr1-f50.google.com with SMTP id n12so6726844wrr.2;
        Thu, 05 Aug 2021 07:02:39 -0700 (PDT)
X-Gm-Message-State: AOAM532EFEW8QRavdIayHs5iFht0Ud02FL+B2YTu5izqZFhr6JAvdq2z
        niLS9lPa+YzKGDTMTY6DUEw6ZtSsIR1FecvKApQ=
X-Google-Smtp-Source: ABdhPJx9IZJbvIVNFqSD8EaAMHGmqYjDHcu2Q9CDLbmcwVFlS1Z+L6F23N3gLM/O9axRTpzdv9Z96Atgun6IsSBoIpw=
X-Received: by 2002:adf:f446:: with SMTP id f6mr5663745wrp.361.1628172158975;
 Thu, 05 Aug 2021 07:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210805133213.700-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210805133213.700-1-lukas.bulwahn@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 5 Aug 2021 16:02:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3aNuxaEtAiewd+Wjc8hKtca0NrcV2kykkNC-qKT_HhzQ@mail.gmail.com>
Message-ID: <CAK8P3a3aNuxaEtAiewd+Wjc8hKtca0NrcV2kykkNC-qKT_HhzQ@mail.gmail.com>
Subject: Re: [PATCH] rbtree: remove unneeded explicit alignment in struct rb_node
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Michel Lespinasse <michel@lespinasse.org>,
        Davidlohr Bueso <dbueso@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mete Polat <metepolat2000@gmail.com>,
        Jesper Nilsson <jesper@jni.nu>, Arnd Bergmann <arnd@arndb.de>,
        David Woodhouse <dwmw2@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7XNpPq5iYsHfDhqRQDzw2R1dBZxBT+c/X9okG2p8NNHxdAMg8vo
 GwdMHBo5KUeykq/QODG1hzrZIn44/r7Sr9liqRpP6NE2yq+xPoV5OIp3uI1UVnGePzc69Qr
 z0huAlc1HHm0zTNKmqv43SXpm/rdR/9NC8ligtIjfSyqoJSbvnpmJFNeC9Gb1zZw9HgreMD
 cVm1tS9IARBJKKOkUHiKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9U35q8mwTHc=:HEAcIkqJeRV1goTWeb3CWj
 ifh+qAJCg4lurX9jnewUL/AU0OhDWWwSHUyickjuJsh5D9u9SC+tN6xHTZ/L0tPuxtLaLCWS5
 ODjqKDQWlkS+EVFfw2ngsIA/NrtNtoadLhMzC55C8wzxyJBY+fqabv2inJP1S47GBA98CyAOx
 kP9+Uo99qBEhbYYQ91HSpE8ZUXIm8uPTSTD105MpzDdiL/jMYZCPsPFeXzfahpp0AVJtdF2AC
 qSV4YFAa4eGXkvVAuoYIFR/wBApSHrJmUVMw1A0GW706d7N/P290LBsTBPDPxNy2gPeZgK3sK
 N1rEVZQjfiH2kB1mPgPgeljP3KMOByQqRa6o23efsYXDG6i+yHoL2eM81Lq0qqgletqPoyzSA
 Vk6Fupyo2UMvgdNUE3mXwr0NOCdiq077MOwJkArsDp16nmNjn/8Xk8FZp8zm3R2cpMP6GBX/n
 vxg3qQp0IiecPVVPyTF96cm670qF4o0LRs7dYfCQHFZ2hv5g3My+7Afosw9LMrHJFm7ghrKiv
 0iF5MyXLoTaTbuPwMq+MfVrNPjQWz/vRgJWEh/K49k6I0qoMbPRlThHD+BoVIiO2pLDg9I9IE
 kBx4DR5e7iuCfM2gps3Mq7+MGv3EIA9GqYi7XuBU9DICu8vUVx0bmz8uwzXuqx4Vk2bDm6ARX
 NhrKluUtnj9inG636LCtQqDL7bZDssazQZ3OK0Fduimk+Zr44SUJ216xovlbs3fAnOQOwbH0a
 jfoipDzTlI2t8HbBWXxcXhTyIBwF81W7G1s6A9wxRwjANW5qgSl8xQpnRvOEEzU9vTs1+zhwU
 Rabdu9H6txZCELCTEhz5AE90zZXG7c9vGR6yeifDWWo9CCXSqjhw+ZbV0Lk4bJxhXiijpNj
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 5, 2021 at 3:32 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit e977145aeaad ("[RBTREE] Add explicit alignment to sizeof(long) for
> struct rb_node.") adds an explicit alignment to the struct rb_node due to
> some speciality of the CRIS architecture.
>
> The support for the CRIS architecture was removed with commit c690eddc2f3b
> ("CRIS: Drop support for the CRIS port")
>
> So, remove this now unneeded explicit alignment in struct rb_node as well.
>
> This basically reverts commit e977145aeaad ("[RBTREE] Add explicit
> alignment to sizeof(long) for struct rb_node.").
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Mete Polat <metepolat2000@gmail.com>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210804, but only x86 compile-checked.
>
> Michel, Davidlohr, Jesper, David, please ack.
>
> Mete, you might want to re-run your RBT test suite for this change.
>
> Andrew, once acked, please pick this minor cleanup into your tree.

Do you know why it needed the extra alignment on cris at the time?

The revert would appear to change the alignment to 16 bits instead
of 32 bits on m68k as well (not 8 bits as on cris), but I don't know if that
can cause problems there.

        Arnd
