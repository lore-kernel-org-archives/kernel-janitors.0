Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890BEC4708B
	for <kernel-janitors@archiver.kernel.org>; Wed, 30 Nov 2022 09:31:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233846AbiK3Jbc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 30 Nov 2022 04:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233820AbiK3Jbb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Nov 2022 04:31:31 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBD352167;
        Wed, 30 Nov 2022 01:31:30 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqf5t6Kz4xP3;
        Wed, 30 Nov 2022 20:31:26 +1100 (AEDT)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Anatolij Gustschin <agust@denx.de>,
        Paul Mackerras <paulus@samba.org>,
        John Bonesio <bones@secretlab.ca>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Grant Likely <grant.likely@secretlab.ca>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <dec1496d46ccd5311d0f6e9f9ca4238be11bf6a6.1643440531.git.christophe.jaillet@wanadoo.fr>
References: <dec1496d46ccd5311d0f6e9f9ca4238be11bf6a6.1643440531.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] powerpc: platforms: 52xx: Fix a resource leak in an error handling path
Message-Id: <166980021648.3017288.16545601225539793155.b4-ty@ellerman.id.au>
Date:   Wed, 30 Nov 2022 20:23:36 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 29 Jan 2022 08:16:04 +0100, Christophe JAILLET wrote:
> The error handling path of mpc52xx_lpbfifo_probe() and a request_irq() is
> not balanced by a corresponding free_irq().
> 
> Add the missing call, as already done in the remove function.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: platforms: 52xx: Fix a resource leak in an error handling path
      https://git.kernel.org/powerpc/c/5836947613ef33d311b4eff6a32d019580a214f5

cheers
