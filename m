Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34920C07E95
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Jul 2021 13:58:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14500613E0
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Jul 2021 13:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhGDOA7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Jul 2021 10:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbhGDOA7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Jul 2021 10:00:59 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBA8C061762;
        Sun,  4 Jul 2021 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=g3hdydJBFBCCn6JqsBFpj8zYz33IDGPm9BzSUODFtSQ=; b=qceaWP8bXu3aVqs4WLzfLLbJBP
        C+ZE6vZOXqoJ/HoZn7a23A4uT2p/AaZnrDBpNWcWp6pZjOFMvaaneZNjbpP9G7R0VlydXZA4lsJFk
        lntHShrjl9besVKQJyq5+Cns60cdCdwI48vn/Sl4eUi1H7r0mdZt9Gq1qqYfkfgSgVu3LQzDWRhBr
        JVE21lpsJbImbN91L/3Jw/8f55BS548FQKplksrVtXnFUoHcRuFhwwdJZTjTy/7Z+t1MKTJCh4KIE
        sdST6UdwXX7mtdmAS8690tXhoSA85hyt4GrP1fVJnXM4A1qnPkeGl5fnT3M5uEvAC1LBg3M+CBiz2
        ygC8Dvsg==;
Received: from [2602:306:c5a2:a380:d5cf:ef86:a560:3f26]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m02dM-009Lo8-H9; Sun, 04 Jul 2021 13:58:13 +0000
Subject: Re: [PATCH] powerpc: Fix spelling mistake "mesages" -> "messages" in
 Kconfig
To:     Colin King <colin.king@canonical.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210704093846.36972-1-colin.king@canonical.com>
From:   Geoff Levand <geoff@infradead.org>
Message-ID: <95c59476-7c97-d689-4a64-06666e25891b@infradead.org>
Date:   Sun, 4 Jul 2021 06:58:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704093846.36972-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 7/4/21 2:38 AM, Colin King wrote:
> -	  Enables more verbose log mesages for LV1 hypercall results.
> +	  Enables more verbose log messages for LV1 hypercall results.

Looks good.  Thanks.

Acked by: Geoff Levand <geoff@infradead.org>
