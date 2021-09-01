Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDABC432BE
	for <kernel-janitors@archiver.kernel.org>; Wed,  1 Sep 2021 18:26:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3DF360F92
	for <kernel-janitors@archiver.kernel.org>; Wed,  1 Sep 2021 18:26:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhIAS1k (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 1 Sep 2021 14:27:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40814 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbhIAS1j (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Sep 2021 14:27:39 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 924CB1F43FDB
Subject: Re: [PATCH][next] futex: fix assigned ret variable that is never read
To:     Colin King <colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Darren Hart <dvhart@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>
References: <20210818131840.34262-1-colin.king@canonical.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <5682c44f-3a02-c2b1-25d3-36db34b00356@collabora.com>
Date:   Wed, 1 Sep 2021 15:26:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818131840.34262-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

Às 10:18 de 18/08/21, Colin King escreveu:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check on the rt_waiter and top_waiter->pi_state is
> assigning an error return code to ret but this later gets re-assigned,
> hence the check is currently ineffective. I believe the original
> intent was to return -EINVAL rather than assign it to ret. Fix this.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: dc7109aaa233 ("futex: Validate waiter correctly in futex_proxy_trylock_atomic()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>> ---

Reviewed-by: André Almeida <andrealmeid@collabora.com>
