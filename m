Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCFBC43460
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 05:45:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADFB361409
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 05:45:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhEJFq6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 May 2021 01:46:58 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:50750 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbhEJFqW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 01:46:22 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d29 with ME
        id 2tlG2500C21Fzsu03tlHlq; Mon, 10 May 2021 07:45:17 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 10 May 2021 07:45:17 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [RFC 1/2] rtc: max77686: use symbolic error messages
To:     Julia Lawall <julia.lawall@inria.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>,
        kernel-janitors@vger.kernel.org
References: <20210509004112.421100-1-eantoranz@gmail.com>
 <20210510043044.GN1955@kadam>
 <alpine.DEB.2.22.394.2105100704070.3126@hadrien>
From:   Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <e9862151-430d-1c02-d28f-49a1437ab1fb@wanadoo.fr>
Date:   Mon, 10 May 2021 07:45:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2105100704070.3126@hadrien>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Le 10/05/2021 à 07:06, Julia Lawall a écrit :
> Any idea what %i is?  Does it actually exist?

%i = %d
(https://elixir.bootlin.com/linux/v5.13-rc1/source/lib/vsprintf.c#L2592)

CJ


> julia
