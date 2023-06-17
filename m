Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94124EB64D9
	for <kernel-janitors@archiver.kernel.org>; Sat, 17 Jun 2023 15:41:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbjFQPlv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 17 Jun 2023 11:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjFQPlt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 17 Jun 2023 11:41:49 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADB91BD;
        Sat, 17 Jun 2023 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=4ExZ8GqNSa7s8Rce/NjY80ME5m/4r9zasVi+kr80/IM=; b=A93Q4ogtDmr16Jw2XklVt8NiAJ
        vCD3zNp19beBxynPCg3Y5Jm6w9DGFHM93GbzCh5AqcaSBLorHi300M+Q5A1rT4HLVt9EkdF+IMIuy
        /mA57t3nul1p9eL1HrSoRFf4jjdzg3hbZwvvAH6yp0iNww5F4GFwBp0FOPZY+/vbI+Qg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qAY3M-00Go1O-PF; Sat, 17 Jun 2023 17:41:28 +0200
Date:   Sat, 17 Jun 2023 17:41:28 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: at803x: Use
 devm_regulator_get_enable_optional()
Message-ID: <7fc42fc1-3a67-4286-9fc9-5d26401e7c83@lunn.ch>
References: <f5fdf1a50bb164b4f59409d3a70a2689515d59c9.1687011839.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5fdf1a50bb164b4f59409d3a70a2689515d59c9.1687011839.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jun 17, 2023 at 04:24:37PM +0200, Christophe JAILLET wrote:
> Use devm_regulator_get_enable_optional() instead of hand writing it. It
> saves some line of code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
