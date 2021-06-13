Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8801CC48BE8
	for <kernel-janitors@archiver.kernel.org>; Sun, 13 Jun 2021 23:01:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5121B61029
	for <kernel-janitors@archiver.kernel.org>; Sun, 13 Jun 2021 23:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbhFMXDd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 13 Jun 2021 19:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbhFMXDc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 13 Jun 2021 19:03:32 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC83C061574
        for <kernel-janitors@vger.kernel.org>; Sun, 13 Jun 2021 16:01:30 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 88AFF2C0;
        Sun, 13 Jun 2021 23:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 88AFF2C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1623625289; bh=HWkZpAy5GiOoN68yg+PWLteE0HW8b27h8nvWJlsf8eA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=EiHDn/sLws+3m2QZ+U59ozfFVdCtGEVSsiPlJgpORScQp/CQYsbcvmkKihOE4c6hi
         HTj79QzErZBrQkypZBXm501SlJWCk/DgDcEQLsPT393snleeN8SX85Ced8/2ws9EVX
         WUZdn3UC8NTFrv3yek6HZ57M9JMkXBM3GU2qjQP9bXSjwxfzsmdQmAriGhgF5AzJpw
         P90ZV6ESrjSmpzWCbbYqhcI9Wnhni8JEIkwM8sv3b21Ff84+5yy+zCdT7KgidFp2cs
         aALXTNOvilkxMqwClOG7rs7DiIu6FSEOklaRsRfbv1dsh6XAe2xvSPS43ISUYje1IU
         QZRvnw/Fi4Bwg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Colin King <colin.king@canonical.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mathieu Chouquet-Stringer <me@mathieu.digital>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: Fix "the the" in a message in kernel-chktaint
In-Reply-To: <20210613202059.80403-1-colin.king@canonical.com>
References: <20210613202059.80403-1-colin.king@canonical.com>
Date:   Sun, 13 Jun 2021 17:01:29 -0600
Message-ID: <87sg1lbc8m.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> There is a double "the" in a message in kernel-chktaint, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/debugging/kernel-chktaint | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/debugging/kernel-chktaint b/tools/debugging/kernel-chktaint
> index 719f18b1edf0..f1af27ce9f20 100755
> --- a/tools/debugging/kernel-chktaint
> +++ b/tools/debugging/kernel-chktaint
> @@ -196,7 +196,7 @@ else
>  fi
>  
>  echo "For a more detailed explanation of the various taint flags see"
> -echo " Documentation/admin-guide/tainted-kernels.rst in the the Linux kernel sources"
> +echo " Documentation/admin-guide/tainted-kernels.rst in the Linux kernel sources"

Applied, thanks.

jon
