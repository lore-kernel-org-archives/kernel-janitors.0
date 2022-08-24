Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36AEC32793
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Aug 2022 10:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbiHXKTk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 Aug 2022 06:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236712AbiHXKTb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Aug 2022 06:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751F074E19
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Aug 2022 03:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661336369;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VPCYtTaUZWpL796MsnlJYTznsS4pYxjYV+Pv2KRlCtI=;
        b=NtwlRcF8u/BcG5yeP2ErM7DItesoYVOQC+2O+Z6E4700xIXXNxSF2sLtMxIPulnt6ZOaqk
        ZUWBUX9chlLplfhIZvcovKbn/XJjYEb6g3Yac8QEHkilCVDiU6VF1P/RmGKBhENzF583Q8
        mohGcFHt9KXCSoY6uLGKmW9/aN3vju4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-5WK-AnyhMUS1qtFcUUl9XA-1; Wed, 24 Aug 2022 06:19:25 -0400
X-MC-Unique: 5WK-AnyhMUS1qtFcUUl9XA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E95E185A599;
        Wed, 24 Aug 2022 10:19:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D2D8418ECC;
        Wed, 24 Aug 2022 10:19:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20220818125038.2247720-1-sunke32@huawei.com>
References: <20220818125038.2247720-1-sunke32@huawei.com>
To:     Sun Ke <sunke32@huawei.com>
Cc:     dhowells@redhat.com, linux-cachefs@redhat.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, jefflexu@linux.alibaba.com
Subject: Re: [PATCH v3] cachefiles: fix error return code in cachefiles_ondemand_copen()
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3700078.1661336363.1@warthog.procyon.org.uk>
Date:   Wed, 24 Aug 2022 11:19:23 +0100
Message-ID: <3700079.1661336363@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

	/* fail OPEN request if copen format is invalid */
	ret = kstrtol(psize, 0, &size);
	if (ret) {
		req->error = ret;
		goto out;
	}

	/* fail OPEN request if daemon reports an error */
	if (size < 0) {
		if (!IS_ERR_VALUE(size))
			ret = size = -EINVAL;
		req->error = size;
		goto out;
	}

Should ret get set to the error in size?

David

