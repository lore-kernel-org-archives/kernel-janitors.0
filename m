Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51960EB64DA
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 11:15:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjFSLPC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 07:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbjFSLO7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 07:14:59 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2E894
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 04:14:57 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9829b12b80fso521180266b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 04:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1687173296; x=1689765296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYO+FdD02HoQtON3gY3N67r0LjDnfpgEGatkCF/SPuM=;
        b=vmBfiw9NB0m0oRyziSLMIbgVVuWC8KucOqqtglZqMCYjfwBwb2yaY8khBcq+6D8OBR
         MdPMNQKT2L+9alij30NUHbXFPbCgPhaOcYTe0dFD1vf53SG7W+UgBXUVpTUGPLrZwpIj
         ZM4pKV5YC9OgEb/tF4xUDQR+/JwLPY1t7Y+hlyVIhFACLYP2/ETBzG08uoas7Qp6cIJ+
         oKFyiCKC6LhRt3sLbAlB9WHiaPGGCCq4lWfJ+cRmqQVSp5Xb0pU24CfJ8s03Uq5+iBJ9
         w1RtVzQV8cm7xeYE6XGLIk0koOuLmAft1JsU4eCKmu65Pjiumyd5DVaTrBG5CZv8EWCB
         mrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687173296; x=1689765296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYO+FdD02HoQtON3gY3N67r0LjDnfpgEGatkCF/SPuM=;
        b=PxlVqk0SdBSCN+li0DJpLNcKcC1SR02feUoweiiNFt7g2BsAG8wANNpJjmVHfkPg2m
         tAHi1TZM+qWqDY/IkSwuNmAo1NHtCmSIYdRARq5OeFP5wqvKArGiVIsL0Onia+WPffjP
         0TrpOWCO7w+dG6dhJsd2VYyT6byCkCjKULOmm6WzeuBKa7z1udu6VJEnZ3U1SC1ilnpA
         vTvPKxccyTQ/iHDNAgbOho7Ih4HosjcIfPNgBb7LLiezXeTyiKxnsAYapUM48E8e++sF
         TI4G5BjHq88ZVuLZP7rPjn26C1PGrOVJ2YKsow5liF25cBsZr0Oe2SQbU+FhbMsnYIH8
         /H8w==
X-Gm-Message-State: AC+VfDwHzvDxCQUbywUwuvSQ+xkqTidfeeQNbXExeMC4piFS9JxImQQ+
        coa5G592q18PQa1DCWdj5t0AkTUmaRsEkl7CQLcfhA==
X-Google-Smtp-Source: ACHHUZ6KrZgsHnmsIkFvEKH2MSdqPB9TyfdERyrH3BK4EWJ+r0jnQQb3AE+Pg2hladpawECOYZvXWg==
X-Received: by 2002:a17:907:7f13:b0:988:74eb:b6d8 with SMTP id qf19-20020a1709077f1300b0098874ebb6d8mr3266923ejc.51.1687173296058;
        Mon, 19 Jun 2023 04:14:56 -0700 (PDT)
Received: from [10.44.2.5] ([81.246.10.41])
        by smtp.gmail.com with ESMTPSA id v12-20020a170906338c00b009887a671017sm2111636eja.179.2023.06.19.04.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 04:14:55 -0700 (PDT)
Message-ID: <7472fb6b-5884-586c-0965-b3bef83109f3@tessares.net>
Date:   Mon, 19 Jun 2023 13:14:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH net-next] mptcp: Reorder fields in 'struct
 mptcp_pm_add_entry'
Content-Language: en-GB
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Mat Martineau <martineau@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        netdev@vger.kernel.org, mptcp@lists.linux.dev
References: <e47b71de54fd3e580544be56fc1bb2985c77b0f4.1687081558.git.christophe.jaillet@wanadoo.fr>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <e47b71de54fd3e580544be56fc1bb2985c77b0f4.1687081558.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Christophe,

On 18/06/2023 11:46, Christophe JAILLET wrote:
> Group some variables based on their sizes to reduce hole and avoid padding.
> On x86_64, this shrinks the size of 'struct mptcp_pm_add_entry'
> from 136 to 128 bytes.
> 
> It saves a few bytes of memory and is more cache-line friendly.

Good catch and thank you for having shared this patch, it looks good to me!

Reviewed-by: Matthieu Baerts <matthieu.baerts@tessares.net>

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
