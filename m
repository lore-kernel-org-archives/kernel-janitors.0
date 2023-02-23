Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9A4C61DA4
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Feb 2023 13:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234328AbjBWNrS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Feb 2023 08:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234185AbjBWNrQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Feb 2023 08:47:16 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3686E52DFC
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Feb 2023 05:46:45 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id t15so10834314wrz.7
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Feb 2023 05:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CujEyvSJE/IO9pjb4sCokwTmyoG8z4geTEBGmcR2Bls=;
        b=mI/nfJB5dQRmAxOhsR4FECgnODp8N8DBvqMDU2GkjARYAyr70Tlfwmq1LTEu7f1CXj
         HABROqNItd9Qrgl8fmStrPF1b5NPucHe4KEwb1h6mOj+Plegx2x0t75R6dnPfAqzWLGe
         rLgVOEVNc+utHh9UaxT8OKE5HW8lqNDB9dv6EgKk9IxbaXuYpynoTMGFt6KxCdHMWmoz
         uA8aRDkaJF4pGFQ7F6+WH31jDTwrDeirs7LS/OiJosH4Q5mxvryj/gjol2uD+WwqRT2K
         TDz+c+ZhExUSD+uTm57rAykDjfi1VUur3eBck5vnr84+PUYBRjns+qr714RfWE4yHbPm
         Qgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CujEyvSJE/IO9pjb4sCokwTmyoG8z4geTEBGmcR2Bls=;
        b=EH0ChmB+MmTPv8u0YPKLwLca8ODC86FP2hSE5MmkAPFZEgSG3e4iYmlM+gJixRpmGr
         s1eC/1TuOW15/5T4Mo8DNWCW9gEsux1PQ9vbdym1AwYFQ/o2BA3zsostLjc52Cmq20sf
         YCf3r9GtfRIcLYvlddo/cBowpJq/9YF6zLXJi70HYql97sT7qKA7NZopKMzMv1jpTKsz
         +sAm/ffHREBX16ekWilCKExL4tq+k/xJwSWzkcdFTPY9EE2Uqo0ltuNNizSMDFgqHxkT
         wVLMvot7WdgyQ6L7Nlca4dNrK/+YywEwhUzDjNj5RrkeSMsHQAQOin9mkXSVOPQgkuud
         KrBA==
X-Gm-Message-State: AO0yUKU+yr6Tn8UEIX2qhVEUda+VIdc08koQbhHX2+wQqaXbxzup0dmf
        G/S1Rlno4yQH3sgYHn+FsPecFivTqY4nvg==
X-Google-Smtp-Source: AK7set+e9t5Vshm6z6eaYkX4CGhzt6Ikhco9Rmk0u21oMjJL1uu+wgUZz8I8HUp4Wi1mv/VDxyvLVw==
X-Received: by 2002:a5d:4cce:0:b0:2c5:5d18:ae1c with SMTP id c14-20020a5d4cce000000b002c55d18ae1cmr9834271wrt.31.1677159966941;
        Thu, 23 Feb 2023 05:46:06 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d4b8f000000b002c561805a4csm12227030wrt.45.2023.02.23.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:46:06 -0800 (PST)
Date:   Thu, 23 Feb 2023 16:46:02 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Pedro Tammela <pctammela@mojatatu.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net/sched: act_connmark: transition to percpu stats
 and rcu
Message-ID: <Y/duGjxviQsilSGh@kadam>
References: <Y/XKI5EcXRamuVyC@kili>
 <df0374b1-3924-3349-5005-b9bc65252663@mojatatu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df0374b1-3924-3349-5005-b9bc65252663@mojatatu.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Feb 23, 2023 at 10:25:32AM -0300, Pedro Tammela wrote:
> 
> Hi Dan,
> 
> Thanks for the report. I will send a fix shortly.
> Is `make C=2` enough to catch these warnings?

Thanks!  This was a Smatch warning:

https://staticthinking.wordpress.com/2022/04/25/how-to-run-smatch-on-your-code/

regards,
dan carpenter

