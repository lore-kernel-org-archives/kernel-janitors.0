Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE2DC433DB
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 08:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B4DD6192B
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 08:18:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbhC0IS2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 27 Mar 2021 04:18:28 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:35812 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhC0ISO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 27 Mar 2021 04:18:14 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12R8B62G178960;
        Sat, 27 Mar 2021 08:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=RxG0tjTzP3F9OilmSDtQfVwX9x52G+ugMONFgUScd8c=;
 b=M/Y9k84jLcomLPisT2z1S9ZMp1+VbLpyHBU2h+FR+HDEry73q7y+yL7YaCcCNM8kyOt7
 WTRRDWelGAW+aY2kNVDlsJ+wTYyRJdi9kZaFiVXWt99CZJK2tP8UAXegH3/+XwD0Q6bB
 Ak2RHnaSxObCy+1TL3Y32aVBkKjOMMKPk/Pc8WcrTFhyEKt+kVsqMmrI4OUXd8J03bCj
 sDmjMLnpT0LS95t8nHFLAmI7U5nBOkeKfKEbCzU+QrtsY8jFLT2cfQn08mwiyA1Rcw3h
 s8YJJNrd5ZbGD60N32B4eq9Az67C+fAwP8jhgvQQ7taSkViasaXRELkYIGgJADNMlr2K Rg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 37hwbn84ev-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Mar 2021 08:18:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12R8FORR061602;
        Sat, 27 Mar 2021 08:18:08 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 37htrcyr4y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Mar 2021 08:18:08 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12R8I66Z009571;
        Sat, 27 Mar 2021 08:18:07 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 27 Mar 2021 01:18:06 -0700
Date:   Sat, 27 Mar 2021 11:17:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     gregkh@linuxfoundation.org, marcocesati@gmail.com,
        ross.schm.dev@gmail.com, fabioaiuto83@gmail.com,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next 5/6] staging: rtl8723bs: mark some variables as
 __maybe_unused
Message-ID: <20210327081758.GJ1667@kadam>
References: <20210327001736.180881-1-eantoranz@gmail.com>
 <20210327001736.180881-5-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210327001736.180881-5-eantoranz@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103270066
X-Proofpoint-GUID: 0mvLealRDG_B1NbcG65fEwzgDPIVB2K8
X-Proofpoint-ORIG-GUID: 0mvLealRDG_B1NbcG65fEwzgDPIVB2K8
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 clxscore=1015
 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103270065
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is just papering over badness.  Leave the warnings as is so someone
will notice it and fix it properly in the future.

regards,
dan carpenter

