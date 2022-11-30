Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604A1C433FE
	for <kernel-janitors@archiver.kernel.org>; Wed, 30 Nov 2022 09:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbiK3Jbo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 30 Nov 2022 04:31:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233830AbiK3Jbb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Nov 2022 04:31:31 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46C137231;
        Wed, 30 Nov 2022 01:31:30 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqj38mfz4xQr;
        Wed, 30 Nov 2022 20:31:29 +1100 (AEDT)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <7b8b5915a2c7c1616b33e8433ebe0a0bf07070a2.1665312579.git.christophe.jaillet@wanadoo.fr>
References: <7b8b5915a2c7c1616b33e8433ebe0a0bf07070a2.1665312579.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] powerpc/sysdev: Remove some duplicate prefix in some messages
Message-Id: <166980024656.3017288.14591621572057347121.b4-ty@ellerman.id.au>
Date:   Wed, 30 Nov 2022 20:24:06 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 9 Oct 2022 12:49:50 +0200, Christophe JAILLET wrote:
> At the beginning of the file, we have:
>    #define pr_fmt(fmt) "xive: " fmt
> 
> So, there is no need to duplicate "XIVE:" in debug and error messages.
> 
> For the records, these useless prefix have been added in commit
> 5af50993850a ("KVM: PPC: Book3S HV: Native usage of the XIVE interrupt
> controller")
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/sysdev: Remove some duplicate prefix in some messages
      https://git.kernel.org/powerpc/c/2cb1dfac6f792f9e4a092793215f0d26e9f8d5b2

cheers
