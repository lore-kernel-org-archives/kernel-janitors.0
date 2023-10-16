Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575F2CDB465
	for <kernel-janitors@archiver.kernel.org>; Mon, 16 Oct 2023 18:57:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbjJPS5V (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 16 Oct 2023 14:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjJPS5U (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Oct 2023 14:57:20 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05B7A2;
        Mon, 16 Oct 2023 11:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=rb+HabGsxmBZcGwz+X0VaIajlgmgB+Ca2a+fX2+7j30=; b=aYwJkAsGFwxyuDFgU/sCoT3hTX
        YB5Uk7PCSO2Jkn0+vziVoe46IRXs7qGPWXVBpbPyxhNSER4h9FL79gezVIreofIdQsOhwvB4Tsc35
        5VJDJieSwK4UmymJopNYKN6GkyJccslsI/iV0VAHppYgei6BsjgKV25psvgmIPccpNA4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qsSm4-002Nso-74; Mon, 16 Oct 2023 20:57:08 +0200
Date:   Mon, 16 Oct 2023 20:57:08 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Steve Glendinning <steve.glendinning@smsc.com>,
        Steve Glendinning <steve.glendinning@shawell.net>,
        UNGLinuxDriver@microchip.com,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: usb: smsc95xx: Fix an error code in
 smsc95xx_reset()
Message-ID: <f77f3e51-9c8d-4460-8521-866ca1953ce5@lunn.ch>
References: <147927f0-9ada-45cc-81ff-75a19dd30b76@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <147927f0-9ada-45cc-81ff-75a19dd30b76@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 16, 2023 at 08:28:10PM +0300, Dan Carpenter wrote:
> Return a negative error code instead of success.
> 
> Fixes: 2f7ca802bdae ("net: Add SMSC LAN9500 USB2.0 10/100 ethernet adapter driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Hi Dan

It would be nice to use one of the linux/iopoll.h helpers, so avoiding
problems like this. But this is a good minimal fix.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
