Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F9FC43460
	for <kernel-janitors@archiver.kernel.org>; Sat, 17 Apr 2021 17:29:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5D2B6137D
	for <kernel-janitors@archiver.kernel.org>; Sat, 17 Apr 2021 17:29:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236773AbhDQRaO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 17 Apr 2021 13:30:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24085 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236807AbhDQRaN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 17 Apr 2021 13:30:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618680586; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Tmnmg/FcPCjv/KgppzdIIzcrR9RSKgPcm0+i3Ofk8ng=;
 b=tXiJK69NADeQ1IljLRhbW+Zci3A6WRCS8IlkbAb+zcmDkC1ygOLH8H5uj1TtoSDyujY+BlGV
 AYUK/z8H+rt/NRCfK6v4j/PuSlVW5dcHgdPq4yoQFDvTAOLv+D7YhZ4NrBZnZTH+ksD2VZl5
 8neJHEIYi67zvksTRq7nD9I1Qn4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 607b1b08febcffa80f288d93 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 17 Apr 2021 17:29:44
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 469CEC4338A; Sat, 17 Apr 2021 17:29:44 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E29BCC433F1;
        Sat, 17 Apr 2021 17:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E29BCC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] rtlwifi: remove redundant assignment to variable err
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210327230014.25554-1-colin.king@canonical.com>
References: <20210327230014.25554-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Ping-Ke Shih <pkshih@realtek.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210417172944.469CEC4338A@smtp.codeaurora.org>
Date:   Sat, 17 Apr 2021 17:29:44 +0000 (UTC)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable err is assigned -ENODEV followed by an error return path
> via label error_out that does not access the variable and returns
> with the -ENODEV error return code. The assignment to err is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

87431bc1f0f6 rtlwifi: remove redundant assignment to variable err

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210327230014.25554-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

