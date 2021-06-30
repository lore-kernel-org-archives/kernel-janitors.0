Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D418C11F65
	for <kernel-janitors@archiver.kernel.org>; Wed, 30 Jun 2021 13:05:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4365461466
	for <kernel-janitors@archiver.kernel.org>; Wed, 30 Jun 2021 13:05:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234833AbhF3NIR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 30 Jun 2021 09:08:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:53392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234804AbhF3NIQ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Jun 2021 09:08:16 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9BA161455;
        Wed, 30 Jun 2021 13:05:46 +0000 (UTC)
Date:   Wed, 30 Jun 2021 09:05:44 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Bristot de Oliveira <bristot@redhat.com>
Cc:     Colin King <colin.king@canonical.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH][next] trace: osnoise: Fix u64 less than zero comparison
Message-ID: <20210630090544.13c0a4df@oasis.local.home>
In-Reply-To: <c74e711e-71c9-df9c-8406-b9e92ef12da0@redhat.com>
References: <20210629165245.42157-1-colin.king@canonical.com>
        <c74e711e-71c9-df9c-8406-b9e92ef12da0@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 29 Jun 2021 19:19:25 +0200
Daniel Bristot de Oliveira <bristot@redhat.com> wrote:

> > Addresses-Coverity: ("Unsigned compared against 0")
> > Fixes: bce29ac9ce0b ("trace: Add osnoise tracer")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>  
> 
> Steven, can we merge the flags?

I don't usually do that. I just take the first patch that I apply.

This isn't that complex of a patch, do we need to do this?

-- Steve
