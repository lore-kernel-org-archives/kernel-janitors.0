Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5DAEB64DA
	for <kernel-janitors@archiver.kernel.org>; Sat, 24 Jun 2023 22:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjFXW2a (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 24 Jun 2023 18:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjFXW23 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 24 Jun 2023 18:28:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C072710D8;
        Sat, 24 Jun 2023 15:28:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5C75160A71;
        Sat, 24 Jun 2023 22:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF96C433C0;
        Sat, 24 Jun 2023 22:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687645707;
        bh=Xr9seD7Mt0PFVk1QOrKGfmugFEuY6PJhYDOWIjAJ3WA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FDUqIVyjZ3Cfh7ExAtZpIjceASv+BaEVlPCa8QEJ4bwPEW+jTqHQZEhfONR2MUwc3
         5Mp0gKdkLj4yYQLd4HON2qkF41Gafrrox+E8wFnOW/o5l/4AJbOUNJWX33+EWfgGPg
         IMlt1eu3C19cBzoreFP44pgNG2aoeP1nlScOiTGit6W6FmW3c+wdZg8Z/Irg/2VY/z
         Va3h1a652baAJCbUVekzBE2STG4luQM/yDQ6HLorqhIp8fbo+xUhdkDX4AMjOZ5DwS
         gkOJ3WQc57aXgpkdEaF2BUlXnavrG1sH82rKexDKVDH4aTA6K8cg+7HxoqVa2B0Lza
         4jV57LkHmGFlQ==
Date:   Sat, 24 Jun 2023 15:28:26 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Veerasenareddy Burru <vburru@marvell.com>, keescook@chromium.org,
        kernel-janitors@vger.kernel.org,
        Abhijit Ayarekar <aayarekar@marvell.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/26] octeon_ep: use array_size
Message-ID: <20230624152826.10e3789b@kernel.org>
In-Reply-To: <20230623211457.102544-3-Julia.Lawall@inria.fr>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr>
        <20230623211457.102544-3-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 23 Jun 2023 23:14:33 +0200 Julia Lawall wrote:
> -	oq->buff_info = vzalloc(oq->max_count * OCTEP_OQ_RECVBUF_SIZE);
> +	oq->buff_info = vzalloc(array_size(oq->max_count, OCTEP_OQ_RECVBUF_SIZE));

vcalloc seems to exist, is there a reason array_size() is preferred?
-- 
pw-bot: cr
