Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A186C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Jan 2022 08:29:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240604AbiAJI3w (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Jan 2022 03:29:52 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60772
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240821AbiAJI2r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jan 2022 03:28:47 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E38AA40710
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jan 2022 08:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641803319;
        bh=KSGYgxbJHtzmF1VVpegyRa64dLhxDiMx11JnqwEBzqQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=BBHRbjJhFtBb3/bdC8qM8+vNhpJAsEsSPLyA4l9vRK7pEgqjBcm+BW8hLYtXxI8l/
         jXCTusjwnzQKykLM2ev7AHNJjy6gujnaf+n9S/TCivz2jFDHfYCyhVPx58JaMABKf4
         pFiRnokBh2jNGjUBw1gmgQYT82ltpQIo+MjNmiOtmMaX4ZDMRWn/j3CBSUMhlIZHAQ
         yP/RUw7mIxAX1G0iRcv8w223S6Q3VLR88KAsoLo1BLZKXvX0daeU7MhclbJkyPRf8t
         MmfV9wSQeDXD4b6WK2iia3LIU9iJ0gcsXUrTfFJsRcnv8OAzGAxHM2sNwl89uiusFe
         yApqtzBWQa8DA==
Received: by mail-ed1-f70.google.com with SMTP id x19-20020a05640226d300b003f8b80f5729so9423913edd.13
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jan 2022 00:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KSGYgxbJHtzmF1VVpegyRa64dLhxDiMx11JnqwEBzqQ=;
        b=IHBEb0YKuBj6Rbn251HDxL40De3MUC4mCot60y/qKIG20Qp9Z8KuFcnXSeq3Q++jjz
         GB0C3XlFMtgv2i3rd9BQ7ZArJEIXwhHcVg5DbdD+wdv+770h17C3KstK8EIMHPubUmM5
         c3Ab5giollXaQMFJ2VARPgJyVaCMt7xcgXK+DrUaBNew0s5v/OGemb+x6GhcoWrYfdss
         RPm43a6WOkROTWEXuOrQAWNyJHdtqbqDJDOrWSg7B2hqyUfWTspgbm/VB08i8VNg2mk1
         SV1YK1AWFpee351Y+W6L+ZRq5jmNarGKq0TkWB8+vm/DTsnlI4BdJbMkel7uLYQLwNUD
         KFGQ==
X-Gm-Message-State: AOAM530qAqVQ0tfdqO9s0H1nzpw71Fg1IUbbf6N6FiL/J7vOhmN7/DlN
        6Ybvb5KriLLhsJ4X2kKJtDvkseV9sfmAxDmtVHBvBFtdnJ3thoTdbzcx+Ulm78lPS8eQhRw2pl+
        xOUFJQyBIPl8Uwxtib2QjJCjZLW5IAU6wGlCA+2Y7uS7rSA==
X-Received: by 2002:a17:906:4e84:: with SMTP id v4mr15335911eju.285.1641803318496;
        Mon, 10 Jan 2022 00:28:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweIKj/IIvkfFyENUkaRCL3MEVzaMQZPMIjQjMvG12GhlNEHGgCw4u64A90ZXuQJlPEXjQPNA==
X-Received: by 2002:a17:906:4e84:: with SMTP id v4mr15335906eju.285.1641803318366;
        Mon, 10 Jan 2022 00:28:38 -0800 (PST)
Received: from [192.168.1.126] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c19sm3193637ede.62.2022.01.10.00.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 00:28:38 -0800 (PST)
Message-ID: <8b5cfdc8-e714-422f-6e3f-2e8daeeed81e@canonical.com>
Date:   Mon, 10 Jan 2022 09:28:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] nfc: pn544: make array rset_cmd static const
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220109202418.50641-1-colin.i.king@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220109202418.50641-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 09/01/2022 21:24, Colin Ian King wrote:
> Don't populate the read-only array rset_cmd on the stack but
> instead it static const. Also makes the object code a little smaller.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/nfc/pn544/i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
