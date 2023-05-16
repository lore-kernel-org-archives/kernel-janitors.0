Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DC7C77B75
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 May 2023 01:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjEPBfu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 May 2023 21:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjEPBft (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 May 2023 21:35:49 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 02A94E58;
        Mon, 15 May 2023 18:35:47 -0700 (PDT)
Received: from [172.30.38.103] (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 06F4118011E9F5;
        Tue, 16 May 2023 09:35:37 +0800 (CST)
Message-ID: <804e0736-ca51-39a2-b045-adafa9646c01@nfschina.com>
Date:   Tue, 16 May 2023 09:35:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] coda: return -EFAULT if copy fails
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
        codalist@coda.cs.cmu.edu, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
In-Reply-To: <3e92c08d-9c0d-4fcd-bf15-0fbcac3be26a@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2023/5/15 15:35, Dan Carpenter wrote:
> On Mon, May 15, 2023 at 02:19:23PM +0800, Su Hui wrote:
>> The copy_to/from_user() functions should return -EFAULT instead of -EINVAL.
>>
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
> Could you add a Fixes tag?

Hi,

This doesn't seem like a bug.

So I think Fixes tag should not be used here.

Thanks for your reply!

Su Hui

> regards,
> dan carpenter
>
