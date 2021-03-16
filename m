Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B64CC433DB
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 16:41:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A4626510C
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 16:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238768AbhCPQkz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Mar 2021 12:40:55 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:44210 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238154AbhCPQkZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Mar 2021 12:40:25 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12GGdFep139719;
        Tue, 16 Mar 2021 16:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=GPR2cvZm/Wh5AycsMX92FTIHkGZ6p96q9eQXOhWRrlg=;
 b=j/q2kgysvrF8FFbC12L9V4QRtdzVExLPQSJ1LduzGxGo+YRmYs0RDylkI7mHoWACgxO2
 sVXpWDf8huNM0tg3aVHDOR0uVPdGQ1QKHBuAhYUO3otBNXDfr3sFeOqNUgfdCcYiUgOT
 zZf9aJFQHYQ8UK/2ZteHcaeEN/836e1LLmCEs4X2/ci0gfDU0FGnqlW5xvvJ2LQ8jPfI
 buqiC46wpXKgznQra3SN8v7LICvUKvO3qTyQIqWWepf9Ax2eMvqJ23UegV6ShEQKAzeL
 5hheiLmeN0FqziJxtY2XdbQKrla8kKEJk+SPc5WKsQ+OcEcXQP2fxbCS4lJyiW7ir7pq cw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 378nbm8x50-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Mar 2021 16:40:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12GGLaTh125478;
        Tue, 16 Mar 2021 16:40:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 37a4et650r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Mar 2021 16:40:20 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12GGeJH7026599;
        Tue, 16 Mar 2021 16:40:19 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 16 Mar 2021 16:40:18 +0000
Date:   Tue, 16 Mar 2021 19:40:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] staging: vt665x: fix alignment constraints
Message-ID: <20210316164012.GU2087@kadam>
References: <20210312145941.1721627-1-eantoranz@gmail.com>
 <CAOc6etaLJdGJHk7F6Vm3iCVW=OzKiWZ2vCFAc_sZn7VAGM4Dyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOc6etaLJdGJHk7F6Vm3iCVW=OzKiWZ2vCFAc_sZn7VAGM4Dyg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=963
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103160107
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 clxscore=1015 mlxlogscore=915
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103160108
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Mar 16, 2021 at 08:30:26AM -0600, Edmundo Carmona Antoranz wrote:
> On Fri, Mar 12, 2021 at 9:00 AM Edmundo Carmona Antoranz
> <eantoranz@gmail.com> wrote:
> >
> 
> I wonder if this patch will be picked up if I don't include Greg in
> the conversation. Should I send the patch again looping him in?
> 

Yes.  And you need to include the driver-devel mailing list from
get_maintainer.pl.  You can leave lkml out if you want.

regards,
dan carpenter

