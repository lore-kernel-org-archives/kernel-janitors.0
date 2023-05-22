Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC52C77B73
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 May 2023 17:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjEVRSg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 May 2023 13:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjEVRSf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 May 2023 13:18:35 -0400
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C6BF4
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 10:18:33 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id 19Azq1MIc0h9k19AzqvahE; Mon, 22 May 2023 19:18:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1684775912;
        bh=RACWwSG+Hb9eOENQpBti3yzC14aelYWu586byj6TxBM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=a55CHq6gXnelkrtko2pskwk2BzcGk8HFsYmXYYrewWPHJ9FmxUM+ZpgWQ6yzods6A
         BEuGjnaLFF1Sa7QvRUD/rb55TxY/BRTJKpy2QKdptb6EBx2R7J9f9+mSwJjWwL6zgH
         BcubzWufdl/IscEzx5iLKm4vY2pAsdtQt9NIF9OLG6xS1W8vOKbvuuSqoIgsOCBjKr
         snVA/owi1puimyOKc7xYxOmvZXoHtMa3KtayKKYiIYl6Ene3wMwM/+0hHcnmAJv5f3
         7fsra+9oLsX0DPOq2hXPRjuahYXL5jy7ArdHLjXvmj3yz6dHwGbXcsL3GeqkGe7DYq
         Gq669Z/75CFeg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 22 May 2023 19:18:32 +0200
X-ME-IP: 86.243.2.178
Message-ID: <59ca8e12-a4ab-7f5b-68ba-fe04683b3cf5@wanadoo.fr>
Date:   Mon, 22 May 2023 19:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net] 3c589_cs: Fix an error handling path in tc589_probe()
Content-Language: fr, en-GB
To:     Simon Horman <simon.horman@corigine.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        netdev@vger.kernel.org
References: <d8593ae867b24c79063646e36f9b18b0790107cb.1684575975.git.christophe.jaillet@wanadoo.fr>
 <ZGthVr9FppjWDA9F@corigine.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <ZGthVr9FppjWDA9F@corigine.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 22/05/2023 à 14:34, Simon Horman a écrit :
> On Sat, May 20, 2023 at 11:48:55AM +0200, Christophe JAILLET wrote:
>> Should tc589_config() fail, some resources need to be released as already
>> done in the remove function.
>>
>> Fixes: 15b99ac17295 ("[PATCH] pcmcia: add return value to _config() functions")
> 
> That commit is probably going back far enough, but I actually
> suspect the problem has been there since the beginning of git history.

In fact, before that commit, the probe was always returning 0, so there 
was no need for an error handling path.

FYI, commit 15b99ac17295 ("[PATCH] pcmcia: add return value to _config() 
functions") messed up many drivers for the same reason.
I sent a few patches to see if there was an interest to fix these 
(really) old drivers, most linked with pcmcia which seems to slowly be 
removed from the kernel.

So I'm a bit unsure if fixing it really matters.
Let see if I collect some other R-b tags for the other patches.

CJ

> 
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> 
> 
> 

