Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EF5C54EE9
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Sep 2022 19:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234657AbiIDTkY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Sep 2022 15:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiIDTkW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Sep 2022 15:40:22 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5026B2C64C
        for <kernel-janitors@vger.kernel.org>; Sun,  4 Sep 2022 12:40:21 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id q9so6393509pgq.6
        for <kernel-janitors@vger.kernel.org>; Sun, 04 Sep 2022 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=MDcsvJ0GBpuH0g6y8YLh1YQ9EzLOBlW2vMl2goHhuss=;
        b=pS/G1ueXABNsXUTsPefqPql2U0AHKgLApYCjXSm0/nkYTOmhn/ytR5iUK6JFQ2aCc9
         xjbFkV3+9yh+CXj/+tv3VfOmoO3Ql7D22cInD9a2o23dTZWHcN9oY4GqAHhm6RKOStte
         SsfqweEjoxZcwfdb+DMRf8U6BgXhK9PEHyJuqNGgrdgDwGdZVXHWlfB9PSQhvcr5njWJ
         OXQqnI46ERAcxELkPZruPsxHgTxSQNjzr1pXefuE073qttIHXLuIshLz/YNMhVSDw3FH
         610MQAoaDHDnZZ8TpBMxbw9VIYYPfVhPxHcPwHCSaVWx/nXvgnGCLvOpytbecld2U021
         aoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MDcsvJ0GBpuH0g6y8YLh1YQ9EzLOBlW2vMl2goHhuss=;
        b=K8OGgteV23G3xM9DsuZLgKjeAc0o3KUMVUdmo7oQgEpSI+PKwdipqYBtrW84sgjTu6
         CCnCOGWQo1/06jTf2pLQ0oaw4c1+T99SEAgRcb93EEVT1+7s8Zc/0fWc0yQZ3anHU8Kd
         lRXn0y6R4JMfFM7bwkMqjVQSr7R7NFmzYKbBAsuiybbObKcJn77z7CnlV/GRqehs4LcV
         PmHILRH1AHZYn81DkuBCXoclz7YCsKJyfxvOt3ETQGZIvhr/do5+CrvtH/SjkJvrJNiH
         IjzNjZ9BDBWn/DP7LgaVF8PCJ9sBfDOFUtXQE0HL5QmTZovUrPyMkMfnHqXL0fKB+tAN
         dehw==
X-Gm-Message-State: ACgBeo2HPMP/JMKYuSEI2ql8TP434jdH3VzSzQIM0XjRR4D5K67iTv7q
        UKZiKqdyCNADuaV7N4KqIQw=
X-Google-Smtp-Source: AA6agR6BZRydqgnWNmNMfIs6/MEutON17IZdT84YqhNcSkNt3onQqGO/Tb6ZF4iXqVpv7dM3xBhGpA==
X-Received: by 2002:a05:6a00:21c5:b0:52b:fc9c:295b with SMTP id t5-20020a056a0021c500b0052bfc9c295bmr47283672pfj.56.1662320420687;
        Sun, 04 Sep 2022 12:40:20 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:291b])
        by smtp.gmail.com with ESMTPSA id s9-20020a170902b18900b00174f62a14e5sm5752903plr.153.2022.09.04.12.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 12:40:20 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date:   Sun, 4 Sep 2022 09:40:18 -1000
From:   Tejun Heo <tj@kernel.org>
To:     Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [bug report] cgroup: Honor caller's cgroup NS when resolving path
Message-ID: <YxT/IuyyyEzkJfnO@slm.duckdns.org>
References: <Yw8I2ef6OvlMaGEF@kili>
 <20220831090042.GB1845@blackbody.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220831090042.GB1845@blackbody.suse.cz>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello,

On Wed, Aug 31, 2022 at 11:00:42AM +0200, Michal Koutný wrote:
> +/*
> + * Returned cgroup is without refcount but it's valid as long as cset pins it.
> + */
>  static inline struct cgroup *__cset_cgroup_from_root(struct css_set *cset,
>  					    struct cgroup_root *root)

Yeah but what prevents the task from migrating away unpinning the whole
thing? Can you just get the ref on the cgroup before releasing css_set?
That's not an expensive operation and a lot more straightforward.

Thanks.

-- 
tejun
