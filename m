Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4DDC4332F
	for <kernel-janitors@archiver.kernel.org>; Sun, 27 Nov 2022 14:45:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiK0Op2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 27 Nov 2022 09:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiK0Op1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 27 Nov 2022 09:45:27 -0500
Received: from smtp.smtpout.orange.fr (smtp-12.smtpout.orange.fr [80.12.242.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C79EC758
        for <kernel-janitors@vger.kernel.org>; Sun, 27 Nov 2022 06:45:26 -0800 (PST)
Received: from [192.168.1.18] ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id zIuHonJ77ap0YzIuIofEV6; Sun, 27 Nov 2022 15:45:23 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 27 Nov 2022 15:45:23 +0100
X-ME-IP: 86.243.100.34
Message-ID: <d2df2462-518e-4085-57de-5bacd621a3a2@wanadoo.fr>
Date:   Sun, 27 Nov 2022 15:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] 9p: Remove some unneeded #include
To:     Christian Schoenebeck <linux_oss@crudebyte.com>,
        Eric Van Hensbergen <ericvh@gmail.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        v9fs-developer@lists.sourceforge.net
References: <3d1e0ed9714eaee7e18d9f5b0b4bfa49b00b286d.1669553950.git.christophe.jaillet@wanadoo.fr>
 <16697035.zmtlf8e6Si@silver>
Content-Language: fr
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <16697035.zmtlf8e6Si@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 27/11/2022 à 15:07, Christian Schoenebeck a écrit :
> On Sunday, November 27, 2022 1:59:25 PM CET Christophe JAILLET wrote:
>> The 9p fs does not use IDR or IDA functionalities. So there is no point in
>> including <linux/idr.h>.
>> Remove it.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
> 
> Right, it's used by net/9p/client.c only. Probably some more files in net/9p
> could therefore be deflated as well. Anyway:
> 
> Reviewed-by: Christian Schoenebeck <linux_oss@crudebyte.com>
> 
> 

Hi,
i was unsure if net/9p and fs/9p should be patched at the same time or not.

I'll send another patch for net/9p.

CJ

