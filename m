Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82D0C6FA89
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Sep 2022 17:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiIORgH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Sep 2022 13:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbiIORgF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Sep 2022 13:36:05 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F289A9E0FC
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Sep 2022 10:36:03 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id dv25so43694786ejb.12
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Sep 2022 10:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=xxprw39tRPkSL4ZeO72Twpa1ttQ9qdSpWu5XWi0LeF8=;
        b=DeDexu417J9RVs5lVxFI0JVku3YggtVVq2Rb1vQPXW+7hCa24y6KPOFV7U+lrXUvnJ
         aE/3C0bIg2dO8kjVKUUidFGfZpsks2r1JuOIVbO7donMP8zttHMx1zafPUPcmo0hdxaI
         zlZzL58YqJ6ViMoclSxn4eEDnQCukYPjCGPN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=xxprw39tRPkSL4ZeO72Twpa1ttQ9qdSpWu5XWi0LeF8=;
        b=tVtwksTr3/Gle8RA0+cicj30wjii1Hk7CXNWcvwGmtgca+k2mqp0C4kqoZgGgwobth
         RTMHCr3Pq1YXmQDvQPLBM2ReazMYlZCjH8G3eqfZjSv3Nc8/9VcS9s+165wl2GnbEUx2
         QruaTArd4m8sOxEgcLnA/JEH1EprvbYTZhZXbBgPWHWgBUnvcLxqgRZcKDxWm8Va1OQt
         E80+R+oaCUkryRYKMVCkGbYKGuYypp5xm69KfnSbSOXFrBDNyJKQU5vHEOJlRQAKxmQP
         5rezPLje6Qmo1g5OT5XQS/vuDPeS7aCYTXsoeVlaYhcnpj0VLQt7Ofa+mpYd895OWBQu
         Ei6g==
X-Gm-Message-State: ACrzQf3UUEFOXTjj3IVtWSzi2vWkt4RW/zKyaSySlUERQyZLfFSbNNJx
        Uc+BzhT79jLfTkN2++Qttcpwuiqijm7E9COSW1kFC9iqSGZ//IybB00GTUITkRwxraaYUCAMU3g
        1AJjipFAJLLigNmsSfp1DgLxlg6tl+fyGQw==
X-Google-Smtp-Source: AMsMyM4ekZhjwQRKaE++1fa2Uwz321P/xEA2Yipgrcckw541PRpGssjbGUQLqonrbbCKwTiYm2dXTb0iwuxqnrR0ze4=
X-Received: by 2002:a17:907:2da6:b0:741:608f:718c with SMTP id
 gt38-20020a1709072da600b00741608f718cmr728838ejc.271.1663263362245; Thu, 15
 Sep 2022 10:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <YyMIJh1HU2Qz9+Rs@kili>
In-Reply-To: <YyMIJh1HU2Qz9+Rs@kili>
From:   Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>
Date:   Thu, 15 Sep 2022 11:35:46 -0600
Message-ID: <CAFdVvOxYKD9RVPo6ZHhwRXM5BGDqftNbE5m-hK+s149OYwMasg@mail.gmail.com>
Subject: Re: [PATCH 1/2] scsi: mpi3mr: fix error codes in mpi3mr_report_manufacture()
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

ACK.

On Thu, Sep 15, 2022 at 5:10 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There are three error paths which return success:
> 1) Propagate the error code from mpi3mr_post_transport_req() if it fails.
> 2) Return -EINVAL if "ioc_status != MPI3_IOCSTATUS_SUCCESS".
> 3) Return -EINVAL if "le16_to_cpu(mpi_reply.response_data_length) !=
>    sizeof(struct rep_manu_reply)"
>
> Fixes: 2bd37e284914 ("scsi: mpi3mr: Add framework to issue MPT transport cmds")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/scsi/mpi3mr/mpi3mr_transport.c | 58 ++++++++++++++------------
>  1 file changed, 32 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/scsi/mpi3mr/mpi3mr_transport.c b/drivers/scsi/mpi3mr/mpi3mr_transport.c
> index 2367d9fe3fb9..74313cf68ad3 100644
> --- a/drivers/scsi/mpi3mr/mpi3mr_transport.c
> +++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c
> @@ -145,6 +145,7 @@ static int mpi3mr_report_manufacture(struct mpi3mr_ioc *mrioc,
>         u16 request_sz = sizeof(struct mpi3_smp_passthrough_request);
>         u16 reply_sz = sizeof(struct mpi3_smp_passthrough_reply);
>         u16 ioc_status;
> +       u8 *tmp;
>
>         if (mrioc->reset_in_progress) {
>                 ioc_err(mrioc, "%s: host reset in progress!\n", __func__);
> @@ -186,41 +187,46 @@ static int mpi3mr_report_manufacture(struct mpi3mr_ioc *mrioc,
>             "sending report manufacturer SMP request to sas_address(0x%016llx), port(%d)\n",
>             (unsigned long long)sas_address, port_id);
>
> -       if (mpi3mr_post_transport_req(mrioc, &mpi_request, request_sz,
> -           &mpi_reply, reply_sz, MPI3MR_INTADMCMD_TIMEOUT, &ioc_status))
> +       rc = mpi3mr_post_transport_req(mrioc, &mpi_request, request_sz,
> +                                      &mpi_reply, reply_sz,
> +                                      MPI3MR_INTADMCMD_TIMEOUT, &ioc_status);
> +       if (rc)
>                 goto out;
>
>         dprint_transport_info(mrioc,
>             "report manufacturer SMP request completed with ioc_status(0x%04x)\n",
>             ioc_status);
>
> -       if (ioc_status == MPI3_IOCSTATUS_SUCCESS) {
> -               u8 *tmp;
> +       if (ioc_status != MPI3_IOCSTATUS_SUCCESS) {
> +               rc = -EINVAL;
> +               goto out;
> +       }
>
> -               dprint_transport_info(mrioc,
> -                   "report manufacturer - reply data transfer size(%d)\n",
> -                   le16_to_cpu(mpi_reply.response_data_length));
> +       dprint_transport_info(mrioc,
> +           "report manufacturer - reply data transfer size(%d)\n",
> +           le16_to_cpu(mpi_reply.response_data_length));
>
> -               if (le16_to_cpu(mpi_reply.response_data_length) !=
> -                   sizeof(struct rep_manu_reply))
> -                       goto out;
> +       if (le16_to_cpu(mpi_reply.response_data_length) !=
> +           sizeof(struct rep_manu_reply)) {
> +               rc = -EINVAL;
> +               goto out;
> +       }
>
> -               strscpy(edev->vendor_id, manufacture_reply->vendor_id,
> -                    SAS_EXPANDER_VENDOR_ID_LEN);
> -               strscpy(edev->product_id, manufacture_reply->product_id,
> -                    SAS_EXPANDER_PRODUCT_ID_LEN);
> -               strscpy(edev->product_rev, manufacture_reply->product_rev,
> -                    SAS_EXPANDER_PRODUCT_REV_LEN);
> -               edev->level = manufacture_reply->sas_format & 1;
> -               if (edev->level) {
> -                       strscpy(edev->component_vendor_id,
> -                           manufacture_reply->component_vendor_id,
> -                            SAS_EXPANDER_COMPONENT_VENDOR_ID_LEN);
> -                       tmp = (u8 *)&manufacture_reply->component_id;
> -                       edev->component_id = tmp[0] << 8 | tmp[1];
> -                       edev->component_revision_id =
> -                           manufacture_reply->component_revision_id;
> -               }
> +       strscpy(edev->vendor_id, manufacture_reply->vendor_id,
> +            SAS_EXPANDER_VENDOR_ID_LEN);
> +       strscpy(edev->product_id, manufacture_reply->product_id,
> +            SAS_EXPANDER_PRODUCT_ID_LEN);
> +       strscpy(edev->product_rev, manufacture_reply->product_rev,
> +            SAS_EXPANDER_PRODUCT_REV_LEN);
> +       edev->level = manufacture_reply->sas_format & 1;
> +       if (edev->level) {
> +               strscpy(edev->component_vendor_id,
> +                   manufacture_reply->component_vendor_id,
> +                    SAS_EXPANDER_COMPONENT_VENDOR_ID_LEN);
> +               tmp = (u8 *)&manufacture_reply->component_id;
> +               edev->component_id = tmp[0] << 8 | tmp[1];
> +               edev->component_revision_id =
> +                   manufacture_reply->component_revision_id;
>         }
>
>  out:
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
