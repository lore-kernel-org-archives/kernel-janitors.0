Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2ADC432BE
	for <kernel-janitors@archiver.kernel.org>; Sun, 29 Aug 2021 08:32:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EEF960F42
	for <kernel-janitors@archiver.kernel.org>; Sun, 29 Aug 2021 08:32:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234835AbhH2IdI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 29 Aug 2021 04:33:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50590 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234788AbhH2IdH (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 29 Aug 2021 04:33:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630225936; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=sDPTy8KAE9CIK5/hJskuePHV4t04MtL3PTjzg1WFFFE=;
 b=GI0IXmTbiwBWUI4jsB8jZHX0Yfj43sLQ347ZT0POU9iVM+HW5Zam/qow9SjtVXflX92p5bm8
 Uef6o9ngb1Sxb8N/O0yXECs7aA23U7cBd8mAoANxzszyMT+TAcUdQSAGf2hNndzVQwvzYdLP
 DA2Htq8lMthLAz6dq9QH4v71v9U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 612b460f40d2129ac1b87136 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 29 Aug 2021 08:32:15
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90630C43617; Sun, 29 Aug 2021 08:32:15 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9F7DFC4338F;
        Sun, 29 Aug 2021 08:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9F7DFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] rsi: make array fsm_state static const,
 makes object smaller
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210819125018.8577-1-colin.king@canonical.com>
References: <20210819125018.8577-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Amitkumar Karwar <amitkarwar@gmail.com>,
        Siva Rebbagondla <siva8118@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210829083215.90630C43617@smtp.codeaurora.org>
Date:   Sun, 29 Aug 2021 08:32:15 +0000 (UTC)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array fsm_state on the stack but instead it
> static const. Makes the object code smaller by 154 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    9213	   3904	      0	  13117	   333d	.../wireless/rsi/rsi_91x_debugfs.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    8995	   3968	      0	  12963	   32a3	.../wireless/rsi/rsi_91x_debugfs.o
> 
> (gcc version 10.3.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

f4c813641897 rsi: make array fsm_state static const, makes object smaller

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210819125018.8577-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

