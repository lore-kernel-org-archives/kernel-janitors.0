Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4742FC433DB
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Mar 2021 09:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1069764F6A
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Mar 2021 09:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhCSJp5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Mar 2021 05:45:57 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:51344 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhCSJpy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Mar 2021 05:45:54 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12J9d9SI042457;
        Fri, 19 Mar 2021 09:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=J0t0Z//03ZvnRhV90rSkrK/ut0Y/gDphokE/M360w/g=;
 b=gDoufVJ6ucxn09JVK+BWULym6cwIWG0zn/KeYlfUG3Fb7M7QTzo6fYRG4mvfFbEOqwrL
 917DCx9QEddiLrx9gYEabcnm2baEoVAF7GyJEKzEXC7yzhfAZt4OcsITFUGFKnskUvCv
 9kyrX6830ChHGLmqYD2P97zXpCF3zA8ujPLT840dC8nAAZywE+gJMirckruSaj7/2Ud+
 bRD4Me5BswZFlZ24uupYwGhsMsXmgJ6Q77ALiR2tkHlGHP9UXvWDCDrERKvS0SdNzzTF
 Rd7sdPl7G2I/wFoTwLPRpf+HTj7hNRdr8HQDw6PnuqSktNF8zWEYbnzkr+3SYbyMGP16 Ow== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 378nbmjfnc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Mar 2021 09:45:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12J9derJ131914;
        Fri, 19 Mar 2021 09:45:51 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 37cf2bjepw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Mar 2021 09:45:50 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12J9joCj023510;
        Fri, 19 Mar 2021 09:45:50 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 19 Mar 2021 02:45:49 -0700
Date:   Fri, 19 Mar 2021 12:45:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH][next] loop: Fix missing max_active argument in
 alloc_workqueue call
Message-ID: <20210319094543.GG2087@kadam>
References: <20210318151626.17442-1-colin.king@canonical.com>
 <13a1d187-4d6d-9e06-b94a-553d872de756@kernel.dk>
 <62cd71bc-86e1-412d-b2b9-716c0f8021be@canonical.com>
 <d32641ca-e34a-2bfd-9b86-28c95546f434@kernel.dk>
 <CAOc6eta9oSxwPKma9ERP+BoXpW=PGaS8pxWiKQ3nj6BoYAu_Aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOc6eta9oSxwPKma9ERP+BoXpW=PGaS8pxWiKQ3nj6BoYAu_Aw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190068
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190068
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Mar 18, 2021 at 02:53:10PM -0600, Edmundo Carmona Antoranz wrote:
> On Thu, Mar 18, 2021 at 2:43 PM Jens Axboe <axboe@kernel.dk> wrote:
> >
> 
> > If it's being redone, would be silly to have that error in there. Do
> > we have a tag that's appropriate for this? I often wonder when I'm
> > folding in a fix. Ala Fixes-by: or something like that.
> >
> 
> Don't want to disturb the conversation that is going on there so I am
> only sending this question to janitors. What is the meaning of
> "folding" in this context?

Folding means you squash two patches together.  The patch Colin was
fixing wasn't going to be merged for other reasons so we may as well
fix this as well when Dan resends.

regards,
dan carpenter
