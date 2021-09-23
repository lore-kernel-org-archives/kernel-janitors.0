Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E03C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Sep 2021 07:26:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BB16610A0
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Sep 2021 07:26:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239605AbhIWH22 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Sep 2021 03:28:28 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60010
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234343AbhIWH21 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Sep 2021 03:28:27 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 70DFA40260
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Sep 2021 07:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632382015;
        bh=BpYqFmvbKqI+/NfJqDUHrHumN6faQ7YSYJO5rWC5vl8=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=jF8MJJusRggdEap0gWSFAmZAQZlzgFLxZWIOfogD1FCQf1p6AFzgFsypY8VE3MP7l
         XnYLVjvJvabrsKawz194rlJFnW/cl17bPPidkHSGb7n4AAPnPfMMsESOD5EW0itqnB
         0kQq47w/8EkiQGiKZR5zpe+QI6IFa0xvtpEJfgS725PQhC57mpPsgHUic2Al4RK6Lm
         YB5w/0VyM5JJ3c0VB2galLp21Q5YehaXoOyYgxFqd0W5Gt68X3H31D5TAYnLk8MOGD
         mWedX0gf+rBipM086Q0rvMr1G3EeviJI0WjFgDebiFTc823yHcVeRXIOTi8J2wK4J5
         7CkqVAxOg7Dbw==
Received: by mail-ed1-f72.google.com with SMTP id s12-20020a05640217cc00b003cde58450f1so5924642edy.9
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Sep 2021 00:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BpYqFmvbKqI+/NfJqDUHrHumN6faQ7YSYJO5rWC5vl8=;
        b=OS7WOtYLfARulX51v0bK1WgbpOn0QIrfCDf/flFLzLmYgkwM/sivt6T2HuaU42/MV4
         CmDSoa15D6wuu8ytbwVqzGA4sBkTckIEvwl2cEZWHRdHwLGOFfU5ZHqfE8kBPypsPWcA
         5GT2pv6cgju9gY0FhH/5FObYMuP29Z1rKBJpSdmph2FobytPSQGCMHl6fxF4Xy7A+5NR
         oU5nHoOTnktpoRbSo/seNmWjxfep27REkbk29E3q9FiVHLc9/3jSyo3FQwa81UylLqyO
         Bu8LKzJaFk5MOmSFVkwcejYB/x7DwMD27mX+7xvOSLIkHlyvtUYrl5ioJVZ3aZXqs8a+
         ehFw==
X-Gm-Message-State: AOAM532OPdiK17eWCLxuKzKRVE6RWYdM1Rd0KlZtjAIu1OxVTf9rgOFT
        gqi+nVNq5aXD8S5PZmooYh1/vq6B2fMOXuDvFjXLGerD6d4wDWdvJKbMwotAHvqUT2cYUBE6gB6
        J9taDNvlyoOtXnSIj94Y9YKiJ5iEcJxBvI0eZCVZG0v6oEw==
X-Received: by 2002:aa7:d7d5:: with SMTP id e21mr3906248eds.27.1632382013932;
        Thu, 23 Sep 2021 00:26:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxDwRjKrSA++cC1IQS3ul4nadXAHfLTPlUI4SQF66GujOefM3Z3K42W8P/6Lzto9Vc1VvnMg==
X-Received: by 2002:aa7:d7d5:: with SMTP id e21mr3906217eds.27.1632382013674;
        Thu, 23 Sep 2021 00:26:53 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id mm23sm2482065ejb.78.2021.09.23.00.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 00:26:52 -0700 (PDT)
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Samuel Ortiz <sameo@linux.intel.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "John W. Linville" <linville@tuxdriver.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210923065051.GA25122@kili>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH net] nfc: avoid potential race condition
Message-ID: <3760c70c-299c-89bf-5a4a-22e8d564ef92@canonical.com>
Date:   Thu, 23 Sep 2021 09:26:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923065051.GA25122@kili>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 23/09/2021 08:50, Dan Carpenter wrote:
> This from static analysis inspired by CVE-2021-26708 where there was a
> race condition because it didn't lock_sock(sk) before saving
> "vsk->transport".  Here it is saving "llcp_sock->local" but the concept
> is the same that it needs to take the lock first.

I think the difference between this llcp_sock code and above transport,
is lack of writer to llcp_sock->local with whom you could race.

Commits c0cfa2d8a788fcf4 and 6a2c0962105ae8ce causing the
multi-transport race show nicely assigns to vsk->transport when module
is unloaded.

Here however there is no writer to llcp_sock->local, except bind and
connect and their error paths. The readers which you modify here, have
to happen after bind/connect. You cannot have getsockopt() or release()
before bind/connect, can you? Unless you mean here the bind error path,
where someone calls getsockopt() in the middle of bind()? Is it even
possible?

The code except this looks reasonable and since writer protects
llcp_sock->local(), the reader I guess should do it as well... just
wondering whether this is a real issue.


Best regards,
Krzysztof

> 
> Fixes: 00e856db49bb ("NFC: llcp: Fall back to local values when getting socket options")
> Fixes: d646960f7986 ("NFC: Initial LLCP support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  net/nfc/llcp_sock.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
> index 6cfd30fc0798..74f4209c7144 100644
> --- a/net/nfc/llcp_sock.c
> +++ b/net/nfc/llcp_sock.c
> @@ -314,14 +314,16 @@ static int nfc_llcp_getsockopt(struct socket *sock, int level, int optname,
>  	if (get_user(len, optlen))
>  		return -EFAULT;
>  
> -	local = llcp_sock->local;
> -	if (!local)
> -		return -ENODEV;
> -
>  	len = min_t(u32, len, sizeof(u32));
>  
>  	lock_sock(sk);
>  
> +	local = llcp_sock->local;
> +	if (!local) {
> +		release_sock(sk);
> +		return -ENODEV;
> +	}
> +
>  	switch (optname) {
>  	case NFC_LLCP_RW:
>  		rw = llcp_sock->rw > LLCP_MAX_RW ? local->rw : llcp_sock->rw;
> @@ -598,14 +600,15 @@ static int llcp_sock_release(struct socket *sock)
>  
>  	pr_debug("%p\n", sk);
>  
> +	lock_sock(sk);
> +
>  	local = llcp_sock->local;
>  	if (local == NULL) {
> +		release_sock(sk);
>  		err = -ENODEV;
>  		goto out;
>  	}
>  
> -	lock_sock(sk);
> -
>  	/* Send a DISC */
>  	if (sk->sk_state == LLCP_CONNECTED)
>  		nfc_llcp_send_disconnect(llcp_sock);
> 

