Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EC8C0015E
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 Jul 2023 05:34:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjGCFeg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jul 2023 01:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjGCFef (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jul 2023 01:34:35 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F8A180;
        Sun,  2 Jul 2023 22:34:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZP50w9Cz4wxq;
        Mon,  3 Jul 2023 15:34:33 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Oliver O'Halloran <oohall@gmail.com>,
        linuxppc-dev@lists.ozlabs.org,
        Colin Ian King <colin.i.king@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230608095849.1147969-1-colin.i.king@gmail.com>
References: <20230608095849.1147969-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] powerpc/powernv/sriov: perform null check on iov before dereferencing iov
Message-Id: <168836201891.50010.6948846603017935484.b4-ty@ellerman.id.au>
Date:   Mon, 03 Jul 2023 15:26:58 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 08 Jun 2023 10:58:49 +0100, Colin Ian King wrote:
> Currently pointer iov is being dereferenced before the null check of iov
> which can lead to null pointer dereference errors. Fix this by moving the
> iov null check before the dereferencing.
> 
> Detected using cppcheck static analysis:
> linux/arch/powerpc/platforms/powernv/pci-sriov.c:597:12: warning: Either
> the condition '!iov' is redundant or there is possible null pointer
> dereference: iov. [nullPointerRedundantCheck]
>  num_vfs = iov->num_vfs;
>            ^
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powernv/sriov: perform null check on iov before dereferencing iov
      https://git.kernel.org/powerpc/c/f4f913c980bc6abe0ccfe88fe3909c125afe4a2d

cheers
