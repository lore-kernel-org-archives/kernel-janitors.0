Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21719C4332F
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Dec 2022 12:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbiLHMtn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Dec 2022 07:49:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiLHMtl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Dec 2022 07:49:41 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7091F63D69;
        Thu,  8 Dec 2022 04:49:41 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrg6QQkz4xYQ;
        Thu,  8 Dec 2022 23:49:39 +1100 (AEDT)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Paul Mackerras <paulus@samba.org>
Cc:     linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <52e843a460bc374973149b8da0bd04f9761b80b7.1657382184.git.christophe.jaillet@wanadoo.fr>
References: <52e843a460bc374973149b8da0bd04f9761b80b7.1657382184.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Use the bitmap API to allocate bitmaps
Message-Id: <167050315701.1457988.18073290985698209430.b4-ty@ellerman.id.au>
Date:   Thu, 08 Dec 2022 23:39:17 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 9 Jul 2022 17:56:43 +0200, Christophe JAILLET wrote:
> Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.
> 
> It is less verbose and it improves the semantic.
> 
> 

Applied to powerpc/next.

[1/1] KVM: PPC: Book3S HV: Use the bitmap API to allocate bitmaps
      https://git.kernel.org/powerpc/c/a96b20758b23be7e9f693218908228d6100c3c26

cheers
