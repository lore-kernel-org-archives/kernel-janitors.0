Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2664C433ED
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 May 2021 22:42:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0D8A61186
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 May 2021 22:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbhECWmy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 May 2021 18:42:54 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:44738 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhECWmx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 May 2021 18:42:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620081720; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=e87KiAr/ZyTVFzb6IdygSWtuAVyaAu/iFNR5Z+8302c=; b=AWFu5dijRdYBX2JapBMvSPeAT88dkvjNQ76k9GfUM+C/D+l10HECvwvs76q5GPA2S7UNlzJk
 jUTob8qxc7CkRN0C4cyJXV25zBGJ+8zZklQfX72P3MLqGteIGiKGujNOPK8Zob36D67Varz1
 LrGJ+2l49rBMwbKhfS3EwIL2+o8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60907c238807bcde1d0224b8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 May 2021 22:41:39
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 508A1C433D3; Mon,  3 May 2021 22:41:39 +0000 (UTC)
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D78E7C433F1;
        Mon,  3 May 2021 22:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D78E7C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH -next] bus: mhi: pci_generic: Fix possible use-after-free
 in mhi_pci_remove()
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
References: <20210413160318.2003699-1-weiyongjun1@huawei.com>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <0048b760-cb55-9775-c175-05fe957b35aa@codeaurora.org>
Date:   Mon, 3 May 2021 15:41:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210413160318.2003699-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 4/13/21 9:03 AM, Wei Yongjun wrote:
> This driver's remove path calls del_timer(). However, that function
> does not wait until the timer handler finishes. This means that the
> timer handler may still be running after the driver's remove function
> has finished, which would result in a use-after-free.
> 
> Fix by calling del_timer_sync(), which makes sure the timer handler
> has finished, and unable to re-schedule itself.
> 
> Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Hemant kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
