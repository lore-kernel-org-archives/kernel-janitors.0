Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8424FC77B73
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 14:00:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237328AbjEZOAK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 10:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbjEZOAJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 10:00:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D66F3
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685109569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AZR+i/KA4SM5MJbNxGgeo60QfZYJs7gffgNmM3EOr+0=;
        b=Bq9sJ2AS63Bpq0+cAGexhWtnmp0k6DR1JhQKaQi7uOWxiJzrPyPggNFebNEBAxFuhQVkSm
        xyfTF1MVoIZhhQyF1EzrCC1XdowYnFRZhPF8KmING+UVCjCXEubxNOrxq/ycBPs9O5vztm
        H+qkZIpPPrha55E7wmtqOsqvFKtiIdU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-NAJcYUu3MISI0BN9tbIX4w-1; Fri, 26 May 2023 09:59:26 -0400
X-MC-Unique: NAJcYUu3MISI0BN9tbIX4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B145985A5A8;
        Fri, 26 May 2023 13:59:20 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.39.192.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 29A307C2A;
        Fri, 26 May 2023 13:59:17 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <366861a7-87c8-4bbf-9101-69dd41021d07@kili.mountain>
References: <366861a7-87c8-4bbf-9101-69dd41021d07@kili.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     dhowells@redhat.com, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Alexander Duyck <alexanderduyck@fb.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Jiri Benc <jbenc@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: fix signedness bug in skb_splice_from_iter()
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <881536.1685109556.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 26 May 2023 14:59:16 +0100
Message-ID: <881537.1685109556@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> The "len" variable needs to be signed for the error handling to work
> correctly.
> =

> Fixes: 2e910b95329c ("net: Add a function to splice pages into an skbuff=
 for MSG_SPLICE_PAGES")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: David Howells <dhowells@redhat.com>

