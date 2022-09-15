Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67917ECAAA1
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Sep 2022 17:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiIORbb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Sep 2022 13:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiIORb3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Sep 2022 13:31:29 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5029DB6C
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Sep 2022 10:31:28 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id r18so43730899eja.11
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Sep 2022 10:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FQjGdIcJdN4Rln05k+P43b+dDaom5atC7Q5YoKO6+4Q=;
        b=XusZ+hEpOBFGF3BV9wA1MJHxIm39QhMS+X9vLXT9JNtpZHh0wmUMG0LmvCsZI0yEBU
         byL0Jjg1fFO3nu9oS2ecCjy6EwbMddqFNHltL/m9HPO6jHHT8mDSz3KmRIpvRuiUy/c1
         VWVK5E5wBIJ/tymi6OLAcnzyyq9oDC/D6nA3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FQjGdIcJdN4Rln05k+P43b+dDaom5atC7Q5YoKO6+4Q=;
        b=8JdbFQV5nTwmXm4xMflBBKEZHoAlGrXPRsYjxlPZesntMxdPhCbztD9yO2pQLNuikC
         y3wZ9p2gjrS15KJijY2Wb1NkoqD7TeXRUWm78t0utU2MGAykeVD2AcPINFVwnHDXQqXz
         x+ELmoOdTrOgFnPlEisuSInfzW0UFSExH+Zt88oPwt9cxYsgqSB3Hnno6XEqkQoIuhu2
         lSzNubeU3MGUMAWh1qWj0tkE0J7zjrhLkeaBy3KjFMfbEZawU1qP1uf59JK91Er9JSo7
         XvIbE/6Qjh70hQD48g7HYx1WNrUaVMDlMW90nTQF/RXCVFve8fvPSgt3xmryeGI3v1yn
         2YMA==
X-Gm-Message-State: ACrzQf3N1bnOhtrhCcWnIeqPQrTCMRCO2wziM4QUNjCVnG6UnOl0MGOg
        FITJY6ZNj8cqI35r8if6y8IRDXEIL3CqaXdDt/NMqWdqcXI2UekX9nXtiFZbvWUKvtrDdYXqHIL
        FyOBzHQLdxg/VvgmhDtNX42UgORTtRWJ04g==
X-Google-Smtp-Source: AMsMyM5Y9ZMsG8Mo1SA48Y0QEQSxOQciRtdl2FgrFzLhqIfJgeBrYjJj1XTWMDfbS3UOO9Nn/TyxpiwXnZxzZhSe4jk=
X-Received: by 2002:a17:907:3e95:b0:780:559f:6339 with SMTP id
 hs21-20020a1709073e9500b00780559f6339mr718094ejc.618.1663263086666; Thu, 15
 Sep 2022 10:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <YyMIJh1HU2Qz9+Rs@kili> <YyMISJzVDARpVwrr@kili>
In-Reply-To: <YyMISJzVDARpVwrr@kili>
From:   Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>
Date:   Thu, 15 Sep 2022 11:31:10 -0600
Message-ID: <CAFdVvOzCHqurEAMTFGwUAtOnqEecoiH9NLyw83B92VfdqmbwYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] scsi: mpi3mr: Fix error code in mpi3mr_transport_smp_handler()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
        Kashyap Desai <kashyap.desai@broadcom.com>,
        Sumit Saxena <sumit.saxena@broadcom.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Himanshu Madhani <himanshu.madhani@oracle.com>,
        mpi3mr-drvr-developers <mpi3mr-linuxdrv.pdl@broadcom.com>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

ACK. Thanks for fixing it.


On Thu, Sep 15, 2022 at 5:11 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The error code from mpi3mr_post_transport_req() is supposed to be
> passed to bsg_job_done(job, rc, reslen), but it isn't.
>
> Fixes: 176d4aa69c6e ("scsi: mpi3mr: Support SAS transport class callbacks")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/scsi/mpi3mr/mpi3mr_transport.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/scsi/mpi3mr/mpi3mr_transport.c b/drivers/scsi/mpi3mr/mpi3mr_transport.c
> index 74313cf68ad3..3fc897336b5e 100644
> --- a/drivers/scsi/mpi3mr/mpi3mr_transport.c
> +++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c
> @@ -3245,8 +3245,10 @@ mpi3mr_transport_smp_handler(struct bsg_job *job, struct Scsi_Host *shost,
>
>         dprint_transport_info(mrioc, "sending SMP request\n");
>
> -       if (mpi3mr_post_transport_req(mrioc, &mpi_request, request_sz,
> -           &mpi_reply, reply_sz, MPI3MR_INTADMCMD_TIMEOUT, &ioc_status))
> +       rc = mpi3mr_post_transport_req(mrioc, &mpi_request, request_sz,
> +                                      &mpi_reply, reply_sz,
> +                                      MPI3MR_INTADMCMD_TIMEOUT, &ioc_status);
> +       if (rc)
>                 goto unmap_in;
>
>         dprint_transport_info(mrioc,
> --
> 2.35.1
>

-- 
This electronic communication and the information and any files transmitted 
with it, or attached to it, are confidential and are intended solely for 
the use of the individual or entity to whom it is addressed and may contain 
information that is confidential, legally privileged, protected by privacy 
laws, or otherwise restricted from disclosure to anyone else. If you are 
not the intended recipient or the person responsible for delivering the 
e-mail to the intended recipient, you are hereby notified that any use, 
copying, distributing, dissemination, forwarding, printing, or copying of 
this e-mail is strictly prohibited. If you received this e-mail in error, 
please return the e-mail to the sender, delete it from your computer, and 
destroy any printed copy of it.
