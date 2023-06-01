Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB037C77B7A
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Jun 2023 07:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbjFAHA4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 1 Jun 2023 03:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbjFAHAw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Jun 2023 03:00:52 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0356E7
        for <kernel-janitors@vger.kernel.org>; Thu,  1 Jun 2023 00:00:50 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30adc51b65cso445859f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Jun 2023 00:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685602849; x=1688194849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OxRrgRUPXLg+KQfV8mbcGNrsYGuYiAw0+HbpYENHkuo=;
        b=Q+U8feg49vDgFpsb7m0jneUFU2dpXKxRfKkHHZWFBk+CsusjfKM/aNSWZ+i2+GVUxe
         8cyfcQlOHPwHOGe3A/jyX6e5eRlq1FsZttHd/EOOGUYLxCCI54gOB8lBZcbneTzUJtzW
         2fA+UH9v3w50bHbp3trMRcnGdZrGrSXCOL95IFPWHjLKUMqdu+KnH3ovQ0AYqMT+XNqP
         PQD9FPbrC32WLKnDuUQ9xfV5A+9VHg2XVTt1lT2pFJa55R0mlNefGiR2GR/eSeRA+kO6
         KvWo5xahIRjnZSjwoNVSVzZU0KRCjuwKCGpP9Bi90PsO3yaaV6ubJ7Wp0N3KAKoClsNv
         rsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685602849; x=1688194849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxRrgRUPXLg+KQfV8mbcGNrsYGuYiAw0+HbpYENHkuo=;
        b=h4AFdXMQHMf0FCRg4TZ4wwdRqfeRzPRYQHMMqbGygROIAwXWFI+57bLkC4bgkr2J6V
         oYuPAl/2Z6JQFXOA+61Bx7T25bkGTlry6dr5lum26DZQdng6ire+jy+a9qA+g5BIFyi7
         6VPCksth6WbKNDGEu342dIXq6R4PkzhmAVK0RD5j4xnq3rA9F1aQvWU7K8SRR6XSTyFK
         lwzUo/Fr0MNGCRzVVwLctRyHmv8A8p9rb9ZDWnjWCz4m4lJheivQEkcJ6tK4vsxB+kEh
         KX1QwDHysLJkzi/NgdfnY+4iybc5tWMdtD8R1ZDKeKvtluAjNBjjT7nlghfPhIkX8T7H
         SxPA==
X-Gm-Message-State: AC+VfDzvvcuTuxObuJxAHH/34CW+v5TtubngCJ4j3BYT1AxraKZc8qLy
        bltomB8KFcBLiF76tOihv5wyZQ==
X-Google-Smtp-Source: ACHHUZ7yNt737oU21xIIW2lgNoIdEG8AG9XzKhuCs1zoBCZJWYS4cvQZIp3g+70eVynk7RddIPylHw==
X-Received: by 2002:a5d:4a4d:0:b0:307:8718:7891 with SMTP id v13-20020a5d4a4d000000b0030787187891mr929355wrs.54.1685602849326;
        Thu, 01 Jun 2023 00:00:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l5-20020adffe85000000b00307a83ea722sm9207174wrr.58.2023.06.01.00.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:00:47 -0700 (PDT)
Date:   Thu, 1 Jun 2023 10:00:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Sukrut Bellary <sukrut.bellary@linux.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] misc: fastrpc: Fix double free of 'buf' in error path
Message-ID: <22f7e4db-1380-4326-906f-83a85447471a@kadam.mountain>
References: <20230518100829.515143-1-sukrut.bellary@linux.com>
 <9194ebdf-f335-4cd6-bf89-bb4f86a57784@kili.mountain>
 <f47b17c1-1c02-2aa3-ba10-fcef70cb25a8@linaro.org>
 <b0115d7d-d15a-4948-8726-09a8b37f3f36@kili.mountain>
 <4aa42c38-e0e2-4d2d-bfe2-15bc151f7117@linaro.org>
 <ZGf+99vmXpN5nJ2f@dev-linux.lan>
 <ZHgicqL/TKuXHM0o@dev-linux.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHgicqL/TKuXHM0o@dev-linux.lan>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 31, 2023 at 09:45:38PM -0700, Sukrut Bellary wrote:
> On Fri, May 19, 2023 at 03:57:59PM -0700, Sukrut Bellary wrote:
> > On Fri, May 19, 2023 at 11:39:59AM +0100, Srinivas Kandagatla wrote:
> > > 
> > > 
> > > On 19/05/2023 11:22, Dan Carpenter wrote:
> > > > > ----------------------->cut<---------------------------
> > > > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > > > index f60bbf99485c..3fdd326e1ae8 100644
> > > > > --- a/drivers/misc/fastrpc.c
> > > > > +++ b/drivers/misc/fastrpc.c
> > > > > @@ -1891,7 +1891,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl,
> > > > > char __user *argp)
> > > > >                                        &args[0]);
> > > > >          if (err) {
> > > > >                  dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
> > > > > -               goto err_invoke;
> > > > > +               fastrpc_buf_free(buf);
> > > > > +               return err;
> > > > >          }
> > > > > 
> > > > >          /* update the buffer to be able to deallocate the memory on the DSP
> > > > > */
> > > > > @@ -1930,11 +1931,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl,
> > > > > char __user *argp)
> > > > >          return 0;
> > > > > 
> > > > >   err_assign:
> > > > > -       fastrpc_req_munmap_impl(fl, buf);
> > > > > -err_invoke:
> > > > > -       fastrpc_buf_free(buf);
> > > > > -
> > > > > -       return err;
> > > > > +       return fastrpc_req_munmap_impl(fl, buf);
> > > > 
> > > > This will return success if copy_to_user() fails.
> > > > 
> > > that is true, using return value of fastrpc_req_munmap_impl does not really
> > > make sense here we should just return err in either case to the user.
> > >
> >
> 
> I have one follow-up question before I send the v2 patch.
> With the following approach, I do see one issue.
> 
> ----------------------->cut<---------------------------
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f60bbf99485c..3fdd326e1ae8 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1891,7 +1891,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl,
> char __user *argp)
>                                       &args[0]);
>         if (err) {
>                 dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
> -               goto err_invoke;
> +               fastrpc_buf_free(buf);
> +               return err;
>         }
> 
>         /* update the buffer to be able to deallocate the memory on the DSP */
> @@ -1930,11 +1931,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl,
> char __user *argp)
>         return 0;
> 
>  err_assign:
> -       fastrpc_req_munmap_impl(fl, buf);
> -err_invoke:
> -       fastrpc_buf_free(buf);
> -
> -       return err;
> +       fastrpc_req_munmap_impl(fl, buf);
> +       return err;
>  }
> ----------------------->cut<---------------------------
> 
> In this, if qcom_scm_assign_mem() fails, the buf is not added to the list.
> But the call to fastrpc_req_munmap_impl() tries to delete the buf
> from the list.
> 
> To avoid this, we can use the following approach.

The list is initialized in __fastrpc_buf_alloc().

	INIT_LIST_HEAD(&buf->node);

So calling list_del(&buf->node); is fine.  It's not necessary but it's
not harmful.

regards,
dan carpenter

