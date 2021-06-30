Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223FDC11F65
	for <kernel-janitors@archiver.kernel.org>; Wed, 30 Jun 2021 13:32:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CCC2613DC
	for <kernel-janitors@archiver.kernel.org>; Wed, 30 Jun 2021 13:32:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234768AbhF3NfJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 30 Jun 2021 09:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55580 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234882AbhF3NfH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Jun 2021 09:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625059957;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B29ak5IExuV5xQ1UDepJEEmvvBRdoZ1X4KzbA2i8hEA=;
        b=RkYILSBCb6t5tgujBehohOGsQrD64RpXL0lJaXDHah3aGAqHFC8/Pp3TAHrCcqDkKfkWlT
        NUf+GRz/p/mZ56phGl35bcf40vJj/u2qtRgeSW2Qcc/IGWjy52xC6//YNQ1VRp6dUlSrDQ
        dZtmEQ+tBgJ3kzi1/A34tgV735ml+Hc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-7mb3zk_uMdOI2TyCJymXEA-1; Wed, 30 Jun 2021 09:32:36 -0400
X-MC-Unique: 7mb3zk_uMdOI2TyCJymXEA-1
Received: by mail-ed1-f70.google.com with SMTP id ee28-20020a056402291cb0290394a9a0bfaeso1173999edb.6
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Jun 2021 06:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B29ak5IExuV5xQ1UDepJEEmvvBRdoZ1X4KzbA2i8hEA=;
        b=efGhmHfxM92iITaerCBaCZtDfisMRv453ZSGauiX8w2BicSI+F5uJwYvX1vJXrCnhZ
         6uaNX0pNurWif2Dl9Cozp1OP2bY0TK2XfxW7Kl6bicIF4xAvqDj8QbMxTEQfbPn69KzA
         8j0zFW8TFsD/kjGBhinJnmcHOu1DFO8y7r1GhWw0Jg6QkkmQ6XRaNAm+K+Jfz8VFunyL
         G4aIvsSNOrinasRG8YEcFrtDO6oG0+NsHYIRef9w/8NdrFeCI6C45Zufg8lH6kjFnrOA
         vPzJXJFeQFybvSQ3tq2A9UJ5cSocyOpYNsurGn0jgLpdgf+X2Ix4wurV0Z8bbSbIwJiz
         0K/A==
X-Gm-Message-State: AOAM533EXNjzHnNAdwkYcjnYY0PNGvyDwjUeonWsCFh2WQU+unHk9pX4
        LL97XtkhAez9RIRc3APiQDJqovENzNKL68xFIFisest+YEHRvm0hwAQKDynAuURx0AeVjJ9BJbf
        ZwQIwKJR5eSxqpATizM+ngJWrBRuF
X-Received: by 2002:a17:906:dbec:: with SMTP id yd12mr34810483ejb.102.1625059955163;
        Wed, 30 Jun 2021 06:32:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ5GhWHaEAX58lymQvyY8OwdxenbawrCEZf5DE+XckN7hrGGFvvP7XTqTStlpUqZk2fj1vcQ==
X-Received: by 2002:a17:906:dbec:: with SMTP id yd12mr34810464ejb.102.1625059954972;
        Wed, 30 Jun 2021 06:32:34 -0700 (PDT)
Received: from x1.bristot.me (host-79-46-33-140.retail.telecomitalia.it. [79.46.33.140])
        by smtp.gmail.com with ESMTPSA id q5sm9396081ejc.117.2021.06.30.06.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jun 2021 06:32:34 -0700 (PDT)
Subject: Re: [PATCH][next] trace: osnoise: Fix u64 less than zero comparison
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Colin King <colin.king@canonical.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Ingo Molnar <mingo@redhat.com>
References: <20210629165245.42157-1-colin.king@canonical.com>
 <c74e711e-71c9-df9c-8406-b9e92ef12da0@redhat.com>
 <20210630090544.13c0a4df@oasis.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <2b6cf10b-d1e1-d0a4-f27e-79625d55e6c9@redhat.com>
Date:   Wed, 30 Jun 2021 15:32:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630090544.13c0a4df@oasis.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/30/21 3:05 PM, Steven Rostedt wrote:
> On Tue, 29 Jun 2021 19:19:25 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>>> Addresses-Coverity: ("Unsigned compared against 0")
>>> Fixes: bce29ac9ce0b ("trace: Add osnoise tracer")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>  
>> Steven, can we merge the flags?
> I don't usually do that. 

Ack!

-- Daniel

