Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBF3C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Jan 2022 10:09:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237657AbiAFKJX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Jan 2022 05:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbiAFKJW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Jan 2022 05:09:22 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C61C061245
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Jan 2022 02:09:21 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id k21so4039414lfu.0
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Jan 2022 02:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I/rP0dNHt8Jazht9doi78Jhtq9KEOMg3d7CX9IcDqRY=;
        b=HLoo5vmOFELqqkXBZQzi+nY5cb0VKfYI1MuYP5GcZ2b6CkBncMCdMi858SxG8V42wR
         qSTE6LoppcghKZksAM2xHn3hacU16VYnFIVJqkpJ2sEsrbjhLsNEX1mYqbu1dB7m1D9d
         92odfaQ9pBzeFCj+hahyHIq26MICyRkPiNvD0SK0BSWDs+rzYWZgBDDeIuxTdR4f6IoF
         Qqt+yn9vwj3oG11o3VjMGb4oDXsQn7N8kkCmJfhC6I0C0sY05sofbvgO+MhYc5K0rfO8
         DdkxZj9p6goOR/a/kCoNWT6GQexjnm/X8LqB06APNXu9HmAJuVFHzA+/fzXK3fc+9HC5
         uPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I/rP0dNHt8Jazht9doi78Jhtq9KEOMg3d7CX9IcDqRY=;
        b=NHHZTay6anHiXeY5q4Qt24l9jfI+wVlp4eUhpO0vAVlXqIiQN1bgqbVWr/r2wFZaq4
         RHnCk9Ebj5Xsy2NswGbHBEwC8Wfk+1KYFEMdOzahOfheT1+Eg3TuXN7bj2gjgzBCfyJl
         Ja9mQ9ZGcwZ1d7Oe1bvw6GB4v+axRsjnpg9pkXpQbRvZtzDSTyyJTt9eiVLgGOSDnBBB
         KFlBa6B0Z+aBwnMoHeu5O18OwbIKCO0gEyS5uPPoSBdo1U2KRSgRPVavOf+5e8+FTEn1
         Y/sj00Kmhy2Y2dO0uiOBzjJYcYBlNfWQ1aOkTh1NJ7GCPgpEvxZ11F0zRaagqFIe/aqE
         BWiQ==
X-Gm-Message-State: AOAM532KmkeXpOeHgbmYyNtRbTqVlNMF/0uWSEvto+Xo+tbqQZVQpFJn
        iH9S9xciAf4pT3k/aPdm/E0=
X-Google-Smtp-Source: ABdhPJzwQeD/cB9Y5GoBprwdH8rfm05M/8PBHCWWQXNzSBSGaxR0dlKjQhZ0zycPYbUtAlaHZicZ/w==
X-Received: by 2002:a05:6512:260c:: with SMTP id bt12mr49856441lfb.506.1641463759566;
        Thu, 06 Jan 2022 02:09:19 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.53])
        by smtp.gmail.com with ESMTPSA id g5sm133789lfj.33.2022.01.06.02.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 02:09:19 -0800 (PST)
Message-ID: <fdf648ba-2dc2-2369-47f5-b471c2b0852f@gmail.com>
Date:   Thu, 6 Jan 2022 13:09:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [bug report] asix: fix uninit-value in asix_mdio_read()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
References: <20220106100531.GA25074@kili>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220106100531.GA25074@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On 1/6/22 13:05, Dan Carpenter wrote:
> Hello Pavel Skripkin,
> 
> The patch 8035b1a2a37a: "asix: fix uninit-value in asix_mdio_read()"
> from Dec 21, 2021, leads to the following Smatch static checker
> warning:
> 
> 	drivers/net/usb/asix_common.c:82 asix_check_host_enable()
> 	warn: 'ret' possible negative type promoted to high
> 
> drivers/net/usb/asix_common.c
>      68 static int asix_check_host_enable(struct usbnet *dev, int in_pm)
>      69 {
>      70         int i, ret;
>      71         u8 smsr;
>      72
>      73         for (i = 0; i < AX_HOST_EN_RETRIES; ++i) {
>      74                 ret = asix_set_sw_mii(dev, in_pm);
>      75                 if (ret == -ENODEV || ret == -ETIMEDOUT)
>      76                         break;
>      77                 usleep_range(1000, 1100);
>      78                 ret = asix_read_cmd(dev, AX_CMD_STATMNGSTS_REG,
>      79                                     0, 0, 1, &smsr, in_pm);
>      80                 if (ret == -ENODEV)
>      81                         break;
> --> 82                 else if (ret < sizeof(smsr))
> 
> This has to be: if (ret < 0 || ret < sizeof(smsr)) { but even better
> would be to fix asix_read_cmd() to not allow partial reads.  It should

Thanks for reporting this. It's indeed a bug.

I sent the fix yesterday, that disallows partial reads inside 
asix_read_cmd()

Please see

https://lore.kernel.org/all/20220105131952.15693-1-paskripkin@gmail.com/


With regards,
Pavel Skripkin
