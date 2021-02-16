Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ED2C433DB
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Feb 2021 10:14:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7917164DCF
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Feb 2021 10:14:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbhBPKNw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Feb 2021 05:13:52 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:47694 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhBPKNt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Feb 2021 05:13:49 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GABOpG044803;
        Tue, 16 Feb 2021 10:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=uKC3L5wZWH3NWqOYpMH4VxlUp/256L+FPa4tac54Ns0=;
 b=MBi0DcyejLFTQrAEu/axgZgsMUxoOWE7br9UN2MWRE4RfvrYTz2F+lkm4awzbyjl2SIU
 ERGmmk6qCaZbtEGKDJ5C3hd7cGCV4/CucP1XxPvGuKE+acdxhY++GP/Uf8rF966+sTwY
 DZdcNRV+01ice420rvSuaxZJn/gfZ+sP7zHsnU4QGtBsvZ5o2Ku8M0lOQKkWHUjrFzF3
 aNmYf3leV81Gu5LyMjIZVAPwhTCFhdO2ALQ6rjVdbAn3lkrMy6SYpwEzXIfH5aqlwqzl
 lls1rD9OJVWfEeIC/AKWCdOsYA0H0GxkAgpl0HLYjyem6lfKQNEK0v0I0SIxq3G/rtxe Iw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 36pd9a5syy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Feb 2021 10:13:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GA9V14050103;
        Tue, 16 Feb 2021 10:13:02 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 36prhrbj32-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Feb 2021 10:13:02 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11GAD1vI022156;
        Tue, 16 Feb 2021 10:13:01 GMT
Received: from mwanda (/10.175.221.77)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 16 Feb 2021 10:13:01 +0000
Date:   Tue, 16 Feb 2021 13:12:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     hkelam@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-af: cn10k: MAC internal loopback support
Message-ID: <YCuaqPZw9V8HeCrU@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102160094
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 impostorscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160093
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
Message-ID: <20210216101256.is2ENdNqocKrg56hwLeXXadiEbvRt7TTfWTAnrGjLsg@z>

Hello Hariprasad Kelam,

The patch 3ad3f8f93c81: "octeontx2-af: cn10k: MAC internal loopback
support" from Feb 11, 2021, leads to the following static checker
warning:

	drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c:731 rvu_cgx_config_intlbk()
	error: uninitialized symbol 'cgx_id'.

drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c
   723  static int rvu_cgx_config_intlbk(struct rvu *rvu, u16 pcifunc, bool en)
   724  {
   725          struct mac_ops *mac_ops;
   726          u8 cgx_id, lmac_id;
                   ^^^^^^

   727  
   728          if (!is_cgx_config_permitted(rvu, pcifunc))
   729                  return -EPERM;
   730  
   731          mac_ops = get_mac_ops(rvu_cgx_pdata(cgx_id, rvu));
                                                    ^^^^^^
Uninitialized.  This code probably hasn't been tested very well.

   732  
   733          return mac_ops->mac_lmac_intl_lbk(rvu_cgx_pdata(cgx_id, rvu),
   734                                            lmac_id, en);
   735  }

regards,
dan carpenter
