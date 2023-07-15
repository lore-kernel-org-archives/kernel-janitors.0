Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DC1EB64DC
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 Jul 2023 06:57:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbjGOG5k (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 15 Jul 2023 02:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjGOG5j (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 15 Jul 2023 02:57:39 -0400
X-Greylist: delayed 399 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 14 Jul 2023 23:57:37 PDT
Received: from mfwd17.mailplug.co.kr (mfwd17.mailplug.co.kr [211.253.10.228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BA830E2
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jul 2023 23:57:36 -0700 (PDT)
Received: (qmail 26068 invoked from network); 15 Jul 2023 15:50:54 +0900
Received: from m41.mailplug.com (121.156.118.41)
        by 0 (qmail 1.03 + mailplug 2.0) with SMTP;
        15 Jul 2023 15:49:54 +0900
Received: (qmail 2310969 invoked from network); 15 Jul 2023 15:49:54 +0900
Received: from unknown (HELO sslauth33) (lsahn@wewakecorp.com@211.252.87.40)
        by 0 (qmail 1.03 + mailplug 2.0) with SMTP;
        15 Jul 2023 15:49:54 +0900
Message-ID: <ea5b21e4-78e6-8639-b62f-58100e2bc138@wewakecorp.com>
Date:   Sat, 15 Jul 2023 15:49:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] fs: inode: return proper errno on bmap()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>
References: <20230715060217.1469690-1-lsahn@wewakecorp.com>
 <fa1386fb-04af-8037-2591-781f8723d564@web.de>
From:   Leesoo Ahn <lsahn@wewakecorp.com>
In-Reply-To: <fa1386fb-04af-8037-2591-781f8723d564@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



2023-07-15 오후 3:39에 Markus Elfring 이(가) 쓴 글:
>  > It better returns -EOPNOTSUPP instead of -EINVAL which has meaning of
>  > the argument is an inappropriate value. It doesn't make sense in the
>  > case of that a file system doesn't support bmap operation.
>  >
>  > -EINVAL could make confusion in the userspace perspective.
> 
> Are imperative change descriptions still preferred?
> 
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.5-rc1#n94
> 
> 
> How do you think about to use a subject like “[PATCH v2] fs: inode:
> Return proper error code in bmap()”?
> 
> 
> Please reconsider also the distribution of addresses in recipient lists.
> https://lore.kernel.org/lkml/20230715060217.1469690-1-lsahn@wewakecorp.com/
> 
> Regards,
> Markus

Thank you for the feedback.
I will post v2 patch soon

best regards,
Leesoo
