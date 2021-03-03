Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C652C433DB
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3999B64DDA
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351468AbhCDAVM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:21:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28727 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239666AbhCCK0y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 05:26:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614767128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CV3tkp8merYe5w3jgDlwc9oNvGcc86ob13BJ0IDLoJA=;
        b=WPOSR0s6vxIqyUXXbbSd8UfI2PC8mW9SzmPDgmv9hPHyggY7FdSe4AiMtxzYWtpiSEjd9g
        hmv9omeXVOwY6r8EctKiRy7Rum513t8VzyCqdwUqbhSbanRF6B7ikwh4jDuXVZ+MpGSKSI
        v1KuWi1YLtHcWeLrnyiDTp80gpC4Mio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-_nJ8wJuPNCmgdVZduZEvbQ-1; Wed, 03 Mar 2021 03:23:25 -0500
X-MC-Unique: _nJ8wJuPNCmgdVZduZEvbQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E991100962A;
        Wed,  3 Mar 2021 08:23:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 356AE60BFA;
        Wed,  3 Mar 2021 08:23:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210303064028.895953-1-weiyongjun1@huawei.com>
References: <20210303064028.895953-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     dhowells@redhat.com, Hulk Robot <hulkci@huawei.com>,
        linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] afs: Remove unused variable in afs_req_issue_op()
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2025007.1614759802.1@warthog.procyon.org.uk>
Date:   Wed, 03 Mar 2021 08:23:22 +0000
Message-ID: <2025008.1614759802@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> GCC reports the following warning with W=1:
> 
> fs/afs/file.c:291:6: warning:
>  unused variable 'ret' [-Wunused-variable]
>   291 |  int ret;
>       |      ^~~
> 
> After commit 799fbdf96cd51, this variable is not used in function
> afs_req_issue_op(), so this commit remove it to fix the warning.
> 
> Fixes: 799fbdf96cd51 ("afs: Use new fscache read helper API")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

I've already fixed that and updated my branch, thanks.  linux-next should pick
it up on the next merging.

David

