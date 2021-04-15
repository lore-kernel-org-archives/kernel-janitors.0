Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7B0C433B4
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Apr 2021 13:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB5D8611AC
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Apr 2021 13:22:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhDONWc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:22:32 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51674 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230056AbhDONWb (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Apr 2021 09:22:31 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13FDLjse004228;
        Thu, 15 Apr 2021 15:21:45 +0200
Date:   Thu, 15 Apr 2021 15:21:45 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Colin King <colin.king@canonical.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Denis Efremov <efremov@linux.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] floppy: remove redundant assignment to variable st
Message-ID: <20210415132145.GD2791@1wt.eu>
References: <20210415130020.1959951-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415130020.1959951-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Apr 15, 2021 at 02:00:20PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable st is being assigned a value that is never read and
> it is being updated later with a new value. The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Indeed you're right.

Acked-by: Willy Tarreau <w@1wt.eu>

Willy
