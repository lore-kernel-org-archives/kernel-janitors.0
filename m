Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B49BC001DE
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Jul 2023 19:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236451AbjGNTgr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Jul 2023 15:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236245AbjGNTgq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Jul 2023 15:36:46 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D7BE4F
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jul 2023 12:36:46 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BC87F5BF;
        Fri, 14 Jul 2023 19:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BC87F5BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689363404; bh=Y6cx46rpyh4f4kwzVAMRkODbnECw1wEIsMHA+sJSiFk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rkhiCVGUzUcMHrD9BPxy+15/3RNrw4fFAeTTf5qCi2Tk89A1pkY8CVO1+U8PRPfuL
         WYo09QA9gPZdFOFqftdtEqsT/pGIVs2RMtQpdqQl2jmh2OZzEcVRchviTCojJzU+p/
         2c/a2rIkGjOAOgtWg6it4AsuygjqthETJ6r1UG+Qi3bsnDbYZLBIS1CSidlvi0231K
         BigK+Z/XGzhE8CKF2NGFfjURfNonotxadSMwCSDbnJexDZiTKkDbYFkTs5TC8eUThk
         abwSapIoq2P9gYohspDzVCpyD5dU7VR5I1MgtYOrJLoZbSczwAt2KD0VfPtswcJs9h
         gBVb2XhGeiPxA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: deprecated.rst: Update an example
In-Reply-To: <3484e46180dd2cf05d993ff1a78b481bc2ad1f71.1687723931.git.christophe.jaillet@wanadoo.fr>
References: <3484e46180dd2cf05d993ff1a78b481bc2ad1f71.1687723931.git.christophe.jaillet@wanadoo.fr>
Date:   Fri, 14 Jul 2023 13:36:44 -0600
Message-ID: <875y6mz3n7.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

> vmalloc() has a 2-factor form. It is vmalloc_array().
> So use another function as an example.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  Documentation/process/deprecated.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

jon
