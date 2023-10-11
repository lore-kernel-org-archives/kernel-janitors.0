Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F1BCD6E56
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Oct 2023 10:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbjJKKQl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 Oct 2023 06:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbjJKKQk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Oct 2023 06:16:40 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D96A7
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 03:16:37 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-307d58b3efbso5862435f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 03:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697019396; x=1697624196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9/7OIUWMwcZeLnzyOP4f3rxcYPwmMe1TPumewQSvo8s=;
        b=ryykwJGX42Ww1kU+ScEwXGOEMYk6CGiWcSuX/kPig/hpA0u45w97RbIDDdNyFK+dXZ
         cBY1PKpID9XEnIBypwFXpJHq0O1Z3tlvS5AZxT+9KbZcBNvo+kmS6OvwH6yhScLbOAwO
         JA+8LFe4dwhNltwYVmPpfa/oJ/sAgtMywHAZgYu3JwkZ65aH4vZOc/iLYPccBjkaa6bb
         xcAxS1dlpGU5+dX3qOVM5csAmdfASDieG3beo3tqtBgUJM9Y4mkShxhdSMbVa1aNA5x3
         S/rAAZv+9QJBACiQOXh5bxNcNEYF89YZQRVCwvwM+iKNRfcBmYhD+mCjFXo5hguvOMb2
         dRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697019396; x=1697624196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/7OIUWMwcZeLnzyOP4f3rxcYPwmMe1TPumewQSvo8s=;
        b=FaUh+g7Jhe/CXIfrp5BW0fsGt40g1+TqE3Uq098ElCD+Tntw6pf6d5hsSCG6pmvUhV
         Q28pGNDryYpyta3RZSzZ5xeShcrRzoRi3AjWWwn1RlUY5e6jsLr6rWjeW+LwUqE1rkTE
         ihlpe4yft7loEwVfNuLjLDsdNaMCAEV4H2M4XbPeQaM4ppnq+EnojWNdp1/BJiv9Jw5z
         M2c0OKSQxvTtZaLZQvdJZjKgv6dPcm+/19FKwiEvCPFtuWHqnbjVgrrnAlcu2O91gQ84
         UOlmUUENrwuMq5RyAtasx34bbHFjjfY9+2guTKs52SvsNEdRaUOk4WG9lrd1pj3inKl8
         MS1w==
X-Gm-Message-State: AOJu0YzuJhIA74q8MFUmxf8WLcL+mp+YxFviUKsGnkegAmby73mQxKqc
        S1auatjt1pxSSV/sx9X9Y39EXHpML9MHiZ3TsTA=
X-Google-Smtp-Source: AGHT+IETcLeD57UXbx/bc4jqZP4CD92nnmzm+zpzhEOnpQJXsmuTIxIYb612kL7JwQTUMPejSy0U0g==
X-Received: by 2002:a5d:6c69:0:b0:32c:eeee:d438 with SMTP id r9-20020a5d6c69000000b0032ceeeed438mr4474209wrz.54.1697019395953;
        Wed, 11 Oct 2023 03:16:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bv2-20020a0560001f0200b0032d09f7a713sm4307374wrb.18.2023.10.11.03.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 03:16:35 -0700 (PDT)
Date:   Wed, 11 Oct 2023 13:16:33 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     steffen.klassert@secunet.com
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] xfrm: Support GRO for IPv4 ESP in UDP encapsulation
Message-ID: <4b8c8474-280b-4715-b2f2-53301ac991e7@kadam.mountain>
References: <8a3f05b4-bde7-4a5e-86be-e1f402907ab0@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a3f05b4-bde7-4a5e-86be-e1f402907ab0@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 11, 2023 at 12:57:52PM +0300, Dan Carpenter wrote:
> Hello Steffen Klassert,
> 
> The patch 172bf009c18d: "xfrm: Support GRO for IPv4 ESP in UDP
> encapsulation" from Oct 4, 2023 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	net/ipv6/xfrm6_input.c:174 xfrm6_udp_encap_rcv()
> 	warn: passing freed memory 'skb'
> 
> net/ipv6/xfrm6_input.c
>     168 int xfrm6_udp_encap_rcv(struct sock *sk, struct sk_buff *skb)
>     169 {
>     170         int ret;
>     171 
>     172         ret = __xfrm6_udp_encap_rcv(sk, skb, true);
> 
> The xfrm4_udp_encap_rcv() function frees skb and returns zero.
> 
>     173         if (!ret)
> --> 174                 return xfrm6_rcv_encap(skb, IPPROTO_ESP, 0,
>                                                ^^^
> Use after free
> 

This generated warnings for the other places that call
__xfrm6_udp_encap_rcv() as well.

net/ipv6/xfrm6_input.c:207 xfrm6_gro_udp_encap_rcv() warn: passing freed memory 'skb'

regards,
dan carpenter
