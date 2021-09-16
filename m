Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227D4C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Sep 2021 17:08:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0681F61029
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Sep 2021 17:08:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344764AbhIPRJE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Sep 2021 13:09:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:20266 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245389AbhIPRHD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Sep 2021 13:07:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631811942; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=DmiPM4+DKVgRQ+kqBq5DPFD0G7lXMNZyxKHvSLKf5RQ=; b=ZsMIGVSLTAR1wZwAwiKPrf/agPSlYaD2dPJ4OSjr9JZ/IpxQ4K0svE7ZbS7oQztE6+Y1tGxU
 TXNhuz2nD5KxlHHmMVtKmLdyMn1Wqh4zuHJ/t004YfHCJO1B5n414cbNRkn0x1s5PzISXZ9h
 i6A1P1g/U35UclnRSCT5ZKiv43Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61437957e0f78151d65a15c4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 17:05:27
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 77DCEC359F8; Thu, 16 Sep 2021 17:05:27 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D06CCC359F4;
        Thu, 16 Sep 2021 17:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D06CCC359F4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Luca Coelho <luciano.coelho@intel.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
        Mordechay Goodstein <mordechay.goodstein@intel.com>,
        Sara Sharon <sara.sharon@intel.com>,
        Naftali Goldstein <naftali.goldstein@intel.com>,
        Dan Halperin <Dan1.Halperin@intel.com>,
        linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] iwlwifi: mvm: d3: Fix off by ones in iwl_mvm_wowlan_get_rsc_v5_data()
References: <20210831081802.GA9846@kili>
Date:   Thu, 16 Sep 2021 20:05:19 +0300
In-Reply-To: <20210831081802.GA9846@kili> (Dan Carpenter's message of "Tue, 31
        Aug 2021 11:18:02 +0300")
Message-ID: <87bl4sxxgw.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> These should be >= ARRAY_SIZE() instead of > ARRAY_SIZE() to prevent an
> out of bounds write on the next line.
>
> Fixes: 79e561f0f05a ("iwlwifi: mvm: d3: implement RSC command version 5")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I think I should take both patches to v5.15. Luca, do you agree? Ack?

I assigned these to me on patchwork.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
