Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4B1C7619A
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Apr 2023 09:47:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjDKJr2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Apr 2023 05:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjDKJr1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Apr 2023 05:47:27 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B4A1997
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Apr 2023 02:47:26 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id d8-20020a05600c3ac800b003ee6e324b19so3912680wms.1
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Apr 2023 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681206444; x=1683798444;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rXRE+eSh2Nq3WZT4zcqvNzAngJK2UdFNOyUaX65fdH8=;
        b=PI5NV11eigg6FHKuEp1lqhWpqge4bHq5zaUmYoSFyCEliYtHAZS5+722ed4gCYTtCk
         sY2+BkkOpU6ziLxRG3r+BTEbm6VIyBs+/O9khkqajAFyBta2EMg5qCjVXQXl22q1zJK2
         iB8DI1zmfdIhfb5XeyTazMKjkZuCHNSciNTlOyTWMLWgnNjVeb+cMtgl0QfiedGXWgv/
         mn0bbEMogFhDrcuGE/Wa9BjRMKlEu8I+5aJBOSvQCHl+TVRGIYISQdnRBr7f+rlDqCcm
         07cQo2Vpd9YgXUrvJkqyRq9u6cPax21/QqBJhN8KJVAQKTwyr5FU9NeuJsaYzsTmQRO8
         C08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681206444; x=1683798444;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXRE+eSh2Nq3WZT4zcqvNzAngJK2UdFNOyUaX65fdH8=;
        b=RS0NuOzVfffQLnBO/hT3xhnz507O2JdVMpdDJJxMpbFLHN8ZFyOmfF3o/XLR+vyj0A
         pQGtkFN2bMxa8fqjpQCVlOgS5Jp8euDIBOEz0xKN0si4a5wp6E9lCkw6YP0CnuJw9gEi
         +cSe/r5aSzu8tt3DBnyuFFM0/2vTmVtGZmD/NBqfuN9LBwFuDqU3PfTxpxfXuUSo2dje
         rBWqQxZfE7mMOn+qX08Y8ZAhwQYDuZ/cF9NfLWyvhp27vgFxApSn/wf9a2tvXnyiWx9Y
         n2p4rzdcfg9c6nncdujpbM5GPzZIjCjR5MdmeJtRjIn0d0cbgE2V+ukmxf2nM29JO1lm
         Lv9Q==
X-Gm-Message-State: AAQBX9coFMlAPgBYdJ2xMM4KKc9mvjBsWQJuoG09VoPQI0EgqZCAqXEb
        fyhvO9XJVwj48+2shTlFxpw=
X-Google-Smtp-Source: AKy350bZU53wq9AF95CcsWhg5q8T/32TDbk4POP9TzetPYVgjU8iYnRW/urX8YpORQ7EH4BKM/Zt8w==
X-Received: by 2002:a05:600c:3787:b0:3ed:29d9:56ae with SMTP id o7-20020a05600c378700b003ed29d956aemr9070956wmr.6.1681206444469;
        Tue, 11 Apr 2023 02:47:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p15-20020a1c740f000000b003edc11c2ecbsm16531341wmc.4.2023.04.11.02.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 02:47:24 -0700 (PDT)
Date:   Tue, 11 Apr 2023 12:47:10 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr,
        kernel-janitors@vger.kernel.org
Subject: Re: [cocci] Reconsidering pointer dereferences before null pointer
 checks (with SmPL)
Message-ID: <11c630fb-8c17-425c-82fb-becdb90cfbe2@kili.mountain>
References: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <alpine.DEB.2.22.394.2304092044020.3028@hadrien>
 <95caa4c1-2455-2733-ef4b-3ab07783c725@web.de>
 <alpine.DEB.2.22.394.2304100824510.3387@hadrien>
 <2de88997-0732-d0dd-5178-f9d42b5a3be5@web.de>
 <alpine.DEB.2.22.394.2304100959310.3387@hadrien>
 <31b51efc-afbe-ec34-255e-9df60983ec3d@web.de>
 <alpine.DEB.2.22.394.2304101415040.2875@hadrien>
 <5defca25-d893-f61a-ec24-aa99ba39d8a7@web.de>
 <4d2383c7-b923-31a2-2c26-7b34b3b13c7@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d2383c7-b923-31a2-2c26-7b34b3b13c7@inria.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Apr 11, 2023 at 09:40:23AM +0200, Julia Lawall wrote:
> 
> 
> On Tue, 11 Apr 2023, Markus Elfring wrote:
> 
> > >>>> https://stackoverflow.com/questions/25725286/does-taking-address-of-member-variable-through-a-null-pointer-yield-undefined-be
> > >>>> https://en.cppreference.com/w/c/language/behavior
> > >>>
> > >>> The statement:
> > >>>
> > >>> "... &((*ptr).second) which dereferences an object instance pointer"
> > >>>
> > >>> is not correct.  &((*ptr).second) does not dereference *ptr any more than
> > >>> &x deferences x.  The semantics of & doesn't work like that.
> > >>
> > >> Does the usage of the operator “member access through pointer” (arrow) mean also
> > >> a dereference in comparison to the asterisk operator in the C programming language?
> > >
> > > Not when there is a & in front.  you can just look at the generated
> > > assembly code to see that.  The goal of & is to take the address of
> > > something, not to evaluate the thing.
> >
> > Would you like to take another look at recent responses by David Svoboda?
> > https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereference+null+pointers?focusedCommentId=405504153#comment-405504153
> 
> His previous comment says that the standard doesn't mention &a->b so it is
> a problem.  He is surely more of an expert on the C standard than I am.

In the linux-kernel we do a lot of things that are not in the C
standard.  The linux-kernel is written with specific versions of GCC
and Clang in mind.  It's not expected that other compilers will be able
to compile the kernel.

So &a->b is just fine in the linux kernel.

regards,
dan carpenter
