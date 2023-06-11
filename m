Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EACBC7EE2E
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jun 2023 08:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbjFLIdM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jun 2023 04:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233269AbjFLIcx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 04:32:53 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AF8268D;
        Mon, 12 Jun 2023 01:32:16 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f620583bc2so4575237e87.1;
        Mon, 12 Jun 2023 01:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686558734; x=1689150734;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E60FWaLGWhSk1lYB85C9hG8InWWvSwGswhbesGiABvc=;
        b=NtFxM7ibrmXxONBzTg21VcSflgvrTuxHCTN21mA4jvwigZe2gh/Mu+DLIQeUbwIfzF
         5qJJ2/S76xDE8TrWFwtLvkbnEyzJJUKbebChD2vJubwIRN+rhLxjDf8co3IQpkLDI7pC
         24Zpt/6YBPqybCd2WFqaTIclt7i7WOvksmsVZnuH5VZs7gAtFrLOHIjINq61iR2fex7B
         J7X/nvuILbjbJQeeFSS9+5fzUBkX2AhSSGQocXHu3n6fRaLEAOXXySPpjag7G4OnabpA
         AQxo7tfdLo7ZrXw9f8NodVhCr20YxaIBVvJ3ga5lIKFX1NBxH0F/Vb4vSrMzP3Zi7Ff/
         IGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686558734; x=1689150734;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E60FWaLGWhSk1lYB85C9hG8InWWvSwGswhbesGiABvc=;
        b=js+Cv4CZjIevzFm1ZsJmn9N8MZUP89I1CQLLNl/8P9VUctP8SgEzI3+g2dFMWkUzV4
         iBuhxMSx85WsB+JugCnWbmiDEDLzDcseFrG3hQ3AnNjq8QSgPm9JFTR1w+yuSOjkzUqy
         ZVVAf2P+Enj9yaOIaiSIkA5MUl+alVPOOmnRu98yUe0SPKuluq+jlhTMI2c0Em39jgh0
         G9L32GsZpKjOE+uwU0LtxAklASG33khgtZ8etOULysrMeF0c2uUHbJYAOLhMdQEb4si2
         4PjeJFvkqBtlM5LQe/U1K0svl/rgKKjJ1SW5QgrqsSYRJhlxaM3LuPAwf3NJyW2aH2t7
         gXSw==
X-Gm-Message-State: AC+VfDyEUHPXL5mjiuzd4dH4LVf7WaD5j8hor6TgTCfDoZplquE2ndGL
        QiJ5b1+0xf/o8nOLrYoZvxML2qbF4J8=
X-Google-Smtp-Source: ACHHUZ71H3crGnpkWjeeb58pft9EXczqpM+3QXT+WO0i7gMfbKZyIzbalMx4lEJ7KeUzIXqNbWXuEQ==
X-Received: by 2002:a05:6512:54a:b0:4f4:ba0d:3bbf with SMTP id h10-20020a056512054a00b004f4ba0d3bbfmr3467112lfl.60.1686558734015;
        Mon, 12 Jun 2023 01:32:14 -0700 (PDT)
Received: from Ansuel-xps. (93-34-93-173.ip49.fastwebnet.it. [93.34.93.173])
        by smtp.gmail.com with ESMTPSA id m11-20020a5d6a0b000000b0030b5d203e7esm11744229wru.97.2023.06.12.01.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 01:32:13 -0700 (PDT)
Message-ID: <6486d80d.5d0a0220.bb6d6.3cbd@mx.google.com>
X-Google-Original-Message-ID: <ZIXwj/bvFbcDcWZj@Ansuel-xps.>
Date:   Sun, 11 Jun 2023 18:04:31 +0200
From:   Christian Marangi <ansuelsmth@gmail.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-XXX] net: dsa: qca8k: uninitialized variable in
 hw_control_get()
References: <5dff3719-f827-45b6-a0d3-a00efed1099b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dff3719-f827-45b6-a0d3-a00efed1099b@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 12, 2023 at 10:20:55AM +0300, Dan Carpenter wrote:
> The caller, netdev_trig_activate(), passes an uninitialized value for
> *rules.  This function sets bits to one but it doesn't zero out any
> bits so there is a potential for uninitialized data to be used.
> Zero out the *rules at the start of the function.
> 
> Fixes: e0256648c831 ("net: dsa: qca8k: implement hw_control ops")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the fix but I wonder if this should be better fixed in
netdev_trig_activate? By setting the mode as 0 directly there?

I assume other dev implementing the get ops would do the same mistake.

-- 
	Ansuel
