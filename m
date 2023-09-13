Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77E9EEB59A
	for <kernel-janitors@archiver.kernel.org>; Wed, 13 Sep 2023 06:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238357AbjIMGcT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 13 Sep 2023 02:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbjIMGcT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Sep 2023 02:32:19 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1FE1732
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Sep 2023 23:32:15 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso6075689f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Sep 2023 23:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694586733; x=1695191533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7qivlJCMaVg4OhszwDItIXcqLsMXxomkblOjI78ZSe0=;
        b=mqGHuKPIuVXFPsHpdKjXAWD0O+tGW+AUVpsSYr0oJ4koa3vbY8SCLB9g7oSldGfqN4
         03lcwkXNF8fwl4ZGwjcNkX5z6oJQK+Vz37Kz+BLQJDLkJgjcRCehgJ1wUM7KtuzkQh96
         7zX32EFnEQMocMZ0xLSgvT5LY49O0yd40+D4fkVRJVhpOHX+9dAe7ybheXKh0PeTgrw7
         IcHKIC3mkUi5dcMy7TiB3o08ihtQVNkrvni2t19njgv/MgdgUdYAqEuXXdMS+JAdpDiM
         NIvSIGql/G4vuwi2UCCgoKo8+cvQlUOeKQ+0RxrektbZugZwXqREHu+x57TorGrrSEhO
         61/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694586733; x=1695191533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qivlJCMaVg4OhszwDItIXcqLsMXxomkblOjI78ZSe0=;
        b=eLDvcmMzRtoH5OiVcMpG5yZKBEI5oMcujDFW6ez0leTUl3RGAHWPaAxZUQrqZENRDq
         Jj9TSwNb2ALswzrbywdEqBQVkt3/1VZeEvtM8wx0miNRYpiA3iahuZRwCE68LfBMIVmW
         6dUzfu09j9jFnZX0vWyGVrsKjZ3aQcJEN61Q40wOIYV2mBZOD6hLi/K3FbIspI+fj0Ep
         5jLRaAShSVhXF4PnSXF9bGatl/SAhbtXIURvCMCrsK4tDq2/2rn9g21j0ELNlYxZef87
         GouFKuY4nlhQ+YJqV9uiywEaDMdk2Uyt0NQVTaFvrrVIXSQsTcXSGb3Zat1q0uEpvdvW
         wvnQ==
X-Gm-Message-State: AOJu0YxvPime+u82KkB1JSLGqYJa0mJZUTJnUvjp8z1frjBpQFxs8fGF
        ppr2NJr7ihRC2VsXTdQfMFzOvQ==
X-Google-Smtp-Source: AGHT+IFLgbNNjiR4DdCGvpuElp8AEsWOHQjCfROEsReGABYxZyFLZYUc8maQbYBhXR6y29iNCDUacw==
X-Received: by 2002:a05:6000:926:b0:317:5849:c2e0 with SMTP id cx6-20020a056000092600b003175849c2e0mr1438760wrb.9.1694586733682;
        Tue, 12 Sep 2023 23:32:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d408c000000b003142ea7a661sm14482643wrp.21.2023.09.12.23.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 23:32:13 -0700 (PDT)
Date:   Wed, 13 Sep 2023 09:32:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     "Darrick J. Wong" <djwong@kernel.org>
Cc:     Chandan Babu R <chandan.babu@oracle.com>,
        Dave Chinner <dchinner@redhat.com>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        linux-xfs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] xfs: delete some dead code in xfile_create()
Message-ID: <df3c1a41-13a7-4531-8676-6c39dde2d055@kadam.mountain>
References: <1429a5db-874d-45f4-8571-7854d15da58d@moroto.mountain>
 <20230912153824.GB28186@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912153824.GB28186@frogsfrogsfrogs>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 12, 2023 at 08:38:24AM -0700, Darrick J. Wong wrote:
> On Tue, Sep 12, 2023 at 06:18:45PM +0300, Dan Carpenter wrote:
> > The shmem_file_setup() function can't return NULL so there is no need
> > to check and doing so is a bit confusing.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > No fixes tag because this is not a bug, just some confusing code.
> 
> Please don't re-send patches that have already been presented here.
> https://lore.kernel.org/linux-xfs/20230824161428.GO11263@frogsfrogsfrogs/
> 

Should we set an error code?  These kinds of impossible error situations
are hard to handle correctly.

Like there are some places were we work around bugs in driver code where
we can trust them to return error pointers and that's totally a valid
thing.  But here it's a very puzzling thing.

regards,
dan carpenter

