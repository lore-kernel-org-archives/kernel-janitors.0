Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C46C4332F
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Nov 2022 12:00:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239836AbiKQMAv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 17 Nov 2022 07:00:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbiKQMAr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Nov 2022 07:00:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C8C5ADE1
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Nov 2022 03:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668686387;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NPf1RG+wCb7clBGA38jNh+ZPSc1moikSLN57Kq5O9Bs=;
        b=HRm4jp2NM9D/LNfyTVy+yfmfN4EsomFdeH5r6QIUnjgz3KRA8Z0I5+oxEUuBCs6fJuhuU3
        OeG7H1YAxyxD94Only1nFBnqL0kbaRTMkPPLCDzT3vhJLWXq4nGO1WLeU+PfyJqVXxSlSG
        6O0KXEjG4J9kmI6WR8To0RxmL9ItuBw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-qbEPj9JGO7ylkfBZD0NLwQ-1; Thu, 17 Nov 2022 06:59:37 -0500
X-MC-Unique: qbEPj9JGO7ylkfBZD0NLwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DB52811E67;
        Thu, 17 Nov 2022 11:59:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 40CB6111E3ED;
        Thu, 17 Nov 2022 11:59:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <Y3YOUQM/ldDe/sgC@kadam>
References: <Y3YOUQM/ldDe/sgC@kadam> <Y3XmQsOFwTHUBSLU@kili> <3475095.1668678264@warthog.procyon.org.uk>
To:     Dan Carpenter <error27@gmail.com>
Cc:     dhowells@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-afs@lists.infradead.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] rxrpc: uninitialized variable in rxrpc_send_ack_packet()
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3708247.1668686372.1@warthog.procyon.org.uk>
Date:   Thu, 17 Nov 2022 11:59:32 +0000
Message-ID: <3708248.1668686372@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <error27@gmail.com> wrote:

> We disabled GCC's check for uninitialized variables.  It could be that
> you have the .config to automatically zero out stack variables.
> 
> CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
> CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
> CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y

Ah.  Is there a way to reenable that?

David

