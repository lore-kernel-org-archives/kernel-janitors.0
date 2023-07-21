Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0898EB64DD
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Jul 2023 19:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbjGUTqY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jul 2023 15:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjGUTqX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jul 2023 15:46:23 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0B01BDC;
        Fri, 21 Jul 2023 12:46:22 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4ABED733;
        Fri, 21 Jul 2023 19:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4ABED733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689968782; bh=/K4uQIPIc0ZhwtJmS7gFt1mOdFMRSAG483b8BljAZAQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=jjSOvsRmJgcMAMknrA+SplwPchMKYSZ9nzir1JFLjsG26b98TeKp2iBjvJiLoZwGD
         eGPJdLK/aoegPExq/NRqYZ+hRP9kqvoCRIO94GfJWhhlOUgLnHAG4Tgx9LEo5FVFBD
         NvjZoMKXEMHK/kgyBZKy1g8aymyFgwab0i2dih2QvJF/JDGCZjbvWEC1UBT8HQao6g
         Tf7nfnmABvSDYxs4Q9D4I3EPpc6P89aIKFgljGwaBZTZnFNk3Rkx/L0inZjLLjknnB
         zR3VHFthV3Sdp3hS0luj4KCMWVRYvGGi6Eh0GtFGt2/PbAjjc+QEdDOI67+DU0gDrH
         vTvrWu5NY9feQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Marc Dionne <marc.dionne@auristor.com>,
        linux-afs@lists.infradead.org, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] afs: Documentation: correct reference to CONFIG_AFS_FS
In-Reply-To: <20230720094301.9888-1-lukas.bulwahn@gmail.com>
References: <20230720094301.9888-1-lukas.bulwahn@gmail.com>
Date:   Fri, 21 Jul 2023 13:46:21 -0600
Message-ID: <877cqtdp4i.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> Commit 0795e7c031c4 ("[AFS]: Update the AFS fs documentation.") adds a new
> section listing the build configuration options that need to be enabled for
> the AFS file system.
>
> The documentation refers to CONFIG_AFS, but the option is called
> CONFIG_AFS_FS, since the beginning of Linux's git history.
>
> Refer to the config option with the correct name.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  Documentation/filesystems/afs.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

That does indeed appear to be the case ... applied, thanks.

jon
