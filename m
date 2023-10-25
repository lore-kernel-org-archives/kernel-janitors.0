Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A1EC07545
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 20:03:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjJYUDo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 16:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234735AbjJYUDm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 16:03:42 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AACB518A
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 13:03:40 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 730DD1C0002;
        Wed, 25 Oct 2023 20:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1698264219;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aL2U1V9L42Wp9j3tZkGZ1h3ykDEf4gy3mNSNm4h+0Uo=;
        b=LXqzSyixYlUw1ha1/405oHulNX/O/uPIaknUuXwCt1KZrTrx6H001llr7694rce+FEu4o1
        SxDUXOJ1DppqFa7vxBFQQmz7q+/WZRbOEranRnpD2JnoR4wMHBkR/G+JN7csaYvfK14iC6
        bEyTUi+JTdRJ0awoLZSgOdFosQrixblOqrZHEIk1r7pEG+tlrzSiCSvSuGrx1E3jbG1M4g
        PMn6Ccs6APQAdjZW8qtwYNlhse4T3fqCnPjl9kdEv2yt9KuBgryGoDXL9nwAlALjlmFRoh
        PmOUFod7tA3CBJCeprpzNOVz5a/v/RlywijcpbTuI52lJECvvc9IF81mKPJmHA==
Date:   Wed, 25 Oct 2023 22:03:38 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        NeilBrown <neilb@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231025200338b3a293de@mail.local>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
 <e4aa47e3-4858-41ba-813f-c17aa5f5ba7d@p183>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4aa47e3-4858-41ba-813f-c17aa5f5ba7d@p183>
X-GND-Sasl: alexandre.belloni@bootlin.com
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 25/10/2023 21:55:16+0300, Alexey Dobriyan wrote:
> It's MUAs failure. Microsoft "solved" this problem by forcing top
> posting onto everyone, but there is no reason Outlook couldn't scroll
> to the first reply in the middle of email. I use mutt, it doesn't
> scroll to the first reply either.
> 

Just press 'S'?

<skip-quoted> (default: S)
This function will go to the next line of non-quoted text which comes after a line of quoted text in the internal pager.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
