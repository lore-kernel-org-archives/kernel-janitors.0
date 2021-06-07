Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986D0C47082
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:16:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73AE260200
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbhFGSSZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Jun 2021 14:18:25 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39052 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230215AbhFGSSY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Jun 2021 14:18:24 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157IC11X022654;
        Mon, 7 Jun 2021 18:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Rd1dbv1zfz+YJLwUVG4Vxt8zBk/waskWlpzcAgdFZmQ=;
 b=MA0fqpHPvUuyO4hV+kjPs4AAG6OX9k1XvkutonkqzhUwwjPjYBQiMF69tW+inRd0dg7S
 kLTd+LPU1pPBVuRCFIZA8NmV3WhjpZj2MRBW2cDTuk1yFOiwVO42CWV3molDQt9eIjsN
 ykXen2NZx6e51CmAZdWzTkrsv0FFRmRHQ8m4/N+Ox6sxoZ0w6xb3HZzrp6lAJz4Y1YUq
 /Yt6F4GK9MRapKVl3F6XLyhpakUUFANeG2RboDXfki8Vin2lNQktSDQ4xyN8iRD6SVQY
 yXx97CrQeYVaLojY4osOCX/EO58hzIXx6A7u7b8x0weERERrUxoSgGJXOWBIHXAGADaa /w== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 391g4g865x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:16:11 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157IEWdg078972;
        Mon, 7 Jun 2021 18:16:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38yxcu2tmq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:16:10 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 157IGANX082111;
        Mon, 7 Jun 2021 18:16:10 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 38yxcu2tmk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:16:09 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 157IG7aR004773;
        Mon, 7 Jun 2021 18:16:08 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Jun 2021 18:16:07 +0000
Date:   Mon, 7 Jun 2021 21:15:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Martin Kaiser <martin@kaiser.cx>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Kaiser <martin@kaiser.cx>,
        Ivan Safonov <insafonov@gmail.com>,
        Paul McQuade <paulmcquad@gmail.com>,
        Michael Straube <straube.linux@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 0/7] staging: rtl8188eu: use safe version of list iterators
Message-ID: <YL5iX3Exc0HVYrsi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: jC-UHOaBhjHPuI3oO84dUSNpEuex8vmU
X-Proofpoint-ORIG-GUID: jC-UHOaBhjHPuI3oO84dUSNpEuex8vmU
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We converted a bunch of open coded list iterator loops into list_for_each()
but it turns out some of them should have been list_for_each_safe().  Or
even better list_for_each_entry_safe().

Btw, someone should get rid of the get_list_head() function.

regards,
dan carpenter

