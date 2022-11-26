Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9962C4321E
	for <kernel-janitors@archiver.kernel.org>; Sat, 26 Nov 2022 15:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiKZPRD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 26 Nov 2022 10:17:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiKZPRC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 26 Nov 2022 10:17:02 -0500
Received: from smtp.smtpout.orange.fr (smtp-12.smtpout.orange.fr [80.12.242.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BF917891
        for <kernel-janitors@vger.kernel.org>; Sat, 26 Nov 2022 07:17:00 -0800 (PST)
Received: from [192.168.1.18] ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id ywvJouECjteqGywvJoVFFY; Sat, 26 Nov 2022 16:16:59 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 26 Nov 2022 16:16:59 +0100
X-ME-IP: 86.243.100.34
Message-ID: <dc5a2157-19c8-4498-6288-d7513ad3dde2@wanadoo.fr>
Date:   Sat, 26 Nov 2022 16:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 03/30] irqchip: Use kstrtobool() instead of strtobool()
Content-Language: fr, en-US
To:     Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
 <755c4083122071bb27aa8ed5d98156a07bb63a39.1667336095.git.christophe.jaillet@wanadoo.fr>
 <87wn7hublo.wl-maz@kernel.org>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <87wn7hublo.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 26/11/2022 à 13:46, Marc Zyngier a écrit :
> On Tue, 01 Nov 2022 21:13:51 +0000,
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
>>
>> strtobool() is the same as kstrtobool().
>> However, the latter is more used within the kernel.
>>
>> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
>> the other function name.
>>
>> While at it, include the corresponding header file (<linux/kstrtox.h>)
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> This patch is part of a serie that axes all usages of strtobool().
>> Each patch can be applied independently from the other ones.
>>
>> The last patch of the serie removes the definition of strtobool().
>>
>> You may not be in copy of the cover letter. So, if needed, it is available
>> at [1].
>>
>>
>> This patch has NOT been compile tested.
> 
> Thanks for having the honesty to state that this hasn't been even
> compile tested. However, and for fairly obvious reason, I will not
> take such patches.

Ok, so, with a sucessful:
   sudo apt install libc6-armel-cross libc6-dev-armel-cross 
binutils-arm-linux-gnueabi libncurses5-dev build-essential bison flex 
libssl-dev bc
   sudo apt install gcc-arm-linux-gnueabi g++-arm-linux-gnueabi

   make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi- -j7 allmodconfig

   patch -p1 < strtobool.diff

   make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi- -j7 
./drivers/irqchip/irq-gic.o
   make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi- -j7 
./drivers/irqchip/irq-gic-v3.o

can I make you change your mind?

CJ

> 
> Thanks,
> 
> 	M.
> 

