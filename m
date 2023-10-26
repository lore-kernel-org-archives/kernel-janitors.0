Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C51C25B6B
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Oct 2023 07:44:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbjJZHo7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Oct 2023 03:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjJZHo6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Oct 2023 03:44:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2790FC0;
        Thu, 26 Oct 2023 00:44:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CF8C433C7;
        Thu, 26 Oct 2023 07:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698306296;
        bh=XAlEIrmdypcb+KqT0LBcwNCR9qQHpu+C3FpeZNHMc+U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N1Lz0K6gFIUQPy+avCBiBd+4PEGxGPhbHeCaZODqJwq2+4LbcM9HCF/++6nFWaUqe
         EXar9/f8++QDvGGx1aPprPH1gQbTGegDsg6wYo7+MUwWLG/yz+mJqYFY3rDPPSIU7H
         BAr3NK1WNpStquLTWMIjUnJZxwTzhJLdOZHENJR0D3Q+cuSt7Dq5nLkjL5jQnY5GjF
         yx84orB3vgy1RldTVA76yhL5EjvxyUh/0fqdSc9i+34UL2FtZxyd3AJp1/+pmn0qHV
         TV0qpeMVpchjBZEZYXOn55Fdf/VwahdITQ7ArvchDfSO1CE0G0OG2c07DuIPW/29IA
         sLRcnTNvvVYwQ==
Date:   Thu, 26 Oct 2023 08:44:49 +0100
From:   Simon Horman <horms@kernel.org>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Woojung Huh <woojung.huh@microchip.com>,
        UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] net: dsa: microchip: ksz9477: Fix spelling mistake
 "Enery" -> "Energy"
Message-ID: <20231026074449.GM57304@kernel.org>
References: <20231026065408.1087824-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026065408.1087824-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 26, 2023 at 07:54:08AM +0100, Colin Ian King wrote:
> There is a spelling mistake in a dev_dbg message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks Colin,

I noticed this one too.

Reviewed-by: Simon Horman <horms@kernel.org>
