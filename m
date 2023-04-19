Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5F0C6FD18
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 09:37:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbjDSJhD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 05:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbjDSJhA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 05:37:00 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95992C654
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 02:36:54 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso1987389wmo.0
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681897013; x=1684489013;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRf1I+qcFMCzsCyYXxlBavOpDrL+n10xbDkbUuZpGLg=;
        b=Tu9z1DvVam36coeePyQH09PPf2UtuIfjzXkTAQi/M3bjOjwoDLKavz62apJQYHPvy/
         PdFpfQCmJTjdrACGXh5cD31Iv0gRNOTUgZpOGiSf1s8S6EF7KsVL53rldmgNY3dXR2jJ
         Gzxu2CRkF7d7HojUMdU4sVdfuUpJ3tHuBrzDA0NFyuigC5s5BP4Gtjta6Tb1p1NLFEje
         MkIFpiONZnMGIUgCUnPIBQJ0ic7TT7qz7in8XyZyP9esHlJkYhx1E9h+EZb1MsDig3P9
         hNfHEWgD9YC/4HjlDgxt25fnbL+s9YpR4u/2ET9cmHjux5dRDcPITp/MwmtXtehNhSMp
         woag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681897013; x=1684489013;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRf1I+qcFMCzsCyYXxlBavOpDrL+n10xbDkbUuZpGLg=;
        b=hDgTHtz7p1IVDaXHPC0FfMvp2ad68jMLoftwYopWAh2lSU72hx1fcoDLPgq7cD1df6
         F8bjb9yjMULvbteWZIGLliZK4nFcSXRPdtaL3DK5AvqR7xpH66WJQqopM5ie0zL67zFH
         twYReVtMJTsSggDzNNwQ4oMUCZHork6FymM7Broem1q9jO02SaiZaiQtQpexZ1zzS4WP
         /Zd3syIMVGpSWZwWd/Gg/Ywna4u4sIirAYZvi/QOG0kkt76vVW9vKjRE9dQO28f5vgmh
         MXmUyKuKS01p151VjooRdbneqoG3zoctN3HbznMgT9V4BZNRVdcG7pp0o1O+AGT9Fo+t
         Ne8w==
X-Gm-Message-State: AAQBX9cjJjyBGSk3hCyLhCkFjmi/oVFHKP3QjMji3WcG2CrHjHQ6POM6
        rE5ahXhLK70dFJsVJc4zn/I/QA==
X-Google-Smtp-Source: AKy350Z2Tv/7Bxw0OwqMyw1FmGC684WGRU1EFk8Xxa2H1Pd8P7hu0OqTznc1SqhMpt1CkTZJGpbLbg==
X-Received: by 2002:a7b:c40c:0:b0:3ee:5519:fae1 with SMTP id k12-20020a7bc40c000000b003ee5519fae1mr16145001wmi.12.1681897013048;
        Wed, 19 Apr 2023 02:36:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c14-20020a7bc84e000000b003ee20b4b2dasm1569340wml.46.2023.04.19.02.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 02:36:52 -0700 (PDT)
Date:   Wed, 19 Apr 2023 12:36:49 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     kah.jing.lee@intel.com
Cc:     Radu Bacrau <radu.bacrau@intel.com>,
        Ang Tien Sung <tien.sung.ang@intel.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: [bug report] firmware: stratix10-svc: extend svc to support RSU
 feature
Message-ID: <c993535a-297a-4278-9958-dfef281745ff@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Kah Jing Lee,

The patch 1b4394c5d731: "firmware: stratix10-svc: extend svc to
support RSU feature" from Jul 11, 2022, leads to the following Smatch
static checker warning:

	drivers/firmware/stratix10-svc.c:627 svc_normal_to_secure_thread()
	warn: 'pdata->command == 10' 'false' implies 'pdata->command != 10' is 'true'

drivers/firmware/stratix10-svc.c
    383 static int svc_normal_to_secure_thread(void *data)
    384 {
    385         struct stratix10_svc_controller
    386                         *ctrl = (struct stratix10_svc_controller *)data;
    387         struct stratix10_svc_data *pdata;
    388         struct stratix10_svc_cb_data *cbdata;
    389         struct arm_smccc_res res;
    390         unsigned long a0, a1, a2, a3, a4, a5, a6, a7;
    391         int ret_fifo = 0;
    392 
    393         pdata =  kmalloc(sizeof(*pdata), GFP_KERNEL);
    394         if (!pdata)
    395                 return -ENOMEM;
    396 
    397         cbdata = kmalloc(sizeof(*cbdata), GFP_KERNEL);
    398         if (!cbdata) {
    399                 kfree(pdata);
    400                 return -ENOMEM;
    401         }
    402 
    403         /* default set, to remove build warning */
    404         a0 = INTEL_SIP_SMC_FPGA_CONFIG_LOOPBACK;
    405         a1 = 0;
    406         a2 = 0;
    407         a3 = 0;
    408         a4 = 0;
    409         a5 = 0;
    410         a6 = 0;
    411         a7 = 0;
    412 
    413         pr_debug("smc_hvc_shm_thread is running\n");
    414 
    415         while (!kthread_should_stop()) {
    416                 ret_fifo = kfifo_out_spinlocked(&ctrl->svc_fifo,
    417                                                 pdata, sizeof(*pdata),
    418                                                 &ctrl->svc_fifo_lock);
    419 
    420                 if (!ret_fifo)
    421                         continue;
    422 
    423                 pr_debug("get from FIFO pa=0x%016x, command=%u, size=%u\n",
    424                          (unsigned int)pdata->paddr, pdata->command,
    425                          (unsigned int)pdata->size);
    426 
    427                 switch (pdata->command) {
    428                 case COMMAND_RECONFIG_DATA_CLAIM:
    429                         svc_thread_cmd_data_claim(ctrl, pdata, cbdata);
    430                         continue;
    431                 case COMMAND_RECONFIG:
    432                         a0 = INTEL_SIP_SMC_FPGA_CONFIG_START;
    433                         pr_debug("conf_type=%u\n", (unsigned int)pdata->flag);
    434                         a1 = pdata->flag;
    435                         a2 = 0;
    436                         break;
    437                 case COMMAND_RECONFIG_DATA_SUBMIT:
    438                         a0 = INTEL_SIP_SMC_FPGA_CONFIG_WRITE;
    439                         a1 = (unsigned long)pdata->paddr;
    440                         a2 = (unsigned long)pdata->size;
    441                         break;
    442                 case COMMAND_RECONFIG_STATUS:
    443                         a0 = INTEL_SIP_SMC_FPGA_CONFIG_ISDONE;
    444                         a1 = 0;
    445                         a2 = 0;
    446                         break;
    447                 case COMMAND_RSU_STATUS:
    448                         a0 = INTEL_SIP_SMC_RSU_STATUS;
    449                         a1 = 0;
    450                         a2 = 0;
    451                         break;
    452                 case COMMAND_RSU_UPDATE:
    453                         a0 = INTEL_SIP_SMC_RSU_UPDATE;
    454                         a1 = pdata->arg[0];
    455                         a2 = 0;
    456                         break;
    457                 case COMMAND_RSU_NOTIFY:
    458                         a0 = INTEL_SIP_SMC_RSU_NOTIFY;
    459                         a1 = pdata->arg[0];
    460                         a2 = 0;
    461                         break;
    462                 case COMMAND_RSU_RETRY:
    463                         a0 = INTEL_SIP_SMC_RSU_RETRY_COUNTER;
    464                         a1 = 0;
    465                         a2 = 0;
    466                         break;
    467                 case COMMAND_RSU_MAX_RETRY:
    468                         a0 = INTEL_SIP_SMC_RSU_MAX_RETRY;
    469                         a1 = 0;
    470                         a2 = 0;
    471                         break;
    472                 case COMMAND_RSU_DCMF_VERSION:
    473                         a0 = INTEL_SIP_SMC_RSU_DCMF_VERSION;
    474                         a1 = 0;
    475                         a2 = 0;
    476                         break;
    477                 case COMMAND_FIRMWARE_VERSION:
    478                         a0 = INTEL_SIP_SMC_FIRMWARE_VERSION;
    479                         a1 = 0;
    480                         a2 = 0;
    481                         break;
    482 
    483                 /* for FCS */
    484                 case COMMAND_FCS_DATA_ENCRYPTION:
    485                         a0 = INTEL_SIP_SMC_FCS_CRYPTION;
    486                         a1 = 1;
    487                         a2 = (unsigned long)pdata->paddr;
    488                         a3 = (unsigned long)pdata->size;
    489                         a4 = (unsigned long)pdata->paddr_output;
    490                         a5 = (unsigned long)pdata->size_output;
    491                         break;
    492                 case COMMAND_FCS_DATA_DECRYPTION:
    493                         a0 = INTEL_SIP_SMC_FCS_CRYPTION;
    494                         a1 = 0;
    495                         a2 = (unsigned long)pdata->paddr;
    496                         a3 = (unsigned long)pdata->size;
    497                         a4 = (unsigned long)pdata->paddr_output;
    498                         a5 = (unsigned long)pdata->size_output;
    499                         break;
    500                 case COMMAND_FCS_RANDOM_NUMBER_GEN:
    501                         a0 = INTEL_SIP_SMC_FCS_RANDOM_NUMBER;
    502                         a1 = (unsigned long)pdata->paddr;
    503                         a2 = 0;
    504                         break;
    505                 case COMMAND_FCS_REQUEST_SERVICE:
    506                         a0 = INTEL_SIP_SMC_FCS_SERVICE_REQUEST;
    507                         a1 = (unsigned long)pdata->paddr;
    508                         a2 = (unsigned long)pdata->size;
    509                         break;
    510                 case COMMAND_FCS_SEND_CERTIFICATE:
    511                         a0 = INTEL_SIP_SMC_FCS_SEND_CERTIFICATE;
    512                         a1 = (unsigned long)pdata->paddr;
    513                         a2 = (unsigned long)pdata->size;
    514                         break;
    515                 case COMMAND_FCS_GET_PROVISION_DATA:
    516                         a0 = INTEL_SIP_SMC_FCS_GET_PROVISION_DATA;
    517                         a1 = (unsigned long)pdata->paddr;
    518                         a2 = 0;
    519                         break;
    520 
    521                 /* for polling */
    522                 case COMMAND_POLL_SERVICE_STATUS:
    523                         a0 = INTEL_SIP_SMC_SERVICE_COMPLETED;
    524                         a1 = (unsigned long)pdata->paddr;
    525                         a2 = (unsigned long)pdata->size;
    526                         break;
    527                 case COMMAND_RSU_DCMF_STATUS:
    528                         a0 = INTEL_SIP_SMC_RSU_DCMF_STATUS;
    529                         a1 = 0;
    530                         a2 = 0;
    531                         break;
    532                 case COMMAND_SMC_SVC_VERSION:
    533                         a0 = INTEL_SIP_SMC_SVC_VERSION;
    534                         a1 = 0;
    535                         a2 = 0;
    536                         break;
    537                 default:
    538                         pr_warn("it shouldn't happen\n");
    539                         break;
    540                 }
    541                 pr_debug("%s: before SMC call -- a0=0x%016x a1=0x%016x",
    542                          __func__,
    543                          (unsigned int)a0,
    544                          (unsigned int)a1);
    545                 pr_debug(" a2=0x%016x\n", (unsigned int)a2);
    546                 pr_debug(" a3=0x%016x\n", (unsigned int)a3);
    547                 pr_debug(" a4=0x%016x\n", (unsigned int)a4);
    548                 pr_debug(" a5=0x%016x\n", (unsigned int)a5);
    549                 ctrl->invoke_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
    550 
    551                 pr_debug("%s: after SMC call -- res.a0=0x%016x",
    552                          __func__, (unsigned int)res.a0);
    553                 pr_debug(" res.a1=0x%016x, res.a2=0x%016x",
    554                          (unsigned int)res.a1, (unsigned int)res.a2);
    555                 pr_debug(" res.a3=0x%016x\n", (unsigned int)res.a3);
    556 
    557                 if (pdata->command == COMMAND_RSU_STATUS) {
    558                         if (res.a0 == INTEL_SIP_SMC_RSU_ERROR)
    559                                 cbdata->status = BIT(SVC_STATUS_ERROR);
    560                         else
    561                                 cbdata->status = BIT(SVC_STATUS_OK);
    562 
    563                         cbdata->kaddr1 = &res;
    564                         cbdata->kaddr2 = NULL;
    565                         cbdata->kaddr3 = NULL;
    566                         pdata->chan->scl->receive_cb(pdata->chan->scl, cbdata);
    567                         continue;

If pdata->command is COMMAND_RSU_STATUS then we continue

    568                 }
    569 
    570                 switch (res.a0) {
    571                 case INTEL_SIP_SMC_STATUS_OK:
    572                         svc_thread_recv_status_ok(pdata, cbdata, res);
    573                         break;
    574                 case INTEL_SIP_SMC_STATUS_BUSY:
    575                         switch (pdata->command) {
    576                         case COMMAND_RECONFIG_DATA_SUBMIT:
    577                                 svc_thread_cmd_data_claim(ctrl,
    578                                                           pdata, cbdata);
    579                                 break;
    580                         case COMMAND_RECONFIG_STATUS:
    581                         case COMMAND_POLL_SERVICE_STATUS:
    582                                 svc_thread_cmd_config_status(ctrl,
    583                                                              pdata, cbdata);
    584                                 break;
    585                         default:
    586                                 pr_warn("it shouldn't happen\n");
    587                                 break;
    588                         }
    589                         break;
    590                 case INTEL_SIP_SMC_STATUS_REJECTED:
    591                         pr_debug("%s: STATUS_REJECTED\n", __func__);
    592                         /* for FCS */
    593                         switch (pdata->command) {
    594                         case COMMAND_FCS_REQUEST_SERVICE:
    595                         case COMMAND_FCS_SEND_CERTIFICATE:
    596                         case COMMAND_FCS_GET_PROVISION_DATA:
    597                         case COMMAND_FCS_DATA_ENCRYPTION:
    598                         case COMMAND_FCS_DATA_DECRYPTION:
    599                         case COMMAND_FCS_RANDOM_NUMBER_GEN:
    600                                 cbdata->status = BIT(SVC_STATUS_INVALID_PARAM);
    601                                 cbdata->kaddr1 = NULL;
    602                                 cbdata->kaddr2 = NULL;
    603                                 cbdata->kaddr3 = NULL;
    604                                 pdata->chan->scl->receive_cb(pdata->chan->scl,
    605                                                              cbdata);
    606                                 break;
    607                         }
    608                         break;
    609                 case INTEL_SIP_SMC_STATUS_ERROR:
    610                 case INTEL_SIP_SMC_RSU_ERROR:
    611                         pr_err("%s: STATUS_ERROR\n", __func__);
    612                         cbdata->status = BIT(SVC_STATUS_ERROR);
    613                         cbdata->kaddr1 = &res.a1;
    614                         cbdata->kaddr2 = (res.a2) ?
    615                                 svc_pa_to_va(res.a2) : NULL;
    616                         cbdata->kaddr3 = (res.a3) ? &res.a3 : NULL;
    617                         pdata->chan->scl->receive_cb(pdata->chan->scl, cbdata);
    618                         break;
    619                 default:
    620                         pr_warn("Secure firmware doesn't support...\n");
    621 
    622                         /*
    623                          * be compatible with older version firmware which
    624                          * doesn't support newer RSU commands
    625                          */
    626                         if ((pdata->command != COMMAND_RSU_UPDATE) &&
--> 627                                 (pdata->command != COMMAND_RSU_STATUS)) {

So we know that "pdata->command" is not COMMAND_RSU_STATUS here.  I
wonder if this is supposed to be COMMAND_RSU_DCMF_STATUS instead?

    628                                 cbdata->status =
    629                                         BIT(SVC_STATUS_NO_SUPPORT);
    630                                 cbdata->kaddr1 = NULL;
    631                                 cbdata->kaddr2 = NULL;
    632                                 cbdata->kaddr3 = NULL;
    633                                 pdata->chan->scl->receive_cb(
    634                                         pdata->chan->scl, cbdata);
    635                         }
    636                         break;
    637 
    638                 }
    639         }
    640 
    641         kfree(cbdata);
    642         kfree(pdata);
    643 
    644         return 0;
    645 }

regards,
dan carpenter
