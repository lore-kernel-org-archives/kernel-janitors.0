Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD1EC77B73
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 11:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236306AbjFFLdm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 07:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236236AbjFFLdl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 07:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64320E52
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686051175;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hj/oCZqRIaRss8Q4LgDlhtbf+IZqBpz4PwoZPwys/yQ=;
        b=HirrFCdCmhAXa1gsa6oD0zMAPPrUJrFWabjttwvzz+zqHMqOTiYOMbMjs2kGvXZ0rvlmmo
        a502j7AQYXt3PSbbG11SSZJP0fNL4ry+hbB8qC9RS9N31oBJIN/9s5OxgWzULo2H1b28yl
        W63AVNuYxMyETN3bWY4lIN7bcqIXpJE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-9kH51lgKOlu6L7tT-4-b6w-1; Tue, 06 Jun 2023 07:32:54 -0400
X-MC-Unique: 9kH51lgKOlu6L7tT-4-b6w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9744659b7b5so495044166b.3
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 04:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686051173; x=1688643173;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hj/oCZqRIaRss8Q4LgDlhtbf+IZqBpz4PwoZPwys/yQ=;
        b=YkWK4wHOLUKOrnECJsCLaLLkiEUwgOf5Dmo+CptWI8DwZ9HI5q+AXMtCx4r0kpfkRU
         OUfoYFa3/8cnUqyPJV0ckPH0UP1Lg4FBepxhSWbunIl3jU4KjQjhaAgUqb5kzdadRlSt
         gFJa+ePKtbaxnrcWLcoMyo3UpD6jzXm8CKOvUVBJnjxC9Yg0viFVA/v/UhO5CnqhxoQH
         spT7kK7rEIK5Oibn60Cvqn0gd3ARxZSWK5iitQ8qc8SSNXP+lJdY5B/in0g9NneO15y3
         wIdf2JH+n49SyemB4yuOW0BnYUOggZsTH4JITWhWS4ToBVhrXlHUB/gGs2opKrKlZciU
         /KSw==
X-Gm-Message-State: AC+VfDzdw6qrVf0RITRoIUrTJMpOaiG8seo+Xo8kFTZ8ztXgPTNOmD+t
        PS0AkFwEUHZ+NrI4osG4BraV//DxO6NW/aKUNxk0YuZD+fuhMQ7+4bvS0uU7HMI9J9DmO8usnLM
        9+ANyK6MRVp3+Qs9SGjMgAMAwH1yU
X-Received: by 2002:a17:907:a42c:b0:974:1c90:2205 with SMTP id sg44-20020a170907a42c00b009741c902205mr2200642ejc.13.1686051173364;
        Tue, 06 Jun 2023 04:32:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4RPPPPFthYe4DwksyqkYkoUYRCGX6sEiUsyi9TszOqGKteH/2fL/6aokjXcd3QP/WDawUH7g==
X-Received: by 2002:a17:907:a42c:b0:974:1c90:2205 with SMTP id sg44-20020a170907a42c00b009741c902205mr2200628ejc.13.1686051173071;
        Tue, 06 Jun 2023 04:32:53 -0700 (PDT)
Received: from [192.168.42.222] (194-45-78-10.static.kviknet.net. [194.45.78.10])
        by smtp.gmail.com with ESMTPSA id b27-20020a1709062b5b00b0097381fe7aaasm5445787ejg.180.2023.06.06.04.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 04:32:52 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <fae329d4-2599-d677-2ace-81bc137a758f@redhat.com>
Date:   Tue, 6 Jun 2023 13:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc:     brouer@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH bpf-next V1] selftests/bpf: Fix check_mtu using wrong
 variable type
Content-Language: en-US
To:     Daniel Borkmann <borkmann@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        bpf@vger.kernel.org
References: <168605104733.3636467.17945947801753092590.stgit@firesoul>
In-Reply-To: <168605104733.3636467.17945947801753092590.stgit@firesoul>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 06/06/2023 13.30, Jesper Dangaard Brouer wrote:
> Dan Carpenter found via Smatch static checker, that unsigned
> 'mtu_lo' is never less than zero.
> 
> Variable mtu_lo should have been an 'int', because read_mtu_device_lo()
> uses minus as error indications.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
> ---
>   tools/testing/selftests/bpf/prog_tests/check_mtu.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Providing the fixes like that I forgot.

Fixes: b62eba563229 ("selftests/bpf: Tests using bpf_check_mtu BPF-helper")

> diff --git a/tools/testing/selftests/bpf/prog_tests/check_mtu.c b/tools/testing/selftests/bpf/prog_tests/check_mtu.c
> index 5338d2ea0460..2a9a30650350 100644
> --- a/tools/testing/selftests/bpf/prog_tests/check_mtu.c
> +++ b/tools/testing/selftests/bpf/prog_tests/check_mtu.c
> @@ -183,7 +183,7 @@ static void test_check_mtu_tc(__u32 mtu, __u32 ifindex)
>   
>   void serial_test_check_mtu(void)
>   {
> -	__u32 mtu_lo;
> +	int mtu_lo;
>   
>   	if (test__start_subtest("bpf_check_mtu XDP-attach"))
>   		test_check_mtu_xdp_attach();
> 
> 

