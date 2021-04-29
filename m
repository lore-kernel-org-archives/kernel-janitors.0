Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073F8C433B4
	for <kernel-janitors@archiver.kernel.org>; Thu, 29 Apr 2021 14:02:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB11361400
	for <kernel-janitors@archiver.kernel.org>; Thu, 29 Apr 2021 14:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239269AbhD2ODR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 29 Apr 2021 10:03:17 -0400
Received: from ozlabs.org ([203.11.71.1]:33923 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238846AbhD2ODQ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 29 Apr 2021 10:03:16 -0400
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4FWHJ36Hwsz9t1r; Fri, 30 Apr 2021 00:02:27 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Colin King <colin.king@canonical.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Paul Mackerras <paulus@samba.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20201216113608.11812-1-colin.king@canonical.com>
References: <20201216113608.11812-1-colin.king@canonical.com>
Subject: Re: [PATCH] powerpc/44x: fix spelling mistake in Kconfig "varients" -> "variants"
Message-Id: <161970488570.4033873.12486603627255933756.b4-ty@ellerman.id.au>
Date:   Fri, 30 Apr 2021 00:01:25 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 16 Dec 2020 11:36:08 +0000, Colin King wrote:
> There is a spelling mistake in the Kconfig help text. Fix it.

Applied to powerpc/next.

[1/1] powerpc/44x: fix spelling mistake in Kconfig "varients" -> "variants"
      https://git.kernel.org/powerpc/c/ee6b25fa7c037e42cc5f3b5c024b2a779edab6dd

cheers
