Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D859C49EA5
	for <kernel-janitors@archiver.kernel.org>; Sat, 26 Jun 2021 09:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D2B561621
	for <kernel-janitors@archiver.kernel.org>; Sat, 26 Jun 2021 09:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhFZJqh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 26 Jun 2021 05:46:37 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:21695 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhFZJqh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 26 Jun 2021 05:46:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624700655; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=cSDl8dR93NgooM2/ky6hGtUFG2ZSdKncVi+7WtxljEM=; b=lEDnLlT24WEDctDLhFaegZuzIOVsum+URRtFdytpyK1QHp1/gJFSWGyBXvdYVXDrYUXXRPZJ
 VbbbCHnpHXdtvaWj+gPlWCsAp+vsQDw4ch/e/GUq5Zj9nUKfRQwWYq0fi9xnY+UXOsDLKj1+
 VIlNna+cT4cNTinH1D6YUwr+zEE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60d6f6ea7b2963a2823e3bdd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 26 Jun 2021 09:44:10
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E26F2C4323A; Sat, 26 Jun 2021 09:44:09 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B83CC433F1;
        Sat, 26 Jun 2021 09:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B83CC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mt76: mt7915: fix info leak in mt7915_mcu_set_pre_cal()
References: <YNXvLvrvllpXgCIn@mwanda>
Date:   Sat, 26 Jun 2021 12:43:59 +0300
In-Reply-To: <YNXvLvrvllpXgCIn@mwanda> (Dan Carpenter's message of "Fri, 25
        Jun 2021 17:58:54 +0300")
Message-ID: <874kdlj6zk.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Zero out all the unused members of "req" so that we don't disclose
> stack information.
>
> Fixes: 495184ac91bb ("mt76: mt7915: add support for applying pre-calibration data")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Felix, should I take this directly to wireless-drivers? If yes, please
ack.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
