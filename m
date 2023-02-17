Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EF1C05027
	for <kernel-janitors@archiver.kernel.org>; Fri, 17 Feb 2023 19:22:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjBQTWh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 17 Feb 2023 14:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjBQTWh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Feb 2023 14:22:37 -0500
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520F3498BF
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Feb 2023 11:22:35 -0800 (PST)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id T6JUpa4e6ar8pT6JUpIrbc; Fri, 17 Feb 2023 20:22:33 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 17 Feb 2023 20:22:33 +0100
X-ME-IP: 86.243.2.178
Message-ID: <b998acdd-ed64-9b3b-0897-dfe13e9d57d3@wanadoo.fr>
Date:   Fri, 17 Feb 2023 20:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] KVM: Reorder fields in 'struct kvm_mmu_memory_cache'
To:     Sean Christopherson <seanjc@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, kvm@vger.kernel.org,
        Mathias Krause <minipli@grsecurity.net>
References: <f9423a6ee10d91bd6bad32beefd1b96cad4d28f1.1676620879.git.christophe.jaillet@wanadoo.fr>
 <Y++uHlQz7OEOzojb@google.com>
Content-Language: fr, en-US
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <Y++uHlQz7OEOzojb@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 17/02/2023 à 17:41, Sean Christopherson a écrit :
> On Fri, Feb 17, 2023, Christophe JAILLET wrote:
>> Group some variables based on their sizes to reduce hole and avoid padding.
>> On x86_64, this shrinks the size from 40 to 32 bytes.
> 
> Heh, a hair too late[*].  Unless I'm mistaken, Mathias will be sending a new
> version in the not-too-distant future.
> 
> Thanks!
> 
> [*] https://lore.kernel.org/all/Y+puefrgtqf430fs@google.com
> 

Ok, great :)

Thanks for the feed-back.

CJ
