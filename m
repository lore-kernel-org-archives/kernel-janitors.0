Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4A1CD5BCA
	for <kernel-janitors@archiver.kernel.org>; Tue, 19 Sep 2023 14:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbjISOjO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 19 Sep 2023 10:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232858AbjISOjN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Sep 2023 10:39:13 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062E5EC;
        Tue, 19 Sep 2023 07:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=dB+Dyt00RhzJnxkRDlEPURBML1dk2tdOzZGBav2KXT0=; b=137sszfZ3mbCCc633XhbwWTPlP
        XE+yWywCzi6YXhTkcdEL4TEw59Dt3sGlwCi04scCQ2a3LJS0yLensAjWdUy9U+IdmUAlg73IdAtFG
        Nt6a0ZDetgIzN5AXpO5lB6R1f1BIH+dr/RR/URYI0NR5xt4eQDLzTwUzyKKvYVfOvvOc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qibsM-006v7D-P2; Tue, 19 Sep 2023 16:38:54 +0200
Date:   Tue, 19 Sep 2023 16:38:54 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] net: dsa: mv88e6xxx: make const read-only array
 lanes static
Message-ID: <73b78b15-09c5-4d7c-99cc-8bcc89992fda@lunn.ch>
References: <20230919094021.24699-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919094021.24699-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 19, 2023 at 10:40:21AM +0100, Colin Ian King wrote:
> Don't populate the const read-only array lanes on the stack, instead make
> it static.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
