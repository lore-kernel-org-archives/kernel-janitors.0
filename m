Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBD3C432BE
	for <kernel-janitors@archiver.kernel.org>; Sun, 29 Aug 2021 08:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93D7B60E94
	for <kernel-janitors@archiver.kernel.org>; Sun, 29 Aug 2021 08:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234785AbhH2ICD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 29 Aug 2021 04:02:03 -0400
Received: from pegase2.c-s.fr ([93.17.235.10]:41675 "EHLO pegase2.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232155AbhH2ICC (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 29 Aug 2021 04:02:02 -0400
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4Gy5Vr4nytz9sVn;
        Sun, 29 Aug 2021 10:01:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8bMiWTobom5H; Sun, 29 Aug 2021 10:01:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4Gy5Vr3pKlz9sVH;
        Sun, 29 Aug 2021 10:01:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 63E878B767;
        Sun, 29 Aug 2021 10:01:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id uyQ1It10e89s; Sun, 29 Aug 2021 10:01:08 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id D4BB68B763;
        Sun, 29 Aug 2021 10:01:07 +0200 (CEST)
Subject: Re: [PATCH] net: spider_net: switch from 'pci_' to 'dma_' API
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kou.ishizaki@toshiba.co.jp, geoff@infradead.org,
        davem@davemloft.net, kuba@kernel.org
Cc:     netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <60abc3d0c8b4ef8368a4d63326a25a5cb3cd218c.1630094078.git.christophe.jaillet@wanadoo.fr>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <90220a35-bd0a-ccf3-91b1-c2a459c447e7@csgroup.eu>
Date:   Sun, 29 Aug 2021 10:01:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <60abc3d0c8b4ef8368a4d63326a25a5cb3cd218c.1630094078.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



Le 27/08/2021 à 21:56, Christophe JAILLET a écrit :
> ---
> It has *not* been compile tested because I don't have the needed
> configuration or cross-compiler. However, the modification is completely
> mechanical and done by coccinelle.

All you need is at https://mirrors.edge.kernel.org/pub/tools/crosstool/

Christophe
