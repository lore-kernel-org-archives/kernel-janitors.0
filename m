Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6C5CD6E56
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Oct 2023 09:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbjJKJ57 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 Oct 2023 05:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjJKJ57 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Oct 2023 05:57:59 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD2992
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 02:57:57 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3296b3f03e5so4564282f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 02:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697018275; x=1697623075; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NrxtP9gtXeOsIEDoPoBOo/xqCEi9Sr99wv0PF6haAeI=;
        b=CxgludhW+EH0LNgnYRtoMK2lC1MjvY8cHSQn2kNkkc+tEwT+zzlHzKQ1SF+63/xmXL
         ZOTVDSqpiGeGFak03tc4EydbvIHcVfFY+EZ/BWZ+BZx90wpRJcAk9P1+Sis26gbsLANB
         dY17OmAkWTRiUGWQWSrQkFUq3t0peG0qXzZ46+KS/1wpzEswJ/bEGYC8+P+37EFW8Jle
         OmE/Q7bY5VbVt1JKowynpjTet81lNDblKXZlrW4eo0qGTt+VyaMlmntBxJEYR5gyaExa
         PmsN8l3sO81TgBzCQ30t4/eKBjmh4Vrm2nsgG8cEBkq5KhuwWLamLYnc9IaxQTTldPsO
         lnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697018275; x=1697623075;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NrxtP9gtXeOsIEDoPoBOo/xqCEi9Sr99wv0PF6haAeI=;
        b=kO5gVjfu40YWZj/P+MZAsm+lAaaTT5NOXq/0I5XgGE2foAeYUuTDZcdV++M1cJJXLn
         wt0f0W93fQvBCIe/pIuYjldpGPMHd0kCeZLg0f3CYL9mzEn2RSo8Q5fNe/wEaePry/Tb
         e2K+ib/4Fio5GK5CDGw1iiVKz4I+lC7dFSWJYYbA+AvSD5zZ8zoanjhBBqUTVKOHeaSA
         jY+AkG4+6ThBLqRnL32S4jib3FqEoR6Nlr0uLlFjOETI/06kDY5K8CMtALi2P6gpR/Zd
         Yj73KiWkwXqmsP8hUO4o3AudB/vZ+xedUOj58CYGzPqwGYvDxP/9hGezdlEseNZkntw2
         epAA==
X-Gm-Message-State: AOJu0YzG4klAcl5XocOmET+h/fKAXtyTuupHeBSCRflcnUy7PjOSt6Hm
        iOSk1GEn/IZT/fxHgFriLAZnXg==
X-Google-Smtp-Source: AGHT+IHFQPXfm40fcchTTv1Bca0TIxGyLj6QRErKmJH3i/5VvxOk3zSNQCV19815Y7QsJnU4rRozVA==
X-Received: by 2002:a5d:5309:0:b0:31f:8276:5d04 with SMTP id e9-20020a5d5309000000b0031f82765d04mr18531692wrv.34.1697018275708;
        Wed, 11 Oct 2023 02:57:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e2-20020adfe382000000b00327de0173f6sm14981066wrm.115.2023.10.11.02.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 02:57:55 -0700 (PDT)
Date:   Wed, 11 Oct 2023 12:57:52 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     steffen.klassert@secunet.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] xfrm: Support GRO for IPv4 ESP in UDP encapsulation
Message-ID: <8a3f05b4-bde7-4a5e-86be-e1f402907ab0@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Steffen Klassert,

The patch 172bf009c18d: "xfrm: Support GRO for IPv4 ESP in UDP
encapsulation" from Oct 4, 2023 (linux-next), leads to the following
Smatch static checker warning:

	net/ipv6/xfrm6_input.c:174 xfrm6_udp_encap_rcv()
	warn: passing freed memory 'skb'

net/ipv6/xfrm6_input.c
    168 int xfrm6_udp_encap_rcv(struct sock *sk, struct sk_buff *skb)
    169 {
    170         int ret;
    171 
    172         ret = __xfrm6_udp_encap_rcv(sk, skb, true);

The xfrm4_udp_encap_rcv() function frees skb and returns zero.

    173         if (!ret)
--> 174                 return xfrm6_rcv_encap(skb, IPPROTO_ESP, 0,
                                               ^^^
Use after free

    175                                        udp_sk(sk)->encap_type);
    176 
    177         if (ret < 0) {
    178                 kfree_skb(skb);
    179                 return 0;
    180         }
    181 
    182         return ret;
    183 }

regards,
dan carpenter
