Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B539C433B4
	for <kernel-janitors@archiver.kernel.org>; Sat,  8 May 2021 18:47:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF99D613ED
	for <kernel-janitors@archiver.kernel.org>; Sat,  8 May 2021 18:47:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhEHSsc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 8 May 2021 14:48:32 -0400
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:52298 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhEHSs3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 8 May 2021 14:48:29 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d13 with ME
        id 2JnS2500421Fzsu03JnSLF; Sat, 08 May 2021 20:47:26 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 08 May 2021 20:47:26 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH] ACPI: scan: Fix a memory leak in an error handling path
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
References: <63bf4e87eb42fa3fff2cd87eb605ebcc01f4b2f7.1620458525.git.christophe.jaillet@wanadoo.fr>
 <CAOc6etbPaPOjdcfYBY1i_N0V6Tua9p-OL5Hw7PgJ6T7dfRrhfA@mail.gmail.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <2d1269d8-89e4-684c-2a6e-63cf047b8c1a@wanadoo.fr>
Date:   Sat, 8 May 2021 20:47:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAOc6etbPaPOjdcfYBY1i_N0V6Tua9p-OL5Hw7PgJ6T7dfRrhfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 08/05/2021 à 16:50, Edmundo Carmona Antoranz a écrit :
> On Sat, May 8, 2021 at 1:23 AM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>>
>> If 'acpi_device_set_name()' fails, we must free
>> 'acpi_device_bus_id->bus_id' or there is a (potential) memory leak.
> 
> This is a question about the style used in kernel. This function
> (acpi_device_add) initializes acpi_device_bus_id and it could also
> initialize acpi_device_bus_id->bus_id and any of those might fail. And
> they will have to be freed if they are initialized and so on. I see
> that there are kfrees used for them in different places before using a
> goto err_unlock; I wonder if it is accepted practice to avoid doing
> these kfrees and have them in a single place instead, something like:
> 
> err_onlock:
>      if (acpi_device_bus_id) {
>          if (acpi_device_bus_id->bus_id)
>              kfree(acpi_device_bus_id->bus_id);
>          kfree(acpi_device_bus_id);
>      }
>      mutex_unlock(&acpi_device_lock);
> .
> .
> .
> 
> Thanks in advance.
> 

Yes, usually, the preferred style is to have a error handling path which 
releases all that need to be released.
This is more future proof and usually more readable.

In this particular case, I don't think it would be a good idea because 
there are several different error handling pathd and it would look like 
spaghetti code.

First in your example, acpi_device_bus_id should be set to NULL in the 
declaration of this variable.

But, it is likely that the kfree and kfree_cont are not needed after the 
list_add_tail around line 707.


So, leaving these small pieces of resources freeing where they are now 
looks, IMHO, easier to understand.

But, as you say, it is sometimes a matter of taste, and if someone can 
propose something that is straightforward, it would be welcomed, I guess.

CJ
