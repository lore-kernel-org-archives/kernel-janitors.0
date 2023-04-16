Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F01C77B73
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 Apr 2023 13:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbjDPNNU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 16 Apr 2023 09:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjDPNNT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 16 Apr 2023 09:13:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56D1211B
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Apr 2023 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681650753;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ecW/u7CjtCVSaHYPl096FXbBaM+YOFYAJMZvfjOeWGs=;
        b=NcZTA9DKzwmeDy9djJhzgfOS6RxMBcf8uDk9OEW7sVtvw1xv4D/WUq3oQVwqhFmp4WCO6j
        D/hVRwH6HFziS7X+zMWu2UPQgkJUnOfVGwTgKLNVXDRXJZ688CnkVLhdvox0Kjb8WrXwyl
        UipfNFwUuHIj9RO3ITpTw9OoPf9DCsU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-gXN8fGyJPLauJ1MgPQP9iA-1; Sun, 16 Apr 2023 09:12:31 -0400
X-MC-Unique: gXN8fGyJPLauJ1MgPQP9iA-1
Received: by mail-ej1-f71.google.com with SMTP id tx6-20020a1709078e8600b009343596918cso7595454ejc.16
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Apr 2023 06:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681650750; x=1684242750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ecW/u7CjtCVSaHYPl096FXbBaM+YOFYAJMZvfjOeWGs=;
        b=Mt0AhsKHsNwAruTgpHpkWyHj4L2l1PiB9GYNeeiWtBN3CKgs9B4MDzLF3Xie5nT+KF
         UGuKdOenIwhuTVCmfVcoS+Nn41akePVT8QtRBdzg3SbbXBhexwbQ2lWzec7UwG3hQUtm
         30EknlGeTENdaeDpdVJBbAbxdZxlASyuJYmXnjgwassiIWwNh+N0xnXX8DvEMiXnt7WM
         GMJlpZzrFKZ1t6DoYJYHkH+gxAhyeXtJ+ZC6p16I/6+btw4pJZg6RODGxUcTIjCTYfiw
         HnHBEfmIp1P8znXRxN6y97vxaN3aki0CkVyGCwEQW/5xLtWyAVOEfml9poVkuJrfjF3Y
         +lnw==
X-Gm-Message-State: AAQBX9fh0LhV5FbbM732rej2eeZ4IwuacOTU+sE1KFkVIRzpEeYxyRp/
        7CJXjG4lTQZalDDJepJMcTbfl69fTk8QPg4dLU2gMhm5+vfgjNYrVWKw3PBr1CBP4odLn2Q+Z9r
        fH7q5nq86RxCSqz8iQK/cFUhYZ8lZ
X-Received: by 2002:a17:907:7809:b0:949:c05d:73b6 with SMTP id la9-20020a170907780900b00949c05d73b6mr4080299ejc.17.1681650750402;
        Sun, 16 Apr 2023 06:12:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zvy4OWUGG7/uKcn/guQnbp5MOYixLaUbua5xOk1r9lVf96E10h0El+lKgLR9svlpzbszXUTg==
X-Received: by 2002:a17:907:7809:b0:949:c05d:73b6 with SMTP id la9-20020a170907780900b00949c05d73b6mr4080287ejc.17.1681650750153;
        Sun, 16 Apr 2023 06:12:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id xh5-20020a170906da8500b0094edd8e38fasm3665933ejb.76.2023.04.16.06.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 06:12:29 -0700 (PDT)
Message-ID: <9b243f3e-92ad-197f-f0a6-b22eaf71238a@redhat.com>
Date:   Sun, 16 Apr 2023 15:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: atomisp: Move a variable assignment behind a null
 pointer check in atomisp_cp_general_isp_parameters()
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>
Cc:     kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Xiaomeng Tong <xiam0nd.tong@gmail.com>, cocci@inria.fr,
        LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <d8ed4e5d-49d4-ca7e-1283-1ec166bf643d@web.de>
 <ZDmJsemYldOsMMrH@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZDmJsemYldOsMMrH@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 4/14/23 19:13, Andy Shevchenko wrote:
> On Thu, Apr 13, 2023 at 10:20:15PM +0200, Markus Elfring wrote:
>> Date: Thu, 13 Apr 2023 22:08:42 +0200
>>
>> The address of a data structure member was determined before
>> a corresponding null pointer check in the implementation of
>> the function “atomisp_cp_general_isp_parameters”.
>>
>> Thus avoid the risk for undefined behaviour by moving the assignment
>> for the variable “cur_config” behind the null pointer check.
> 
> I don't think this is what is happening here. The check might be removed by
> optimizer in the compiler.

Right, Markus thank you for the patch.

Instead of this patch, can you please audit the callers of this
function? I expect that you will likely find that the callers
already unconditionally deref css_param themselves, or they
guarantee a non NULL value in other ways (e.g. address of local
variable).

So I expect that the check can simply be dropped completely,
which would be a much better fix.

Regards,

Hans





> 
>> This issue was detected by using the Coccinelle software.
>>
>> Fixes: ad85094b293e40e7a2f831b0311a389d952ebd5e ("Revert 'media: staging: atomisp: Remove driver'")
> 
> Wrong tag format.
> 
> Code-wise I'm not against this, but it's up to Hans.
> 

