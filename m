Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1208CC433FE
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 May 2022 11:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355269AbiEELxs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 May 2022 07:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbiEELxr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 May 2022 07:53:47 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 83FEF541A4
        for <kernel-janitors@vger.kernel.org>; Thu,  5 May 2022 04:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651751407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i67tjVaHB78cF63WCGFJ3CI1nO+ngKMIoetrGgmJHsE=;
        b=V1hPzsD/jysvk4A0+nwNEQq26G3nhHKHG045vABEkWDexxrd4o9VZivz5NG4GqPP46KfyX
        R2Aeva4W7GhaVE2H4rK8L7BaY+pdd4XNxmDdkjZBjo5Dh9fRb+J+S20u0Qa7R+EZk8KFeE
        VBDaa5ueF2Vp6y3Yn+jFQBQ5R5qk7P4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-S9M_O5tEP66x6MjAyivFbA-1; Thu, 05 May 2022 07:50:06 -0400
X-MC-Unique: S9M_O5tEP66x6MjAyivFbA-1
Received: by mail-qk1-f198.google.com with SMTP id a5-20020ae9e805000000b006a034b31384so424922qkg.8
        for <kernel-janitors@vger.kernel.org>; Thu, 05 May 2022 04:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=i67tjVaHB78cF63WCGFJ3CI1nO+ngKMIoetrGgmJHsE=;
        b=YoHG5WKvUkamt/DGyVF4hlGAe3Dzzw+zpUQ5tzZ7Tyr91Ye7Cd0Q10TZegyo4bzHB/
         hwGtw3Oyg4v8QxrZe4D7DHzz3hcjdo2MpzQ10U3jEwM0ITkuEXfUXak9RibexRfrXCOO
         YmkTFCujQwtCoAj61aXAF5AowmYsyC8s0sz+QvaNpy9htp6hMus19CEdebcdv+azTn+u
         yEzvkeSvbfsKGOTS1SeL4dbrNqfiv7GEKVqsZayQshRzICEerb/lalQVj3wSjJ5IPn+u
         Cma/TmJrl0VuGaAduVE51oBEVsY6fDp4Rxv5IM35rw/9ur5MagPAQjQAgADWFc68+6dY
         EvTg==
X-Gm-Message-State: AOAM531OOP4OdaZdzN2i14SrtW5tQyzk5jBVy51KihI4nc6FRbvSaPlK
        aXkVdPPCenCe7IeUf4nmPeUz7K0h077ruTo9G4KWhWi9VVMq7KFKpuC6CoaqqW2pRVq06Bdcxy+
        qI7rAU+3S/DbYouQnzEeJlK+X3yqj
X-Received: by 2002:a05:622a:c6:b0:2f3:bc21:6618 with SMTP id p6-20020a05622a00c600b002f3bc216618mr2180835qtw.581.1651751405823;
        Thu, 05 May 2022 04:50:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOTBe3w3XwO/LTDfuNLb9fUejFkDt19134p1Vhe3E4XGpHcM00tYTmOmxXiDwwWATyL/GdXw==
X-Received: by 2002:a05:622a:c6:b0:2f3:bc21:6618 with SMTP id p6-20020a05622a00c600b002f3bc216618mr2180819qtw.581.1651751405564;
        Thu, 05 May 2022 04:50:05 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-115-66.dyn.eolo.it. [146.241.115.66])
        by smtp.gmail.com with ESMTPSA id b10-20020a05620a270a00b0069fc13ce202sm656175qkp.51.2022.05.05.04.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 04:50:05 -0700 (PDT)
Message-ID: <0606e0fede42a16c93231498d23c9afd5c05e26e.camel@redhat.com>
Subject: Re: [PATCH net-next] mptcp: fix deadlock in mptcp_close()
From:   Paolo Abeni <pabeni@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        Geliang Tang <geliang.tang@suse.com>
Cc:     Matthieu Baerts <matthieu.baerts@tessares.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        mptcp@lists.linux.dev, kernel-janitors@vger.kernel.org
Date:   Thu, 05 May 2022 13:50:01 +0200
In-Reply-To: <YnOu5xlGgE2Ln7lj@kili>
References: <YnOu5xlGgE2Ln7lj@kili>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2022-05-05 at 14:03 +0300, Dan Carpenter wrote:
> The mptcp_data_lock/unlock(sk) functions are taking the same spin lock
> as the lock_sock()/release_sock() functions.  So we're already holding
> the lock at this point and taking it again will lead to a deadlock.

Note that lock_sock() (and release_sock()) releases the relevant
spinlock before completion. AFAICs the above deadlock is not possible.

Still I think we can revert commit 4293248c6704, I don't see why we
need the addtional spin lock ?!? 

Thanks!

Paolo

