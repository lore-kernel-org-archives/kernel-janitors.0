Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0C2C19F2B
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Jul 2022 15:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbiG1P4q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 28 Jul 2022 11:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbiG1P4W (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Jul 2022 11:56:22 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D95061D48
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Jul 2022 08:56:22 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6EBDF21F;
        Thu, 28 Jul 2022 15:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6EBDF21F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1659023780; bh=Fdz/aB00PMrpIGOtZ/f4nnm4cHA+314fJvDTvpvlkbY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=aO7nC7rNH86DCNoWuAYMNivOT6HBQkFj8b/fK+OtZ7gCUv+1XjcFsZpNfeB7ePNCf
         2Vm3pzw7efIR+opcI1xOS5s+ONzJmQ8J54oXor/6CwzUuAhMj/Fz0uNU7M1DNgBR6q
         go97rDcBgU/Q30dXNKtmSrgSvH6qdD7hpSV2+n4aj8gjVY8HkMLEASAv2yqGHAOt/W
         /6DTT2Fs0m3RcHSDdkJ0ng9cUMoX56kjpNxYLgzPxL3ug3eIiUL6OnLK20mcO9wqTk
         mDq8qT43QKIQbG4bsfoe+qbDtildb4h1p7FKJ59cXMvenJBbExVo+q0tIR3MeatSSq
         SSpilxR2LNwpw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [RFC PATCH 0/2] Rework the kernel's README.rst
In-Reply-To: <20220720041325.15693-1-lukas.bulwahn@gmail.com>
References: <20220720041325.15693-1-lukas.bulwahn@gmail.com>
Date:   Thu, 28 Jul 2022 09:56:19 -0600
Message-ID: <87czdpb598.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> As far as I see, the README.rst file in Documentation/admin-guide/ covers
> three rather outdated (or subsumed) aspects:
>
>   1. mentioning that it is possible to "run a.out user programs with this kernel"
>
>   2. how to report a kernel bug
>
>   3. the explanations around the use of LILO as a boot loader
>
> This patch series addressed the first two aspects; the third one simply
> first needs some more experimenting/experience on my side to update
> the description of the setup with a GRUB boot loader.
>
> I am happy if anyone else contributes or helps with this rework task on
> the third aspect.
>
> I am also adding Linus as recipient, as he seems to be the original author,
> i.e., in the text, 'me' refers to Linus.
>
> Please let me know if you are generally fine with this approach, and
> if there is something on the other documentation to be done to get this
> patch accepted.

The changes seem fine to me; I'll apply them after the merge window if
nobody objects.

Longer term it's probably worth thinking about what the README.rst file
is for.  It seems like we should have one starting point for somebody's
first encounter with the docs; that would likely either be this file or
Documentation/index.rst but not both.  I keep meaning to try to improve
the initial documentation experience, but haven't found the time yet...

Thanks,

jon
