Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA1AC25B67
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 23:38:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjJWXi2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 19:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjJWXi1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 19:38:27 -0400
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF46D6E
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 16:38:23 -0700 (PDT)
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
        by cmsmtp with ESMTPS
        id utbIqAmF7jtZ3v4V4qi7qH; Mon, 23 Oct 2023 23:38:22 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with ESMTPS
        id v4V3q9VeWNUwRv4V3qXP2c; Mon, 23 Oct 2023 23:38:21 +0000
X-Authority-Analysis: v=2.4 cv=I852+fsg c=1 sm=1 tr=0 ts=653703ed
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=6xGJIMmgAAAA:8
 a=VRS8ihsxzB7O6jzo8poA:9 a=QEXdDO2ut3YA:10 a=aWz6Jz32kaLdCzdWRG-w:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mTG2RhKymPf9A+HG6E0HAbdI/P+WELlzy7kUdKNypk4=; b=E6qR2bCqERsdNFNf7NmBaQel+P
        ND13ywJ2I/8N4UY6c3YmUVAHijOiwy2+u7rGDR0CfrbHQx5mPuSKHc9fWslR7ID3Y4wbmY6SmNoaJ
        72cqJwP6AtR9dCVC6kHk0iOqgIVibi8glG0Un78ybDSKHpASTeXUfQPiMlZMrinbQc3D0MR/kkdm6
        lr1Sx1MXYKZec9lyih2WwjqPce5L0I+amNyPf1VVC53Zn8kqpshPxpPtZ5Q4T+m082q2D6QUQ17ID
        4HKN1fH5QsjmdzTXkzTPnRjDayQ8ZVzu2FjrFFWaof2r/JZDYLLlFdYW6J0x0KzUkBhUMvvxC5MNr
        7BMrP1og==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:40712 helo=[192.168.15.10])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.96.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1qv4V2-0008qU-2v;
        Mon, 23 Oct 2023 18:38:20 -0500
Message-ID: <9e0dc452-c4fe-4511-83fe-a1e356bd5438@embeddedor.com>
Date:   Mon, 23 Oct 2023 17:38:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KTODO automated TODO lists
To:     Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev
Cc:     outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
Content-Language: en-US
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qv4V2-0008qU-2v
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:40712
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org:  HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfG0BQrISw8gm+rQK9z8smDuw1YFomk0uPgC1VwEa0qqdMizG2ANbRq9YJe1xj1HyRg3TR+TB0uCj6jZg9k45orwBSiEu6HzkEr/1+f0R1KzyHGvILq//
 CxWH0arQkbazzt4BHwDarqbv50cPrdbW69AjbXSQVk2tI09vIjwheM0am1fNqT3KY7ntBxJrQy9AKublHALkkOs5kLOa6Jm76aZWK07URDc1aYJZgpAdmsNe
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 10/18/23 22:11, Dan Carpenter wrote:
> Yesterday someone on my lists just sent an email looking for kernel
> tasks.  This was a university student in a kernel programming class.
> We also have kernel-janitors and outreachy and those people are always
> asking for small tasks.

We have tons of issues waiting to be audited and fixed here:

https://scan.coverity.com/projects/linux-next-weekly-scan

You will never run out of fun. :) People just need to sign up.

That's really a great way to learn and gain experience across the whole
kernel tree.

--
Gustavo
