Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9322DC433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 05:31:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6610E61430
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 05:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhEJFcV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 May 2021 01:32:21 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:31887 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhEJFcU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 01:32:20 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d29 with ME
        id 2tXE2500821Fzsu03tXErZ; Mon, 10 May 2021 07:31:15 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 10 May 2021 07:31:15 +0200
X-ME-IP: 86.243.172.93
Subject: Re: new TODO list item
From:   Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Christoph Hellwig <hch@infradead.org>,
        kernel-janitors@vger.kernel.org
References: <20200421081257.GA131897@infradead.org>
 <d9e3c0f2-a2ea-a279-9df4-0c8a908bba14@wanadoo.fr>
 <df8bd5f1-fdd0-97be-4fc7-d003faf83af6@wanadoo.fr>
Message-ID: <a03fae1f-3362-e702-a8ee-22041c4a70e5@wanadoo.fr>
Date:   Mon, 10 May 2021 07:31:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <df8bd5f1-fdd0-97be-4fc7-d003faf83af6@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  Le 21/04/2020 à 10:12, Christoph Hellwig a écrit :
 > Hi Janitors,
 >
 > if someone feels like helping with a fairly trivial legacy API, the
 > wrappers in include/linux/pci-dma-compat.h should go away.  This is
 > mostly trivially scriptable, except for dma_alloc_coherent, where
 > the GFP_ATOMIC passed by pci_alloc_consistent should usually be replaced
 > with GFP_KERNEL when not calling from an atomic context.
 >

  Hi,
  just a small update on the work on progress:

  https://elixir.bootlin.com/linux/v5.8/A/ident/pci_alloc_consistent
      --> 88 files
  https://elixir.bootlin.com/linux/v5.9/A/ident/pci_alloc_consistent
      --> 62 files
  https://elixir.bootlin.com/linux/v5.10-rc1/A/ident/pci_alloc_consistent
      --> 32 files
  https://elixir.bootlin.com/linux/v5.11-rc1/A/ident/pci_alloc_consistent
      --> 20 files
  https://elixir.bootlin.com/linux/v5.12-rc1/A/ident/pci_alloc_consistent
      --> 12 files
  https://elixir.bootlin.com/linux/v5.13-rc1/A/ident/pci_alloc_consistent
      --> 6 files (4 in drivers/message/fusion)

  https://elixir.bootlin.com/linux/v5.8/A/ident/pci_zalloc_consistent
      --> 26 files
  https://elixir.bootlin.com/linux/v5.9/A/ident/pci_zalloc_consistent
      --> 19 files
  https://elixir.bootlin.com/linux/v5.10-rc1/A/ident/pci_zalloc_consistent
      --> 11 files
  https://elixir.bootlin.com/linux/v5.11-rc1/A/ident/pci_zalloc_consistent
      --> 4 files
  https://elixir.bootlin.com/linux/v5.12-rc1/A/ident/pci_zalloc_consistent
      --> 3 files
  https://elixir.bootlin.com/linux/v5.13-rc1/A/ident/pci_zalloc_consistent
      --> 1 file

So, I hope that this job will be finished for the next -rc.


However, any help for 'drivers/message/fusion' would be appreciated.

My strategy to check all callers to be sure that GFP_KERNEL or 
GFP_ATOMIC is fine doesn't work well here.
Someone with a more global view of this (huge) driver would help a lot.

Also, at the beginning, I planned only to make the 
pci_[z]alloc_consistent part. So now that is it mostly done, if anyone 
feel like looking at the other conversions, it should be only some 
mechanical stuff.

CJ
