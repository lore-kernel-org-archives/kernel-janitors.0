Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523A5CD68F4
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Oct 2023 06:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442318AbjJJGun (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 10 Oct 2023 02:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442295AbjJJGul (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Oct 2023 02:50:41 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478C89F
        for <kernel-janitors@vger.kernel.org>; Mon,  9 Oct 2023 23:50:40 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso49823645e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Oct 2023 23:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696920639; x=1697525439; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4+ZnCmsiIjDOI7+G6oFSFUqgwkxiTGWVv3o1tlgEkWg=;
        b=hqy3+lidNp8xrQaWLauGLDVHdv2N1EZ8z/1EXv21BqzWf+T7Oi8H3bFibXLkXqbZlF
         k867QxilUNWeJnDmOBGuOYmEFgwz1Li0njV1dolqvh6CwLqL+Y1o9veoHAT7BFTasc2o
         8KMQhhP5TCxRn13suD7+C6MvLcNZNgSAKSoUEw08nqHukA0i5t5PofDRjF1RcMThHB3T
         q4ZKsrJ5UGQQyME+GrFm8RC29Sr/nDNnT78Bs1cRxO5nT4eYPEodJXUsGOUqdqdb9ysQ
         nO9oVohpRIzSSpoi2InoOoVbIs927d9AwzksKXStU0FFNo07C8V60J1IRs+/GLMarwQ8
         dTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696920639; x=1697525439;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+ZnCmsiIjDOI7+G6oFSFUqgwkxiTGWVv3o1tlgEkWg=;
        b=rqYzzmqVTZbeeQM/lyxs5aigqTb+XQm6hlnk+OspkZ9a3cos1F9TOL9wAqCExgEknZ
         yCKol2OycjRElQwmavZJTFvZcxht/7Q8dzcPAfwKF3Kvt19i7kwybHP4u2Lr9SAseXcs
         Z/bIPWUgTvbgkDirhF4byRAgN4lI4IVyDGOo9LMEkkcgGmQ/Kv7BaJXnsGcRwLLGiYOq
         45PSfPFbeThdy3yFNL84GWFayhgyNF3mU2Bc0nSbpxrB+zCBsuwfNmpvBkO1TkAKdvuZ
         9KYJar137hzUIt3DLrVX7CB9KttUjTgGfJzjEKlFpQA8No0AC5aFpL8dJQ9WfpiJMOiE
         K1xw==
X-Gm-Message-State: AOJu0YzrRHcpthINKYc7KdLEWQS5SrA/IaWqwvDg+KLTIj8bJEXzerx5
        1ZsmNrBvP87kyEeU2NOJegGWBw==
X-Google-Smtp-Source: AGHT+IGJUvDehxwyY3/BU10by5TRD7en+XPWdKEQNGH9wgoIAE4SfX/4rSB7NDCzEQLXCW0A0IQOyw==
X-Received: by 2002:a05:600c:d1:b0:405:3a3d:6f42 with SMTP id u17-20020a05600c00d100b004053a3d6f42mr15341100wmm.39.1696920638607;
        Mon, 09 Oct 2023 23:50:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h11-20020a056000000b00b00325a59b2080sm11705066wrx.97.2023.10.09.23.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 23:50:38 -0700 (PDT)
Date:   Tue, 10 Oct 2023 09:50:35 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Derek Chickles <derek.chickles@caviumnetworks.com>,
        Satanand Burla <satananda.burla@caviumnetworks.com>,
        Felix Manlunas <felix.manlunas@caviumnetworks.com>,
        Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: liquidio: fix mixed module-builtin object
Message-ID: <666e3fb4-4acc-403c-9e16-cef3e931dd34@kadam.mountain>
References: <512670ff-bdec-487c-9bac-e6b52b4b1a5d@moroto.mountain>
 <CAK7LNATxBV9DaAimMduuR-C+_L=CSy5UyAE31gQ8h1xEj7B8AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATxBV9DaAimMduuR-C+_L=CSy5UyAE31gQ8h1xEj7B8AQ@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Yeah.  You're right.  It's just weird that this warning suddenly showed
up in my allmodconfig after so many years.  Anyway, let's add the
Cavium people to the CC list and see if they care.

Otherwise, forget about it.  Probably people build this as a module if
modules are allowed so it doesn't affect people in real life.

regards,
dan carpenter

On Sun, Oct 08, 2023 at 12:00:00AM +0900, Masahiro Yamada wrote:
> On Sat, Oct 7, 2023 at 5:58 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hello Masahiro Yamada,
> >
> > The patch f71be9d084c9: "net: liquidio: fix mixed module-builtin
> > object" from Jun 7, 2023 (linux-next), leads to the following Smatch
> > static checker warning:
> 
> 
> Why is f71be9d084c9 related?
> 
> I can compile lio_main.c as built-in even before that commit.
> 
> 
> >
> >         drivers/net/ethernet/cavium/liquidio/lio_main.c:810 liquidio_watchdog()
> >         error: NULL dereference inside function 'module_refcount()'.
> >
> > drivers/net/ethernet/cavium/liquidio/lio_main.c
> >     800                 disable_all_vf_links(other_oct);
> >     801                 all_vf_links_are_disabled = true;
> >     802
> >     803 #ifdef CONFIG_MODULE_UNLOAD
> >
> > This code is old and buggy, but I think it's possibly the recent changes
> > which make this bug visible.  Modules can be enabled but it doesn't mean
> > that this particular driver was built as a module.  I think we want to
> > test #if MODULE as well?
> 
> 
> I do not know because I do not know what was intended
> in that code.
> 
> "git show 9ff1a9bad867215e4a7ceeef4e9311d1232902fa"
> lists people involved in the buggy code.
> Please talk to them.
> 
> 
> This seems a fishy driver.
> drivers/net/ethernet/cavium/liquidio/lio_main.c
> is the only driver code that calls module_refcount()
> and checks CONFIG_MODULE_UNLOAD.
> 
> 
> 
> 
> >     804                 vfs_mask1 = READ_ONCE(oct->sriov_info.vf_drv_loaded_mask);
> >     805                 vfs_mask2 = READ_ONCE(other_oct->sriov_info.vf_drv_loaded_mask);
> >     806
> >     807                 vfs_referencing_pf  = hweight64(vfs_mask1);
> >     808                 vfs_referencing_pf += hweight64(vfs_mask2);
> >     809
> > --> 810                 refcount = module_refcount(THIS_MODULE);
> >                                                    ^^^^^^^^^^^
> > This will crash because THIS_MODULE is NULL when it's built in to the
> > kernel.
> >
> >     811                 if (refcount >= vfs_referencing_pf) {
> >     812                         while (vfs_referencing_pf) {
> >     813                                 module_put(THIS_MODULE);
> >     814                                 vfs_referencing_pf--;
> >     815                         }
> >     816                 }
> >     817 #endif
> >     818         }
> >     819
> >     820         return 0;
> >     821 }
> >
> > regards,
> > dan carpenter
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
