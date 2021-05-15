Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A790C433ED
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 May 2021 10:43:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2EDF613C7
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 May 2021 10:43:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbhEOKoS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 15 May 2021 06:44:18 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:39948 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbhEOKoQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 15 May 2021 06:44:16 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14FAh1IG038850;
        Sat, 15 May 2021 10:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Aw1u5ow0Hl5ySHNll3atH0LmQQZ28gK7oK0V7pcLdJ8=;
 b=wFQN6WDU+OcpTcuOCE8UBs2y8UDGqCfre7jms8z22ec3P6YIRwhml827QbI5C8UrOOHW
 keGShm/43NzQJ17+6exYRnRqRN239ASybCTBq0n34kwqmgOloWAIz1Uo2/Uflp2uhg+g
 264ryTRUV9kxF5p3HNfT1ZFSwyFDmj4dynJG72vhM7pzpn2B/fVLjtxsM2R+MVbk7/X3
 e4uCe8NnEgtMeKNKC7xpsWI1f4lh+AlEEBI5ysiuFzYwkGxprHsaJnhn9ecy8bmz1VXx
 Zp/yEmL0XHLIgzfowo8JR8NbrfmNiBqRb8MYOGD0p81TEst6uE97pbCCF5riRQuI6JZx cw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 38j68m8b44-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 May 2021 10:43:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14FAe14g130603;
        Sat, 15 May 2021 10:43:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38j4b9rpre-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 May 2021 10:43:00 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14FAh0TL138029;
        Sat, 15 May 2021 10:43:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 38j4b9rpr8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 May 2021 10:43:00 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14FAgx4I006168;
        Sat, 15 May 2021 10:42:59 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 15 May 2021 03:42:58 -0700
Date:   Sat, 15 May 2021 13:42:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ayush.sawal@chelsio.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] cxgb4/ch_ktls: Clear resources when pf4 device is
 removed
Message-ID: <YJ+lregUoryep/Ix@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: 2RfmvCdwGxd9cmjp2hQPz5T1UBPPwEFy
X-Proofpoint-GUID: 2RfmvCdwGxd9cmjp2hQPz5T1UBPPwEFy
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9984 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105150075
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ayush Sawal,

This is a semi-automatic email about new static checker warnings.

The patch 65e302a9bd57: "cxgb4/ch_ktls: Clear resources when pf4 
device is removed" from May 13, 2021, leads to the following Smatch 
complaint:

    drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c:393 chcr_ktls_dev_del()
    error: we previously assumed 'u_ctx' could be null (see line 374)

drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
   373		u_ctx = tx_info->adap->uld[CXGB4_ULD_KTLS].handle;
   374		if (u_ctx && u_ctx->detach)
                    ^^^^^
Can u_ctx be NULL?

   375			return;
   376		/* clear l2t entry */
   377		if (tx_info->l2te)
   378			cxgb4_l2t_release(tx_info->l2te);
   379	
   380	#if IS_ENABLED(CONFIG_IPV6)
   381		/* clear clip entry */
   382		if (tx_info->ip_family == AF_INET6)
   383			cxgb4_clip_release(netdev, (const u32 *)
   384					   &tx_info->sk->sk_v6_rcv_saddr,
   385					   1);
   386	#endif
   387	
   388		/* clear tid */
   389		if (tx_info->tid != -1) {
   390			cxgb4_remove_tid(&tx_info->adap->tids, tx_info->tx_chan,
   391					 tx_info->tid, tx_info->ip_family);
   392	
   393			xa_erase(&u_ctx->tid_list, tx_info->tid);
                                 ^^^^^^^^^^^^^^^^
Unchecked dereference.

   394		}
   395	

regards,
dan carpenter
