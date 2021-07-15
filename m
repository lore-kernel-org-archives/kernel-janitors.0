Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27318C07E96
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Jul 2021 16:53:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10A17613EB
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Jul 2021 16:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235928AbhGOQ4f (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Jul 2021 12:56:35 -0400
Received: from foss.arm.com ([217.140.110.172]:55170 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229695AbhGOQ4f (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Jul 2021 12:56:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60D286D;
        Thu, 15 Jul 2021 09:53:41 -0700 (PDT)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93E883F7D8;
        Thu, 15 Jul 2021 09:53:40 -0700 (PDT)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Colin King <colin.king@canonical.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] smpboot: remove inline from __always_inline'd function idle_init
In-Reply-To: <20210715164018.62712-1-colin.king@canonical.com>
References: <20210715164018.62712-1-colin.king@canonical.com>
Date:   Thu, 15 Jul 2021 17:53:34 +0100
Message-ID: <87czrjmsc1.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 15/07/21 17:40, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Declaring a idle_init as inline when it is __always_inline is redundant
> so this can be removed. Also swap the order of __always_inline and void
> to match the more usual coding style.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
