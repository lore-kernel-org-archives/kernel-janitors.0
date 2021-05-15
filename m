Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D2DC433ED
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 May 2021 10:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D5C9613B5
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 May 2021 10:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbhEOKlM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 15 May 2021 06:41:12 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:36894 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbhEOKlL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 15 May 2021 06:41:11 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14FAZUoV010206;
        Sat, 15 May 2021 10:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=LHDvw/yHCM6AlsH7YySMf1sCkCDlF8F7R0vav7BBSBA=;
 b=vWgdwailDlIJ1Ubeig7KqQhJgVWNlmLiwSCR29uQo04cTjXQ8gM/ISb0KLrLkuN3Tzco
 dETCQboI+z2ElOrpQIiiAOkpNYhHKnqgtBSuR5P9my0Zq/lB83OsUqnv2nPb+LR5SNyC
 0bT/21nRXSofF10W9Yu1RONjUHFxDp5FlcrPfUzQ0AOQ617L7Z8hAi51sN5nGQyyKR1K
 EJ6YDri7sz5HM6dSGmcTESGrW7K82JEsX56XsNeyJ63fOehjMnr2kfZjVT7LfSnjldib
 giSsSwOj7xzs/MFVY0igBRt0jlwgcuSbi0ff37ig8hvMg3pZJcKx6viz2gyWPTY/Dd9M TA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 38j6xn8a7p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 May 2021 10:39:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14FAYtJT056517;
        Sat, 15 May 2021 10:39:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38j641h8yj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 May 2021 10:39:56 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14FAdtOr072225;
        Sat, 15 May 2021 10:39:55 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 38j641h8wx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 May 2021 10:39:55 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14FAdrOF004601;
        Sat, 15 May 2021 10:39:53 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 15 May 2021 03:39:52 -0700
Date:   Sat, 15 May 2021 13:39:47 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     joel@joelfernandes.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] sched: Fix priority inversion of cookied task with
 sibling
Message-ID: <YJ+k86G8TRabcHDx@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: u6ys3cUT4v6o6L223lpOJyGrvnLer0ZM
X-Proofpoint-ORIG-GUID: u6ys3cUT4v6o6L223lpOJyGrvnLer0ZM
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9984 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105150075
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Joel Fernandes (Google),

This is a semi-automatic email about new static checker warnings.

The patch 7afbba119f0d: "sched: Fix priority inversion of cookied 
task with sibling" from Nov 17, 2020, leads to the following Smatch 
complaint:

    kernel/sched/core.c:5492 pick_next_task()
    error: we previously assumed 'next' could be null (see line 5488)

kernel/sched/core.c
  5481          /*
  5482           * Optimize for common case where this CPU has no cookies
  5483           * and there are no cookied tasks running on siblings.
  5484           */
  5485          if (!need_sync) {
  5486                  for_each_class(class) {
  5487                          next = class->pick_task(rq);
  5488                          if (next)
  5489                                  break;

Is it possible to go through the whole loop withint finding a next?

  5490                  }
  5491  
  5492                  if (!next->core_cookie) {
                             ^^^^^^^^^^^^^^^^^
I assume not, but I don't read the code, I just forward the warnings
on.  I am a bot.  Beep Boop!

  5493                          rq->core_pick = NULL;
  5494                          /*
  5495                           * For robustness, update the min_vruntime_fi for
  5496                           * unconstrained picks as well.
  5497                           */
  5498                          WARN_ON_ONCE(fi_before);
  5499                          task_vruntime_update(rq, next, false);
  5500                          goto done;
  5501                  }
  5502          }
  5503  
  5504          for_each_cpu(i, smt_mask) {
  5505                  struct rq *rq_i = cpu_rq(i);
  5506  

regards,
dan carpenter
