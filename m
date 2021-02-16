Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B95C433E0
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Feb 2021 10:16:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C06F764DCF
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Feb 2021 10:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhBPKPv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Feb 2021 05:15:51 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:35370 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhBPKPo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Feb 2021 05:15:44 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GAEuLX181582;
        Tue, 16 Feb 2021 10:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=RzychXOCanty65nLElu3rZ5BPihcYAIL+KiM2mt7biY=;
 b=i2YCkSch+OK0vREt5qFyIL8wZIVYTD7YFEAWCuwnN8iqpBcJyctUrryJBT2QQDfsJOBv
 8PX0NrMvgzjcg8rtq3zOX1FPYVu3UkSGpDF8X+0YUhkvcX92COwxhLSaE67N0O5T0nre
 ILkyJypEbWKQ2qYLJ2iKAu8wNjzgdnSlPJbkqLHy2MkBTpxSpn1ffEB7Couw34Sghk6o
 /axrsRan61IRlpO+GxWtH52sOfl0V8lCZhqp9JkRTSCUSNiuGiHRFRAmmBoYJCfhq8Gg
 Uucj6QJAsTEfbbF3Ysy2161AEEg5P5u7cXGaqYrGpyqi6VklmUCs5OUeAmrcqZmSDNDP rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 36p66qxb9f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Feb 2021 10:15:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GAAKAS026236;
        Tue, 16 Feb 2021 10:15:00 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 36prbn0p2m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Feb 2021 10:15:00 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11GAExJV023300;
        Tue, 16 Feb 2021 10:14:59 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 16 Feb 2021 02:14:59 -0800
Date:   Tue, 16 Feb 2021 13:14:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     hkelam@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] octeontx2-af: cn10k: MAC internal loopback support
Message-ID: <20210216101453.GF2222@kadam>
References: <YCuaqPZw9V8HeCrU@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCuaqPZw9V8HeCrU@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102160094
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102160094
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
Message-ID: <20210216101453.UZGNoxySpI3S2q2kbN52tx-ACMQiyIRAcnaJxglRTUw@z>

On Tue, Feb 16, 2021 at 01:12:56PM +0300, Dan Carpenter wrote:
> Hello Hariprasad Kelam,
> 
> The patch 3ad3f8f93c81: "octeontx2-af: cn10k: MAC internal loopback
> support" from Feb 11, 2021, leads to the following static checker
> warning:
> 
> 	drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c:731 rvu_cgx_config_intlbk()
> 	error: uninitialized symbol 'cgx_id'.
> 
> drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c
>    723  static int rvu_cgx_config_intlbk(struct rvu *rvu, u16 pcifunc, bool en)
>    724  {
>    725          struct mac_ops *mac_ops;
>    726          u8 cgx_id, lmac_id;
>                    ^^^^^^
> 
>    727  
>    728          if (!is_cgx_config_permitted(rvu, pcifunc))
>    729                  return -EPERM;
>    730  
>    731          mac_ops = get_mac_ops(rvu_cgx_pdata(cgx_id, rvu));
>                                                     ^^^^^^
> Uninitialized.  This code probably hasn't been tested very well.
> 
>    732  
>    733          return mac_ops->mac_lmac_intl_lbk(rvu_cgx_pdata(cgx_id, rvu),
>    734                                            lmac_id, en);
                                                    ^^^^^^^

drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c:734
rvu_cgx_config_intlbk() error: uninitialized symbol 'lmac_id'.

This isn't initialized either.

regards,
dan carpenter

