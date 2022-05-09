Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE57C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon,  9 May 2022 12:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbiEIMsN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 9 May 2022 08:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234744AbiEIMsF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 May 2022 08:48:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F34AE2272DF
        for <kernel-janitors@vger.kernel.org>; Mon,  9 May 2022 05:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652100244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c7/SXhV1I0JuB9mdx/LYi/9cLxe2PenDAh/hDIw0UcE=;
        b=RztCueGzz7XDmE8k06fvnv+q5A0hinE8JIaoz0KcxKV2JS6MH22+SJj6vUkujEI06PYY0p
        OYskOkuy7kD1ENk+0CRdJdZSrlTXtpCtVcql9+Bmlwwk25L4Nel6gqPJoGnFsVQZoeYytu
        aPMZ7apXGb27ht7Y9eoiG5MpJoYUfx4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-oosUREloMruyjP_2RhuGig-1; Mon, 09 May 2022 08:44:03 -0400
X-MC-Unique: oosUREloMruyjP_2RhuGig-1
Received: by mail-qv1-f71.google.com with SMTP id cy9-20020a05621418c900b004562be4402eso11677900qvb.6
        for <kernel-janitors@vger.kernel.org>; Mon, 09 May 2022 05:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=c7/SXhV1I0JuB9mdx/LYi/9cLxe2PenDAh/hDIw0UcE=;
        b=6kmuJChXwmci6LhXYBeQ1ShPYt0gU3epBzkJPOefX7W+7ccaVOVbhUZQhLw98nQCiM
         UjLmGsUa7ctw1/eawy/jF09soNNTlwuNBVqJ9BKVaOxIBKzGCXE7lVMnIGRvQsJVtfjl
         5CMJxsIKqHNW4qMICTsQpJ/Us3HaNOJMnir4HhuPuuatunbh3tBdoKqXMQD3xHrHbkjH
         DnIlJid9lVOH2yMJIYpUHGcwagGLyOMTQBaXIh1ZVcwQBCAA42Oc6/TN7Lc+HKL15MCm
         yKIikBI+diXCxB2WqhT23daypLRDI3VYaCnKevXwaEzLMA4FSzDi1YcJP5043meA0pGJ
         6C4g==
X-Gm-Message-State: AOAM532C8qWc/UQDzK0vIAJXPFIt82Aq7oTsu2go9hooLJkUbZYt9nM6
        nOgEl5rVcBste6bCdF4/EV8OfOMEWXw/lIAVjGPsPbP6grfw9w1Le/UfeOzv9dkUcF2ZkbwSA/H
        /78605hu22xYUuGeElZUWCjMtHoA7trvLWseT917PK76DzQAhzpBc4O8Znn2qrseVFKoseb6QFV
        g=
X-Received: by 2002:a37:a497:0:b0:6a0:a704:b49b with SMTP id n145-20020a37a497000000b006a0a704b49bmr1629094qke.453.1652100242282;
        Mon, 09 May 2022 05:44:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzguJ8plAlDd0cXSR1ev+D+vRtToG4GOdfdBRvIUj7ZHaSs7j/ZDhxa+NExb/eDsIJ5zVtXYg==
X-Received: by 2002:a37:a497:0:b0:6a0:a704:b49b with SMTP id n145-20020a37a497000000b006a0a704b49bmr1629064qke.453.1652100241828;
        Mon, 09 May 2022 05:44:01 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id a26-20020ac84d9a000000b002f39b99f676sm7519445qtw.16.2022.05.09.05.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 05:44:01 -0700 (PDT)
Subject: Re: [PATCH] fpga: zynq: fix zynq_fpga_has_sync()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Moritz Fischer <mdf@kernel.org>,
        Nava kishore Manne <nava.manne@xilinx.com>,
        Xu Yilun <yilun.xu@intel.com>, Wu Hao <hao.wu@intel.com>
Cc:     Michal Simek <michal.simek@xilinx.com>, linux-fpga@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YnkE8AbimDa7sfN8@kili>
From:   Tom Rix <trix@redhat.com>
Message-ID: <b1448881-4a68-0bc4-b828-0b9c79ffdf11@redhat.com>
Date:   Mon, 9 May 2022 05:43:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YnkE8AbimDa7sfN8@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 5/9/22 5:11 AM, Dan Carpenter wrote:
> The type needs to be u8.  The type was accidentally changed to char as
> a cleanup.  Unfortunately, that meant that the zynq_fpga_has_sync()
> function never returns true.  This bug was detected by Smatch and Clang:
>
> drivers/fpga/zynq-fpga.c:245 zynq_fpga_has_sync() warn: impossible condition '(buf[2] == 153) => ((-128)-127 == 153)'
> drivers/fpga/zynq-fpga.c:246 zynq_fpga_has_sync() warn: impossible condition '(buf[3] == 170) => ((-128)-127 == 170)'
>
> drivers/fpga/zynq-fpga.c:246:14: warning: result of comparison of
> constant 170 with expression of type 'const char' is always false
> [-Wtautological-constant-out-of-range-compare]
>                         buf[3] == 0xaa)
>                         ~~~~~~ ^  ~~~~
> drivers/fpga/zynq-fpga.c:245:50: warning: result of comparison of
> constant 153 with expression of type 'const char' is always false
> [-Wtautological-constant-out-of-range-compare]
>                     if (buf[0] == 0x66 && buf[1] == 0x55 && buf[2] == 0x99 &&
>                                                             ~~~~~~ ^  ~~~~
>
> Fixes: ada14a023a64 ("fpga: zynq: Fix incorrect variable type")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The ada14a023a64 ("fpga: zynq: Fix incorrect variable type") patch went
> through six of revisions.  The kbuild bug found this bug early on
> but the author ingored kbuild-bot and kept resending the buggy patch
> anyway.
>
> After the patch was merged then I sent a separate bug report and Xu
> Yilun asked about why only the author was on the CC list for the first
> bug reports.  A valid question, definitely.  I will poke the kbuild
> devs about this.
>
> Hm...  Actually looking through the list there have been a bunch of bug
> reports about this because both Smatch and Clang complain so kbuild
> sends duplicate warnings for this type of bug.  And then kbuild
> sends another to say "This issue is still remaining" warning.  And then
> Xu Yilun sent an email "Kbuild-bot is still complaining.  Please don't
> forget to fix this."  So that's at least four public emails about this
> and one or two private emails directly from kbuild-bot to the author.
>
> The kbuild-bot wanted to send *another* warning today, but I decided to
> send a fix instead.
>
> LOL.
>
>   drivers/fpga/zynq-fpga.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/fpga/zynq-fpga.c b/drivers/fpga/zynq-fpga.c
> index 6beaba9dfe97..426aa34c6a0d 100644
> --- a/drivers/fpga/zynq-fpga.c
> +++ b/drivers/fpga/zynq-fpga.c
> @@ -239,7 +239,7 @@ static irqreturn_t zynq_fpga_isr(int irq, void *data)
>    * the correct byte order, and be dword aligned. The input is a Xilinx .bin
>    * file with every 32 bit quantity swapped.
>    */
> -static bool zynq_fpga_has_sync(const char *buf, size_t count)
> +static bool zynq_fpga_has_sync(const u8 *buf, size_t count)

This is called from zynq_fpga_ops_write_init, a fpga_manager_ops 
function that

uses 'const char *' as a type for its write() buf's.

I think const u8 * would be a better type for all of the fpga_manager 
instances.

If folks agree, I'll make the change.

Tom

>   {
>   	for (; count >= 4; buf += 4, count -= 4)
>   		if (buf[0] == 0x66 && buf[1] == 0x55 && buf[2] == 0x99 &&

