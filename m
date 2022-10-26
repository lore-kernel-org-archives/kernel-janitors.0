Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA0EC433FE
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 Oct 2022 10:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbiJZKrr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 Oct 2022 06:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233187AbiJZKrn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Oct 2022 06:47:43 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8389CC83D
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Oct 2022 03:47:42 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id bp11so25077753wrb.9
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Oct 2022 03:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xwO/J6XC5u/U/KETkLvY6jk2wOmjSxeU44uWgsDknd0=;
        b=Dh3IPko+ZGodvjmw02h3qp8SirFezR0NikFdhAqJBrDk2kH9Ikx/gMHU7O+OIzEO32
         5jKm+m6EiQHJJYuXR8yIdVkoNiHcp2MrggnFnCB64se1BlfIRd3T+7mzEdylrW46kYsd
         lkxkz4IiqczDA2Ph24U+v4onCwgLrJuMqTfA6Hz796H0mq3ZuBg1fJxRYU3hnWAIofCd
         IQL34JLqKwwsZ81wL8DnpHAPlWHSo2XtqvdKMUb8Ax5g2n20Y8uho+aauGNckvGr/BN8
         04MctORcWybLCHG+lUWtgvf3XJPS3VUcJCi5jOD6OxHBnceIbMxQ7WnUKeV5XiWA0rJ5
         1R/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwO/J6XC5u/U/KETkLvY6jk2wOmjSxeU44uWgsDknd0=;
        b=dt/zxnGGUDVDg2wVJu4SEBaEVy1je3s2+4LB6kigX/1yeVMcOZnBqCcC0I7di2Y2SZ
         rsbCtrGQv5hK9zK3MK71jXS2t+zGTxXZn+5uq47g//gESo0rVM1GAjnqsknHFhgebNIT
         v2WLpn5CyGuPI7yqczdjwKkwGffPsKoHD/L1i8uTgTL/yYhtdtgRTejcQ4n+ept3M2/y
         mkoLHLE0KZ1XSZZbKGD7RipaphYKVO6oHLguRPpxxTTnvXz5SwJuQjzoOESUdBUVlLfZ
         l6eW7yTpq8ihUT0b0LA/7ASQuctcdfxIaUHGx4tVnjvdq9G2z3ZiheRO8jfNkCJZyVJY
         IKLw==
X-Gm-Message-State: ACrzQf0QR4OxX93bWpZTNkrNFMwoN2eoPLjk+NuVb58bmizH1KdQumX4
        BeUOQZIbnoI05wlhsCd5vTTRCg==
X-Google-Smtp-Source: AMsMyM4DBdS8BONnLcYygG0nChaeXJm5Wz4Xl6+2yQTblzNJXa8f7zLXecQ5aw32lK+foYOpTHkkwA==
X-Received: by 2002:a05:6000:170b:b0:22e:44d0:6bae with SMTP id n11-20020a056000170b00b0022e44d06baemr28135803wrc.99.1666781253236;
        Wed, 26 Oct 2022 03:47:33 -0700 (PDT)
Received: from [192.168.178.32] ([51.155.200.13])
        by smtp.gmail.com with ESMTPSA id ay19-20020a05600c1e1300b003a1980d55c4sm1553348wmb.47.2022.10.26.03.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 03:47:32 -0700 (PDT)
Message-ID: <e3b415c2-351f-e2df-4a24-6fa33df7d69b@isovalent.com>
Date:   Wed, 26 Oct 2022 11:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH][next] bpftool: Fix spelling mistake "disasembler" ->
 "disassembler"
Content-Language: en-GB
To:     Colin Ian King <colin.i.king@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        bpf@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221026081645.3186878-1-colin.i.king@gmail.com>
From:   Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <20221026081645.3186878-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

2022-10-26 09:16 UTC+0100 ~ Colin Ian King <colin.i.king@gmail.com>
> There is a spelling mistake in an error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  tools/bpf/bpftool/jit_disasm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/bpf/bpftool/jit_disasm.c b/tools/bpf/bpftool/jit_disasm.c
> index 58a5017034a2..7b8d9ec89ebd 100644
> --- a/tools/bpf/bpftool/jit_disasm.c
> +++ b/tools/bpf/bpftool/jit_disasm.c
> @@ -223,7 +223,7 @@ static int init_context(disasm_ctx_t *ctx, const char *arch,
>  
>  	memset(tpath, 0, sizeof(tpath));
>  	if (get_exec_path(tpath, sizeof(tpath))) {
> -		p_err("failed to create disasembler (get_exec_path)");
> +		p_err("failed to create disassembler (get_exec_path)");
>  		return -1;
>  	}
>  

Thanks for the fix!

Acked-by: Quentin Monnet <quentin@isovalent.com>
