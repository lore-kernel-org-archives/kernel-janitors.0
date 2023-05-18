Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF76BC77B7D
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 May 2023 08:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjERICK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 May 2023 04:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjERICF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 May 2023 04:02:05 -0400
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9D71FE5
        for <kernel-janitors@vger.kernel.org>; Thu, 18 May 2023 01:02:03 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id zYaHplRYAQfwkzYaHp64Al; Thu, 18 May 2023 10:02:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1684396922;
        bh=nEPOKyXng4dFgGwWlP8ON0lGT7uVkbu/5uB/KETGGEM=;
        h=Date:Subject:From:To:References:In-Reply-To;
        b=bs18yG1/NOTPJArfyS2RxP9QvJp68sIV3G7/7Ayl+rSuOpMSIdoEFwPiMeL3YszoH
         y56QZj3sCcYNvwX0MD9D29dKJREG4QF7S0Y8Wx2spEa9GklfjQb0kjunOJFUZ4ly8F
         nSAuf/8MEHpvluZLM8O1aJNkuCKFGP1j2kYMwP7KJhpkeD+8SwkQ+OSsEMkNCieJ2Z
         jDPReaHKsxmVsi4NKJR4rn0WyEXs8jQhDkDe+32vx468DhVjTUpG3H3zQTVTjTRG7D
         yU19qFdVEOPJkbx92+944ksF6pkohjU2UQhur1/AjWPBdc2yFhqNucaA6OzGa3Gptt
         +Aq1+c78RUJ5A==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 18 May 2023 10:02:02 +0200
X-ME-IP: 86.243.2.178
Message-ID: <fb977b9d-ae61-78fb-8cd8-f4d34711aeac@wanadoo.fr>
Date:   Thu, 18 May 2023 10:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: devm_ on lists
Content-Language: fr, en-GB
From:   Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Dan Carpenter <dan.carpenter@linaro.org>, smatch@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Julia Lawall <Julia.Lawall@lip6.fr>
References: <db0e0930-d76c-426b-9d9b-366f97d7e167@kili.mountain>
 <a2866a55-f3b0-ff99-b17c-8f0fc9e55e9b@wanadoo.fr>
In-Reply-To: <a2866a55-f3b0-ff99-b17c-8f0fc9e55e9b@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



Le 18/05/2023 à 09:59, Christophe JAILLET a écrit :
> Le 18/05/2023 à 09:27, Dan Carpenter a écrit :
>> I sometimes have more ideas than I can handle in a day and my mind
>> resets every night so every morning I am a blank slate like that guy
>> from that movie.
>>
>> So I'm going to start writing them down and adding a hashtag.
>> #StaticCheckerIdeas  I'm going to CC kernel janitors until the Smatch
>> list gets archived on lore.kernel.org
>>
>> There is a bug in ti_sci_probe() where it does:
>>
>>     info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
>>     ...
>>     list_add_tail(&info->node, &ti_sci_list);
>>     ...
>>     return of_platform_populate(dev->of_node, NULL, NULL, dev);
>>
>> Idea 1:  If of_platform_populate() fails, then info freed but it's it's
>> still on the the &ti_sci_list list.  Look for list_add of devm_ data
>> and ensure that it's removed from the list before an error code.
>>
>> There are other lifetime issues surrounding devm_ data.  We need a
>> list_del in the release function as well.
>>
>> Idea 2: The other error paths all have clean up so last error path
>> should have clean up too.
>>
>> regards,
>> dan carpenter
>>
> 
> Nice!
> 
> A really naive:
> @r@
> expression m;
> identifier alloc_fn =~ "devm_";
> identifier list_fn =~ "list_add";
> @@
> 
> *    m = alloc_fn(...);
>      ...
> *    list_fn(..., <+... m ...+>, ...);
> 
> 
> also seems to give some decent results.
> Written as-is, there is a lot of false positive, but is a start.
> 
> I'll give it a look.
> 

BTW, in such cases, should a Suggested-by, or something else be added?

CJ

> 
> 
> One of my first match is:diff -u -p drivers/perf/qcom_l2_pmu.c 
> /tmp/nothing/perf/qcom_l2_pmu.c
> --- drivers/perf/qcom_l2_pmu.c
> +++ /tmp/nothing/perf/qcom_l2_pmu.c
> @@ -852,12 +852,10 @@ static int l2_cache_pmu_probe_cluster(st
>           return err;
>       }
> 
> -    cluster = devm_kzalloc(&pdev->dev, sizeof(*cluster), GFP_KERNEL);
>       if (!cluster)
>           return -ENOMEM;
> 
>       INIT_LIST_HEAD(&cluster->next);
> -    list_add(&cluster->next, &l2cache_pmu->clusters);
>       cluster->cluster_id = fw_cluster_id;
> 
>       irq = platform_get_irq(sdev, 0);
> 
> which looks like a real one.
> 
> list_add() should be at the very end of the probe in order not to 
> "corrupt" the l2cache_pmu list.
> 
> 
> 
> Adding Julia if she wishes to dig it a little more with coccinelle.
> 
> CJ
> 
