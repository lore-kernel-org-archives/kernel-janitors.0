Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39F9CDB47E
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 Oct 2023 11:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbjJMLop (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 Oct 2023 07:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjJMLop (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Oct 2023 07:44:45 -0400
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB48A9
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Oct 2023 04:44:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by a.mx.secunet.com (Postfix) with ESMTP id 58C51207B3;
        Fri, 13 Oct 2023 13:44:41 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
        by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3scqEpFXX8PO; Fri, 13 Oct 2023 13:44:40 +0200 (CEST)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by a.mx.secunet.com (Postfix) with ESMTPS id E0623206F0;
        Fri, 13 Oct 2023 13:44:40 +0200 (CEST)
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
        by mailout1.secunet.com (Postfix) with ESMTP id D4FA980004A;
        Fri, 13 Oct 2023 13:44:40 +0200 (CEST)
Received: from mbx-essen-02.secunet.de (10.53.40.198) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 13:44:40 +0200
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-02.secunet.de
 (10.53.40.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 13 Oct
 2023 13:44:40 +0200
Received: by gauss2.secunet.de (Postfix, from userid 1000)
        id D225131840FD; Fri, 13 Oct 2023 13:44:39 +0200 (CEST)
Date:   Fri, 13 Oct 2023 13:44:39 +0200
From:   Steffen Klassert <steffen.klassert@secunet.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] xfrm: Support GRO for IPv4 ESP in UDP encapsulation
Message-ID: <ZSktpwdmL3ZDp4yI@gauss3.secunet.de>
References: <8a3f05b4-bde7-4a5e-86be-e1f402907ab0@moroto.mountain>
 <4b8c8474-280b-4715-b2f2-53301ac991e7@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4b8c8474-280b-4715-b2f2-53301ac991e7@kadam.mountain>
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-02.secunet.de (10.53.40.198)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Oct 11, 2023 at 01:16:33PM +0300, Dan Carpenter wrote:
> On Wed, Oct 11, 2023 at 12:57:52PM +0300, Dan Carpenter wrote:
> > Hello Steffen Klassert,
> > 
> > The patch 172bf009c18d: "xfrm: Support GRO for IPv4 ESP in UDP
> > encapsulation" from Oct 4, 2023 (linux-next), leads to the following
> > Smatch static checker warning:
> > 
> > 	net/ipv6/xfrm6_input.c:174 xfrm6_udp_encap_rcv()
> > 	warn: passing freed memory 'skb'
> > 
> > net/ipv6/xfrm6_input.c
> >     168 int xfrm6_udp_encap_rcv(struct sock *sk, struct sk_buff *skb)
> >     169 {
> >     170         int ret;
> >     171 
> >     172         ret = __xfrm6_udp_encap_rcv(sk, skb, true);
> > 
> > The xfrm4_udp_encap_rcv() function frees skb and returns zero.
> > 
> >     173         if (!ret)
> > --> 174                 return xfrm6_rcv_encap(skb, IPPROTO_ESP, 0,
> >                                                ^^^
> > Use after free
> > 
> 
> This generated warnings for the other places that call
> __xfrm6_udp_encap_rcv() as well.

I see what it is. We can't call xfrm4_udp_encap_rcv from
__xfrm6_udp_encap_rcv as we currently do it

I'll send a fix at the beginning of the next week.

Thanks a lot for the report!
