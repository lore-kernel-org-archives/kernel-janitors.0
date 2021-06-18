Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5AFC48BDF
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 09:17:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DD4E613B4
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 09:17:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhFRJUC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Jun 2021 05:20:02 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45326 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229819AbhFRJUA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Jun 2021 05:20:00 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15I9Apt7028628;
        Fri, 18 Jun 2021 09:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=3OZDlLy2T3nam64IUzrztbkNooT/lcdy2Ulj2koIMeE=;
 b=TeVZ/FHwP8UJkAbBr3xqpFxMEHYIZv9WKJxh+kB92OnmjNpCHgtYGlRWuhb00LFEZE8j
 Aez9S3N8hAzSKAwt52K5NoF/8WnJYXTCoyq0IN1QU209dmgBeIEwQtKQGFLOu9O/zdn0
 O4XquofmctMO5Ql1uD3rNnfkSdivY9RN/9iJ5KU17O22AF7eeL/nuP6xuWXNiOruK5fl
 TN5VnEErhwK+LmL50qvXmWINZYjxlwRkFw+Plto7gG42T9GOU2uBQBZkLoqndBEMWz1a
 kaibiDSNQMgjs+bU9oc0Tthd11sk6nUGg/KAWINzFjaenD8Y9iQ64YXksaBWpJzQKVJM kw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 39770hd22n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 09:17:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15I9FD9R190998;
        Fri, 18 Jun 2021 09:17:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 396waxjtmp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 09:17:50 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15I9Fcsv193334;
        Fri, 18 Jun 2021 09:17:49 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 396waxjtkr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 09:17:49 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15I9Hmav031255;
        Fri, 18 Jun 2021 09:17:48 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 18 Jun 2021 02:17:47 -0700
Date:   Fri, 18 Jun 2021 12:17:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     sbhatta@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-pf: Add police action for TC flower
Message-ID: <YMxktv1mY74cOjTN@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: _MOrjKGK_IkdpO0WlfWrXdMCRIoOUZEv
X-Proofpoint-ORIG-GUID: _MOrjKGK_IkdpO0WlfWrXdMCRIoOUZEv
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Subbaraya Sundeep,

The patch 68fbff68dbea: "octeontx2-pf: Add police action for TC
flower" from Jun 15, 2021, leads to the following static checker
warning:

drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c:363 otx2_tc_parse_actions() error: uninitialized symbol 'rate'.
drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c:363 otx2_tc_parse_actions() error: uninitialized symbol 'burst'.
drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c:364 otx2_tc_parse_actions() error: uninitialized symbol 'pps'.

drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c
   325                  case FLOW_ACTION_POLICE:
   326                          /* Ingress ratelimiting is not supported on OcteonTx2 */
   327                          if (is_dev_otx2(nic->pdev)) {
   328                                  NL_SET_ERR_MSG_MOD(extack,
   329                                          "Ingress policing not supported on this platform");
   330                                  return -EOPNOTSUPP;
   331                          }
   332  
   333                          if (act->police.rate_bytes_ps > 0) {
   334                                  rate = act->police.rate_bytes_ps * 8;
   335                                  burst = act->police.burst;
   336                          } else if (act->police.rate_pkt_ps > 0) {
   337                                  /* The algorithm used to calculate rate
   338                                   * mantissa, exponent values for a given token
   339                                   * rate (token can be byte or packet) requires
   340                                   * token rate to be mutiplied by 8.
   341                                   */
   342                                  rate = act->police.rate_pkt_ps * 8;
   343                                  burst = act->police.burst_pkt;
   344                                  pps = true;
   345                          }

Maybe:
	else {
		return -EINVAL;
	}

   346                          nr_police++;
   347                          break;
   348                  case FLOW_ACTION_MARK:
   349                          mark = act->mark;
   350                          break;
   351                  default:
   352                          return -EOPNOTSUPP;
   353                  }
   354          }
   355  
   356          if (nr_police > 1) {
   357                  NL_SET_ERR_MSG_MOD(extack,
   358                                     "rate limit police offload requires a single action");
   359                  return -EOPNOTSUPP;
   360          }
   361  
   362          if (nr_police)
   363                  return otx2_tc_act_set_police(nic, node, f, rate, burst,
   364                                                mark, req, pps);
   365  
   366          return 0;
   367  }

regards,
dan carpenter
