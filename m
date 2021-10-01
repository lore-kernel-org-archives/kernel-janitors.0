Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0C4C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  1 Oct 2021 19:34:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 915E961AEB
	for <kernel-janitors@archiver.kernel.org>; Fri,  1 Oct 2021 19:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355393AbhJATgS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 1 Oct 2021 15:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355340AbhJATgS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 Oct 2021 15:36:18 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6070EC06177F
        for <kernel-janitors@vger.kernel.org>; Fri,  1 Oct 2021 12:34:32 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id m26so8854918pff.3
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Oct 2021 12:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pC2h0lvxVc5KKbfREaINSac8mB+N4kKtlvuyg5h36LM=;
        b=gaz6fykW+fGnn4VCynEBOrUpzKeZ76AGT+VgU6sytw7i+wiZzMyCdiiBnH3jnCbOae
         HPyhldhxOrcMbbXsvP9qAP4H9SRrJHK3Xl2N+XfKJ4dg2aPqFG84OFqSWpEg6qJ253ZD
         9mCjkD2Ymz6cAQQhFFDQKAcpubqGJDjb9Z8WQ52HUXJvDW/tSZSf/9b7lQsmm1ahPJuT
         RdJuBOSMI4ipy5NRZFko2USS/Muiyx7dPu9eLnucJUB5ZfhH5LIAfu7mKM7975UVsthA
         VelzQHOMSEunp9akUui2aVUrSiSQinvuKFXk9PAyVX+m35NqLY+AUSjCRfLKxmV31CBP
         Iy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pC2h0lvxVc5KKbfREaINSac8mB+N4kKtlvuyg5h36LM=;
        b=F9DUfFySmJEyvcDirS1pjWi1drfPP9wrNpWVotPSHZ1MIROk+pfBbw0m8V/cQXYE3D
         IlBZjknwmP7v06d7NCo8Lhx0EgXNbT0JhEuwFhhfS8XIak4jUsxXrRGNRKGlg8uBWsdZ
         xknDHSHfE/y7IgumXrIiuqcWquv6GmDqMufHf96lYwDb0VHCCWLOOYpPiw12MyeaRp7F
         /AggKKyfD/rdkWSq/2Vinm69maX4seoxZOidTOLJcE8rDleQWGWSHbiTToPuvpzjRhUZ
         0d2p/6n10wEUqb5lAKiGGDmH0szKCtkViUBwr2PiZzazjR/8oNcTuyNQNOVJfo62dvZ2
         GGLA==
X-Gm-Message-State: AOAM530PDmho9wfS5sUoS/BVzBpHgN53W0obg0z4MI3uy0AYXpcBjtPf
        8R9h+AIXqcBCenZ+Td+5ZBgBzFP9UdmRCfp/
X-Google-Smtp-Source: ABdhPJz8Y6Est+kcYAdUgYNMXKg2inqkeqt0BuMfy617uJfYtPLY+lFyOXV27MxLDNz+1RjD9rXGtA==
X-Received: by 2002:a63:67c3:: with SMTP id b186mr10968030pgc.229.1633116871656;
        Fri, 01 Oct 2021 12:34:31 -0700 (PDT)
Received: from ?IPv6:2600:380:4a74:fb92:622f:875a:688c:3102? ([2600:380:4a74:fb92:622f:875a:688c:3102])
        by smtp.gmail.com with ESMTPSA id h6sm8785321pji.6.2021.10.01.12.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 12:34:31 -0700 (PDT)
Subject: Re: [PATCH] sx8: fix an error code in carm_init_one()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Luis Chamberlain <mcgrof@kernel.org>
Cc:     linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20211001122722.GC2283@kili>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <a400edbf-da11-e8b1-8eef-221c6493bae1@kernel.dk>
Date:   Fri, 1 Oct 2021 13:34:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211001122722.GC2283@kili>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/1/21 6:27 AM, Dan Carpenter wrote:
> Return a negative error code here on this error path instead of
> returning success.

Applied, thanks.

-- 
Jens Axboe

