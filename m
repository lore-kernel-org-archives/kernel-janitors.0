Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79224C433F5
	for <kernel-janitors@archiver.kernel.org>; Sat, 18 Sep 2021 09:42:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F42760F6C
	for <kernel-janitors@archiver.kernel.org>; Sat, 18 Sep 2021 09:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242169AbhIRJnm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 18 Sep 2021 05:43:42 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:37023 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241035AbhIRJnm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 18 Sep 2021 05:43:42 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MTANt-1mK9701lmR-00UYMC; Sat, 18 Sep 2021 11:42:17 +0200
Received: by mail-wr1-f43.google.com with SMTP id x6so19159879wrv.13;
        Sat, 18 Sep 2021 02:42:17 -0700 (PDT)
X-Gm-Message-State: AOAM533jnJIcH+3ryCS+tLAA1esDpPZqzEfk4e3a9gSV/2DdlofrDPp1
        WhbKi/4mAH0SHYVcQSHr8E2XvJGjiV6cyPIn3Ig=
X-Google-Smtp-Source: ABdhPJxOTRhwnweDX3x9m+r1bO3Ej/hbtqdpKs97FHH8vQkjZVo5XvP0r2/Q2sqCW5InspIuMtw1ABFi5lhtbVdPvW4=
X-Received: by 2002:adf:c10b:: with SMTP id r11mr17199913wre.336.1631958137049;
 Sat, 18 Sep 2021 02:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <590154f2ab113088346ae76c3f13f8b1cbebccbb.1631942274.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <590154f2ab113088346ae76c3f13f8b1cbebccbb.1631942274.git.christophe.jaillet@wanadoo.fr>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 18 Sep 2021 11:42:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3umbVdPv1omKd5p1gH3JzUEB_MJrK0xQmXok8iSY_haA@mail.gmail.com>
Message-ID: <CAK8P3a3umbVdPv1omKd5p1gH3JzUEB_MJrK0xQmXok8iSY_haA@mail.gmail.com>
Subject: Re: [PATCH v2] misc: genwqe: Remove usage of the deprecated
 "pci-dma-compat.h" API
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Frank Haverkamp <haver@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        gregkh <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:pjpwytd8PrGqU2IIAAKQReoe1IxNveszuMTvnCsZuSKYcvkSI0C
 52nyF68qelzPQNi9c4sqtKsJdruHShN64eMtC2GwdDnUwo2x9t22ruhH4HiGz3GtfWc1cSm
 uBEDt/24JQDeB2AjElA7ZsJ3+quu+Rlg/2Q0emWNVY1HHP+bpTDuIiPVcAqqQMau3kYaq69
 zQrYmkndkPY+zaGA3jGlw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fqtXNmgupR0=:OjzA8FQsD4hJoDfkSNpc+W
 JOKtitgaAtjWoKQtytpjMrZzAZqOpunW5xjHT5kFA3aQbG2AGT59LiGHNXD6tLhOfr0pPi9jT
 9J6kXjzxdHH/1xo6Rbm2iYKhO2vsJymOmg8mmyLuzi52Rq/tShYpBXqOFeL16StEzX5c8ckX6
 GUwrbqiHAbf51wUc6VSzmM3EciBmrnbO6l8s5A8iTmF3QIiMLxiHS/vw7UJAKsgFZXiFS6hLE
 q1T1aMC2ddJQxnAukPHsc9aaUM+D7+BipFrpmEFp4kRovcDPBkKSzvkmfAJ3K/hv91wUtki9P
 fOozrEmbHctFZl8Ke0U3sT1Zo9bq8O4OV8ARtvW9CtXVFw9J+wJdekfxznU1Rix7zS8BD3fAy
 cRGNOHAijxuOrb+PGI+jE/v8IweRKfftGj5xxQdDlicijZRlXcPcj3O2i7sJP8gZ0hGa4XYoL
 DZItuvm4IW+wXgcWwUiRN4/uquJIOrKmwHUhmSiDMNyJuG2Hu7gqRGNFNcKTjFZ0MF4aR3GlJ
 sce6hVnAuShLICyA3CdLjpBwxpNmaUhVqyY1bqO+cYckoJvX5D4haAP7BTT58xxYMnBTvwMfm
 mIQs4UOAgRRQLO7ZDX8NMVYk9B5vDuu5yAy44GkMZWD/0E69dCRtzwHi1pCGKMkX/2vqRmMAV
 PqVfmqToBIx5UY9Mt7DK0bbOoT5jPO8oSHmgYRBFYh3WRXTrsq9T+e6JwKhv6a97JI+X7Twcm
 0P5joSKq19btKvhlcCSKOjM+48gAgJV3ELfwexaUlPoSTbVQUDjY/ncVuMTKv9QdToFwisCEc
 zPa2Df4E63vfMKVyzIPIpbyA56zTh8Vj3qU+k2xPt0wjizwKRhZXYg+FALUTV7K3YeejozhTU
 qi0Z6mmgdDJ9ML3Du1sQ==
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Sep 18, 2021 at 7:20 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> In [1], Christoph Hellwig has proposed to remove the wrappers in
> include/linux/pci-dma-compat.h.
>
> Some reasons why this API should be removed have been given by Julia
> Lawall in [2].
>
> Finally, Arnd Bergmann reminded that the documentation was updated 11 years
> ago to only describe the modern linux/dma-mapping.h interfaces and mark the
> old bus-specific ones as no longer recommended, see commit 216bf58f4092
> ("Documentation: convert PCI-DMA-mapping.txt to use the generic DMA API").
...
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

How much is left now overall? Are you getting close enough that the
remaining patches to remove the header can be done as a short series and
merged through Andrew's -mm tree?

       Arnd
