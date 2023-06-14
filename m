Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86824EB64D8
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Jun 2023 06:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243250AbjFNGiZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 14 Jun 2023 02:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243235AbjFNGiF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 14 Jun 2023 02:38:05 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997CD2133
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Jun 2023 23:37:54 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f6255ad8aeso8039422e87.2
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Jun 2023 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686724673; x=1689316673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HDDTxuacA0pUAaX8v28sZ4XWpyAsoRlZfrn5LoBwrDU=;
        b=TeWjUsQNg9LMShn9kNrW0wIVF2x0Kn0EJZT0dQCltqTqQF9+HRXExwpaqTt/uIz8CJ
         dAUQrEeNo1RNc8dePe7I+gFz9yg9tPTmPnUkIzlLkXfKSDyvHUgsG1p6peRJPYXbX6rH
         jfsi5k79uUtAGLiRCmor8dsDUX/qLoZLZ8A+kbSQ/8EV/9MEeS+m7OIQ7WjbsDTov1iB
         Y6QICD3LPZ812gU/nc5uGBp7lX20G8nSbN15x9YL3D2YOs28yZdSmQ0zLLlOaTUaqX+a
         iPesYn/2Bg0mdgHX2BPlyuLBuJSSSm22rZV/PQ0w4kKnH1inFog/g89+YLMHlzOOxig8
         3r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686724673; x=1689316673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDDTxuacA0pUAaX8v28sZ4XWpyAsoRlZfrn5LoBwrDU=;
        b=foYXcY2qHP4bAj90RjfL9XnyEMsvSd/kZJNUUIzqJ6RvrH1IWcd5Sweup8TXKKhuPZ
         BPP5+JIk2sOgBPkCs8IArJVFdjm189imDkHy2m3nMTWJNjNeCV3dvMQHvmG+rna33KDb
         a0BWtmN29C8A6eFPYs8173ghP84eiZKKjnpNoOk50pjJtN5ebDXjuvIB+BWdGIfm6GhR
         5iybyz6qRCOViAyN0RiZjO9GLzuTrDJh/hmhLyoWJ1z0WLhE+B/9yMPwwYaaQiH9kPbv
         9teaT1LI0VYrUw79th8Z2zEWNPuR5GFbOFVBLEI6uSEgn0VWDlTpI5HGrnSgYJGBxNxH
         Y9Zg==
X-Gm-Message-State: AC+VfDxDJjI1KXBsgFFm2MJ5HU8j+kBXoVN7kiGb3gFAOrr0z/+9RLLN
        T0Scj2XSIY/XCMrnJU32rsBZWA==
X-Google-Smtp-Source: ACHHUZ72q47aq5bY5bsm9efeG69vhDQcUXnnfTksizv3+Z0zIk1U4wQbPVd1v+urU1z0+UPjlLmjEA==
X-Received: by 2002:a05:6512:32ab:b0:4f3:b32d:f744 with SMTP id q11-20020a05651232ab00b004f3b32df744mr6924667lfe.11.1686724672641;
        Tue, 13 Jun 2023 23:37:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z8-20020a05600c220800b003f8db429095sm63794wml.28.2023.06.13.23.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 23:37:51 -0700 (PDT)
Date:   Wed, 14 Jun 2023 09:37:48 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] serial: core: don't kfree device managed data
Message-ID: <22dd5593-6d7f-45fa-ac13-13f0fd3f0c38@kadam.mountain>
References: <ZH7tsTmWY5b/4m+6@moroto>
 <ZH8xwKuI9WqRUu5H@smile.fi.intel.com>
 <c1a2467b-7a30-4eaa-9206-3b47d3ae64e6@kadam.mountain>
 <ZH9I1DCyfa8tEzIz@smile.fi.intel.com>
 <dbd168c0-1ef2-4270-b6e2-3a489cdf6a14@kadam.mountain>
 <20230606161840.GL56720@atomide.com>
 <20230614044607.GF14287@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614044607.GF14287@atomide.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 14, 2023 at 07:46:07AM +0300, Tony Lindgren wrote:
> Hi Dan,
> 
> * Tony Lindgren <tony@atomide.com> [230606 19:18]:
> > * Dan Carpenter <dan.carpenter@linaro.org> [230606 15:01]:
> > > On Tue, Jun 06, 2023 at 05:55:16PM +0300, Andy Shevchenko wrote:
> > > > 
> > > > I'm okay with the above, but it seems at the same time we need to limit the
> > > > messages:
> > > > 
> > > > 	dev_err_once(port->dev, "uart_add_one_port() called before arch_initcall()?\n");
> > > > 
> > > 
> > > Yeah.  I would prefer if that was only printed as a debug message.
> > > -EPROBE_DEFER is supposed to be a normal part of the process.
> > 
> > Debug here should do the trick yeah.
> 
> Just wondering.. Are you going to send this fix or do you want me to type
> it up?

I've sent it now.  Thanks!

regards,
dan carpenter


