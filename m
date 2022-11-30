Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409A6C4708B
	for <kernel-janitors@archiver.kernel.org>; Wed, 30 Nov 2022 09:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233978AbiK3JcW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 30 Nov 2022 04:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234394AbiK3Jb7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Nov 2022 04:31:59 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31BDC37234;
        Wed, 30 Nov 2022 01:31:40 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqt1d1Sz4xZv;
        Wed, 30 Nov 2022 20:31:38 +1100 (AEDT)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Frederic Barrat <fbarrat@linux.ibm.com>,
        Julia Lawall <Julia.Lawall@inria.fr>
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Andrew Donnellan <ajd@linux.ibm.com>,
        kernel-janitors@vger.kernel.org
In-Reply-To: <20220521111145.81697-82-Julia.Lawall@inria.fr>
References: <20220521111145.81697-82-Julia.Lawall@inria.fr>
Subject: Re: [PATCH] cxl: fix typo in comment
Message-Id: <166980022351.3017288.3236938030136347338.b4-ty@ellerman.id.au>
Date:   Wed, 30 Nov 2022 20:23:43 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 21 May 2022 13:11:32 +0200, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> 

Applied to powerpc/next.

[1/1] cxl: fix typo in comment
      https://git.kernel.org/powerpc/c/37195edebf479b94f1e20c2a83a29e4beebe7ff5

cheers
