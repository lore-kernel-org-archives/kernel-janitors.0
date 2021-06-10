Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470CEC48BDF
	for <kernel-janitors@archiver.kernel.org>; Thu, 10 Jun 2021 10:05:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2844660FDA
	for <kernel-janitors@archiver.kernel.org>; Thu, 10 Jun 2021 10:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhFJKHp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 10 Jun 2021 06:07:45 -0400
Received: from mail-yb1-f177.google.com ([209.85.219.177]:38802 "EHLO
        mail-yb1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbhFJKHo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Jun 2021 06:07:44 -0400
Received: by mail-yb1-f177.google.com with SMTP id m9so33455462ybo.5
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Jun 2021 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y1t1gThwqk4P3CmoGImUqahvI/YhwYgwDOhTQsQgvaA=;
        b=Fo5PxKwzHWbMPPS1iiWO2GC+MRsiSG+6qXKY/mJ/8+7ab/qIWgpJGQVg99FSMR59zt
         L+z+SMHv4atQvkUU+725zAvAEtaDTy9Yh0HZGmPZkqEve5SDUZFOBscTmtgsyMenyG8S
         IAi76+d89mduQPDfXVeeIyAVTDccEEn+imq2ABlI57gwY5WGv1pXTZaqp/BRpHisTPPS
         GfaHjkwECD96YVgA8t1W0kmiioSEfBzKDGXtbuEV7jmAInCnH7zyVxf0GHB8pyzJZZiO
         4EAZOM+pokM+kdAIbQR6JsQkllDWaMu7mFrz1GoNVlfNvBL4u4BlbvA7PYQ6pp0ynTax
         zLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y1t1gThwqk4P3CmoGImUqahvI/YhwYgwDOhTQsQgvaA=;
        b=J+EYGKXha0Sgk22G+NdRqKu5rBM/HwRZiaNg7C//ynpoYUVR7JGYu1ndT2wgLXmU8R
         w+5XIYhJMAelEh9FQpV7qsB5mvQxMhQN2Dsw3oX6Uw0oFwfydvc/re/zh59nsWhBVUx3
         cSA04JJebsNMwtvZC/7yo9zmOAS77feJ7cT93jJTTYi9MIAgnEkbu9om/SMt4KStr7jm
         Qdkgs+ZzJgc5/01ilBdfXlefq7sVc0BqexyeDQTof7ub9fGjlKFNSEsE59lOPy9ZaJ48
         hBTBBLZ3Qky6yJJjwDG3Ltzl6BQ78SNu7NQUYvfrgQz7kChefLke5GzvAtXflHSqNeze
         pVpg==
X-Gm-Message-State: AOAM532/RJ2bL3dSGA5M1EWSOruIlE68ShnH31WsuwCK3Sqh8FZJY4mb
        BZPbe20QxxXcoN1ueRKkwcJuXql2VbqeHksfN/OrmA==
X-Google-Smtp-Source: ABdhPJw8FlL5flBN8UKGv2Ytl7fRld47EDaX0RjIibn23UBr+CVj3m34UcaHSCn4L0eFgSgFRwvJl6oK4wC2nEgDyQ4=
X-Received: by 2002:a05:6902:4b2:: with SMTP id r18mr6636440ybs.446.1623319488149;
 Thu, 10 Jun 2021 03:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <1623058534-78782-1-git-send-email-chengshuyi@linux.alibaba.com>
 <CANn89iLNf+73MsPH7O7wX3PrN26FVLcjw_SmsN6jNwnjrYg4KQ@mail.gmail.com>
 <0e938649-986d-ce79-e3c4-1f29bdcb64e0@linux.alibaba.com> <CANn89iKnT5Ebk5vovFJKHY4Fe7ERkN3ak_Nkqyc=vXL=VWvyPg@mail.gmail.com>
 <258e3c94-f479-509c-a4b0-5a881779dd14@linux.alibaba.com>
In-Reply-To: <258e3c94-f479-509c-a4b0-5a881779dd14@linux.alibaba.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Thu, 10 Jun 2021 12:04:37 +0200
Message-ID: <CANn89iL8bkiJdDH110U5uD4mSJM7v9fU8xFa9BXAu4wCf+y13Q@mail.gmail.com>
Subject: Re: [PATCH net-next] net: tcp: Updating MSS, when the sending window
 is smaller than MSS.
To:     Shuyi Cheng <chengshuyi@linux.alibaba.com>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Mao Wenan <wenan.mao@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 10, 2021 at 8:00 AM Shuyi Cheng
<chengshuyi@linux.alibaba.com> wrote:

> Thank you very much for your reply!
>
> Maybe it's not clear enough that I described it. The scenario where the
> above problem occurs is precisely because the tcp server sets the size
> of RCVBUFF to be smaller after the connection is established. Here is a
> sample code that caused the problem.
>
> # default tcp_rmem is 87380

Except that this value is overridden at connection establishment.

tcp_rmem[1] is only a floor value, say if you want a reasonable value
even if MSS == 100

> tcpServerSocket= socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> tcpServerSocket.bind(server_addr)
> tcpServerSocket.listen()
> while True:
>      connection,client_addr = tcpServerSocket.accept()
>      # Shrink rmem
>      connection.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 16*1024)
>
> Therefore, when the developer calls the sock_setsockopt function to
> reset RCVBUF, we can use sock to determine the TCP state. When in the
> connected state, it is not allowed to set RCVBUF smaller than mss.
>

Sure, but the application can _also_ set SO_RCVBUF before listen() or connect()

We can not have assumptions about SO_RCVBUF values and socket states.
Otherwise we would have to add some sk_rcvbuf adjustments every time
the socket state is changed.
