Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9892C433C1
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 22:36:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3BA1619A3
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 22:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhCZWgO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Mar 2021 18:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbhCZWgD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 18:36:03 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B29C0613AA
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 15:36:03 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id w70so7255579oie.0
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 15:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V+YQq+lRYtyspAeWFz7dCbPjCkePPwLJ57VTy7Kuxtk=;
        b=qIMHDzuDTubNXuhrU6xHCxCvbxqu7ATigMzp+lc9TyY7I0EGNSfZDUpHqqp9RgY6e8
         735RwKrNGOPyOXrnrsoGIslfXzRnNNq2AHARMNTqgpjR+olaRQ4UGnW3KZ2Smd8IkKhj
         RNr2ytVsAN+kY+CfrD1gBBop35HMXwHkUyI7gmE/n1kgMLE0a6ORUkyDvD368gnUMtGt
         gczb0q8lD+VUCfXa7oLX2gQalrnCbkuKAqq3CNfUYxTcf/Z/AwDQIVGm92EDYW55XDqu
         pR4iTLkp51tqLrOLsc9eEVk8zjMOLF3lkX9LhKLxShXKK6qndKNdTdNBsX7jZHbqN/Ru
         fkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V+YQq+lRYtyspAeWFz7dCbPjCkePPwLJ57VTy7Kuxtk=;
        b=aCBoY5fTK1F1e6LQ4s/Ap5HYZXBjx+l2oUJI2Q2ejyq7rf6c9jXUzmLWX8swzMJ683
         mQZfWbcEQCGj9dvzakaH2lGC5B48GqpqNblZXw/XOwXa00CEXVSXRe8g/Ut+XXcBfV+u
         70o5Zdgw71GEarGDvXqbK6Z6HE8/+ie6OErGSfYIB/CL80wWEc/7gQyM/P+/0FCsuEvc
         vL+gJx4IK4j3unp2tRr/facl0UJlKK6W0F1jYlVnQkXV1auW688F6Sx60OOUmcHJGLDF
         8dTqwmubrFC7bcVHDjq06vDxd/44rsWiLTtdGzAsI1oH9OoBaZY/dXumFN4XgOEvzaKz
         xQQg==
X-Gm-Message-State: AOAM532glWIRzFcRmg+QFv6aD10PUkKvM+PZG7rNGwqlxXO6tZBRipTf
        54cdsrseRE5IeaCUcLytmbGtnA==
X-Google-Smtp-Source: ABdhPJxjMopEYEtM2GykXR356j28wVlSU9lYVJnDRhziFyqBi3YBvwLBWMdsh4kQd4UUre9/I3kZ2g==
X-Received: by 2002:a05:6808:8da:: with SMTP id k26mr11285042oij.115.1616798162333;
        Fri, 26 Mar 2021 15:36:02 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.233.147])
        by smtp.gmail.com with ESMTPSA id f197sm2394307oob.38.2021.03.26.15.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 15:36:02 -0700 (PDT)
Subject: Re: [PATCH 1/1] scripts/spelling.txt: add entries for recent
 discoveries
To:     Tom Saeger <tom.saeger@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Colin Ian King <colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joe Perches <joe@perches.com>
References: <14c54ee47bf0e9aebfe71e97cefd11b2b8f0332f.1616784384.git.tom.saeger@oracle.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <49bafdef-b300-bd4a-c3b2-c672470e8922@kernel.dk>
Date:   Fri, 26 Mar 2021 16:36:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <14c54ee47bf0e9aebfe71e97cefd11b2b8f0332f.1616784384.git.tom.saeger@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/26/21 1:22 PM, Tom Saeger wrote:
> @@ -1153,6 +1170,7 @@ quering||querying
>  queus||queues
>  randomally||randomly
>  raoming||roaming
> +readded||read
>  reasearcher||researcher
>  reasearchers||researchers
>  reasearch||research

davej brought up a good point that this one was actually re-added, which
does make sense. So don't think that one should be added to the list.

-- 
Jens Axboe

