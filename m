Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E187BC433C1
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 08:22:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A390F619FB
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 08:22:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbhC0IVl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 27 Mar 2021 04:21:41 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:37104 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhC0IVU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 27 Mar 2021 04:21:20 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12R8Kkns195785;
        Sat, 27 Mar 2021 08:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=hfY4S7MOHrG//pt/CEKfYvC6/MCmtpoxNmI4HZ03R8k=;
 b=FTF8r1u71IEUn331q5XUjuvSmiq68UKRQmBuNSElmB/jIWBLpu3OLALgoqhA6/W217C2
 g0SAj2k2HE5k9aZyrDsV55ink4Wb0tDn5lUDJXU1nO8mqyvnVqQRcpz6NWkRVuH0ADqZ
 Tdg/hLG8ylBmgRN7QktO+1mevFHeJ/Vpn9S6qUIF3KRb7lwWsrioyL+t7Az4CSTkJYxd
 04EjX1xgCxhyl6yt3f3lPefUpsKRL/qWTHhh9brjWaVrUqJmk1rJLA3z76YVXgCqjZjA
 WPAT7owPL/5EADXbGza1KZaBaAHIGIuZuJeQNUv9ZV0JFDHZsVAU2ynAz3dvCH/EDRHt /Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 37hwbn84j2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Mar 2021 08:21:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12R8FPVL061833;
        Sat, 27 Mar 2021 08:21:14 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 37htrcysrm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Mar 2021 08:21:14 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12R8LDO1015804;
        Sat, 27 Mar 2021 08:21:13 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 27 Mar 2021 01:21:13 -0700
Date:   Sat, 27 Mar 2021 11:21:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     gregkh@linuxfoundation.org, marcocesati@gmail.com,
        ross.schm.dev@gmail.com, fabioaiuto83@gmail.com,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next 6/6] staging: rtl8723bs: sta_mgt: return _FAIL if
 there is an error
Message-ID: <20210327082105.GK1667@kadam>
References: <20210327001736.180881-1-eantoranz@gmail.com>
 <20210327001736.180881-6-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210327001736.180881-6-eantoranz@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103270066
X-Proofpoint-GUID: 6nBGOEu0eFTG02Eir4qZm56lWsR00zOK
X-Proofpoint-ORIG-GUID: 6nBGOEu0eFTG02Eir4qZm56lWsR00zOK
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 clxscore=1015
 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103270066
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 26, 2021 at 06:17:36PM -0600, Edmundo Carmona Antoranz wrote:
> If there is an error when calling rtw_init_bcmc_stainfo() inside
> rtw_init_bcmc_stainfo(), variable res is set to _FAIL. However, when
> returning, _SUCCESS is always returned regardless. Just in case,
> all existing calls do not consider the result of the function.

This more papering over badness.  Lets leave it as-is until someone can
fix the callers.  Static checkers are useful things but if we silence
the warnings without fixing the bugs then we are basically going to
great effort to write a checker and even more effort to disable the
checker.

regards,
dan carpenter

