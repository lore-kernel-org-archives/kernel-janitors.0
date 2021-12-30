Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773A0C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 30 Dec 2021 19:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242048AbhL3T6s (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 30 Dec 2021 14:58:48 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33732
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242042AbhL3T6r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 30 Dec 2021 14:58:47 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 36B733F1AF
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Dec 2021 19:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640894326;
        bh=GNWzUrlrK9iApcC0QIt7hy4CWeyRUiCxofVD3uisya4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=IQ0XcJkyjY35RH82W+KcSDToOvW8gpc1+D8s2XE8QiRxzgBMArbosRdYWRJRr1hUM
         EjC13HVx4kkYU3P2gyH4FsFPUx7X8mwhrXXyg2I94H27jRDbTX2tIObJISFcWEeips
         tFjt+WW1y00eslzFdEZKLNsgiKXIvQFtwtcqV9esj7NwiU/T+qQWo0TMwJvK8f/10i
         7JwiitkuMLMLR1wgUfNbTaC3xu8zRLGZ20jSsmRgwp8IsLc2goaF8xNUPY2ejzsfZ9
         dQaFZoaKat4LeXcYj243dA3R087vNje3ItgKKzqwwQ23an2lIjE2TRCVqyfFfTgvT9
         bc6JhD1WxNlJg==
Received: by mail-lj1-f197.google.com with SMTP id j15-20020a2e6e0f000000b0022db2724332so6169475ljc.3
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Dec 2021 11:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GNWzUrlrK9iApcC0QIt7hy4CWeyRUiCxofVD3uisya4=;
        b=pTksQJSDAuKjJfVqAGXLg0F/BFydm84D3SjM9zyJmTkubx+8VNS8k55LBLA1RBoHVs
         /L9BTAtkmU832fKLQdFBn7zWwef9zRpDFKz9HsD2HbjPTWQzWM4E3A7BEt8OPO/dqtkf
         BvoW0XzoChALTdtro+SirQ3NBBFoS+zVvpPZXjKb4YV0S5R4Jlzh4At8h3exAYce7TrG
         eUvKad7Z0pWydEBBXfxSMi022JSKXyWXZSzyeu0gExxz4IIsN1L+7qKrKosxIhpOoI66
         QPoDpFMdXJkhmLIACFvVZ/unOispbk+9CChtuyzyoWAqwV/m6Cxk4iKOgQQeRHynFuio
         TdCw==
X-Gm-Message-State: AOAM530kz+75ExNK1T3sGAn2OCp1vNdK8htJmZAvPYyp+nBtyrys/mIs
        8oOry5Od5PRA6gvZ0nRtYNPLqHov0JdsS6PPzbnCZZDeGZG2BMwy7g3x3Cwzu1f9dlrcrKhMR0v
        QognPKJoBj/DJ3ABz5fcHzVVKp1l7ZjkLroIXeb+e/0ar3A==
X-Received: by 2002:a05:6512:2311:: with SMTP id o17mr25992430lfu.256.1640894325566;
        Thu, 30 Dec 2021 11:58:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSa/wf1cnt5j7jqACUSdQ38QoQdVyafz5ZdxBfdxwsi0qKJ3PwI4Qbtw2FxwfqCGrdy+92UA==
X-Received: by 2002:a05:6512:2311:: with SMTP id o17mr25992421lfu.256.1640894325422;
        Thu, 30 Dec 2021 11:58:45 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z36sm2571458lfu.182.2021.12.30.11.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 11:58:44 -0800 (PST)
Message-ID: <eb2f0bb7-46ee-2290-6b60-90f555e4811c@canonical.com>
Date:   Thu, 30 Dec 2021 20:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] nfc: st21nfca: remove redundant assignment to variable i
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20211230161230.428457-1-colin.i.king@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211230161230.428457-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 30/12/2021 17:12, Colin Ian King wrote:
> Variable i is being assigned a value that is never read, the
> assignment is redundant and can be removed. Cleans up clang-scan
> build warning:
> 
> drivers/nfc/st21nfca/i2c.c:319:4: warning: Value stored to 'i'
> is never read [deadcode.DeadStores]
>                         i = 0;
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/nfc/st21nfca/i2c.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
