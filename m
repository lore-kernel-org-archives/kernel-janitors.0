Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E38C433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 04:30:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 628A461421
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 04:30:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhEJEb7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 May 2021 00:31:59 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41538 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhEJEb7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 00:31:59 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14A4REiQ157698;
        Mon, 10 May 2021 04:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=BA3ngm+NoQK4zwBgAX8lFJG6aPHpaBznQmg7rOGxtLQ=;
 b=MlyroAAn2ZdOwPS9ivwhXSrza+Y8GYzUofNKLM/EAzc4zsP5ihmldcHRGa7ZHlyy0iU2
 ggQaVbN8shpiYbLPh7XvqzAJTpz2/HE1AF3Yvzt32aDOAdKQcpNUBVnA3Q0cmfvG4mOZ
 VDb8wvIsl6N41B/ot+ahh1gG/qhm1kSKgr1eGg0hFrpBTsxZWQYXJrPCvLjODdT9+SVo
 XZn2i5M707JQAte7Mh0tus7sdFRk03MscYf7Rh4mbPzjAvq52csIklaVVxQzhDSWG26D
 8cX1eDT1rgpL+mMOHwJp5NX/11nzZsm85hnZd1CC535wAa2sc4vq/nJPMMyKi/MmCT1E Dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 38dk9n9s78-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 04:30:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14A4TiXN096393;
        Mon, 10 May 2021 04:30:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38e5pu95kg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 04:30:52 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14A4UpBt100608;
        Mon, 10 May 2021 04:30:51 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 38e5pu95k1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 04:30:51 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14A4Uol8020540;
        Mon, 10 May 2021 04:30:50 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 09 May 2021 21:30:50 -0700
Date:   Mon, 10 May 2021 07:30:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     christophe.jaillet@wanadoo.fr, kernel-janitors@vger.kernel.org
Subject: Re: [RFC 1/2] rtc: max77686: use symbolic error messages
Message-ID: <20210510043044.GN1955@kadam>
References: <20210509004112.421100-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210509004112.421100-1-eantoranz@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: pUpodbavyAcBBlQAb8smI2YKEyWiXCn2
X-Proofpoint-GUID: pUpodbavyAcBBlQAb8smI2YKEyWiXCn2
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9979 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100031
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 08, 2021 at 06:41:11PM -0600, Edmundo Carmona Antoranz wrote:
> Modify some error messages so that the symbolic error value be
> printed instead of a numeric value.
> ---

No Signed-off-by.  I feel like we should hold off on this for existing
code until the %pe patches get backported to more -stable kernels.
Otherwise if we backport a driver which uses %pe and the kernel doesn't
support it then that's a headache.  I think it gets treated like vanilla
%p.

regards,
dan carpenter

