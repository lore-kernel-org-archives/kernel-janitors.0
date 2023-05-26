Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268CBC7EE23
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 13:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243593AbjEZNSr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 09:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjEZNSq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 09:18:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CBD1A2
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 06:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685107078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zUxuiTkmrqzvmRW/UGh5uDZ4UTdPNuTS5RrZxEmFp2s=;
        b=IS+ceqYFRiFl6z5u/8mXJV33Z2VnPRFfB+K184mOF6W3wgD+2iY8ymgEv/uf+DvU1ZfjIB
        0G7P4EvhUBeHX797MwoH4VNfmnaKAAw7B8PlaC1j/CJBcge7/xrlD7lCSE3pmT5FMoIq4q
        mjLP7I/5tmX8Bc6Lgns3GlSZas1Q+0o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-eLmHSUJhNXqBsqVeWvlDKg-1; Fri, 26 May 2023 09:17:56 -0400
X-MC-Unique: eLmHSUJhNXqBsqVeWvlDKg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7682F29A9D50;
        Fri, 26 May 2023 13:17:41 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.39.192.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B0AEA492B0B;
        Fri, 26 May 2023 13:17:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <99284df8-9190-4deb-ad7c-c0557614a1c8@kili.mountain>
References: <99284df8-9190-4deb-ad7c-c0557614a1c8@kili.mountain>
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
Subject: Re: [PATCH net-next] net: fix signedness bug in skb_splice_from_iter()
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <760141.1685107058.1@warthog.procyon.org.uk>
Date:   Fri, 26 May 2023 14:17:38 +0100
Message-ID: <760142.1685107058@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@linaro.org> wrote:

>  	while (iter->count > 0) {
>  		ssize_t space, nr;
> -		size_t off, len;
> +		ssize_t len;
> +		size_t off;

Good point, but why not just move len onto the preceding line?

 	while (iter->count > 0) {
-		ssize_t space, nr;
-		size_t off, len;
+		ssize_t space, nr, len;
+		size_t off;

David

