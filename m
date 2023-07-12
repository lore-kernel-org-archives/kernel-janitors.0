Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66892EB64DA
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 Jul 2023 19:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbjGLTsK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 Jul 2023 15:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbjGLTsJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Jul 2023 15:48:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C0C1989
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jul 2023 12:48:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 84F60618FB
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jul 2023 19:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58166C433C7;
        Wed, 12 Jul 2023 19:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689191287;
        bh=tWDNCS0KPz2aaKuLfKxjCNjaaiGoRwqtrsqHEHlcTR0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bg8lXiYspAfHD8LzKSkM4CsEy1B+GWbJMX/DH/DlsKtOt7lxJFzZztI0I7jio0fea
         O1wXqJRGa0Q8t2ShULx/CFU23uqpfywzvUzfjiHSm+BrsOUpOwP3kgAi69AMUfwPGz
         DmPByOg8kPMYX3e8BeEPSUmHEWyatQo+xomsVlsqfnMAlprEzzKqDbt9gQ8CyGvhhD
         WbijDRdY+KTEEJFmTp3xfCYlOLkhsNu02zVLM2l+UsdAClnDBSpEheLHazuuQrOI8H
         jtzEhHeC0wqhp+E4EQZ1ueRc6HTgEpfii7s1Ceh+uR0k43yyILevIMMAmouf4qDpZT
         FUYnVxPPyaq9w==
Date:   Wed, 12 Jul 2023 12:48:06 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] devlink: uninitialized data in
 nsim_dev_trap_fa_cookie_write()
Message-ID: <20230712124806.5ed7a1eb@kernel.org>
In-Reply-To: <7c1f950b-3a7d-4252-82a6-876e53078ef7@moroto.mountain>
References: <7c1f950b-3a7d-4252-82a6-876e53078ef7@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 11 Jul 2023 11:52:26 +0300 Dan Carpenter wrote:
> Subject: [PATCH net] devlink: uninitialized data in  nsim_dev_trap_fa_cookie_write()

We usually reserve the "devlink: " prefix for net/devlink/ changes
rather than driver changes, so I adjust the subject when applying.

Applied, thanks!
