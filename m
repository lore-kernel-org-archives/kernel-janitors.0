Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9D0C433C1
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 08:14:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B209C619F8
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 08:14:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhC0INi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 27 Mar 2021 04:13:38 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:42032 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhC0INZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 27 Mar 2021 04:13:25 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12R8CvVL056165;
        Sat, 27 Mar 2021 08:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=PMi5alYXpWwIA6ZBygqoU2tY5Hk1LgBaijnTitPCoDE=;
 b=JfniukjUpxQUR6VFWEEmSDPGPs5a76ypqS3v6dJe/MSpV48Ac/U5NgC9Vm1JOQnw9Xt0
 ++I3+LcBBf9Z+yHJwKJusfABWW1EIItVRiq9tgBoS0fbeQUjw01rNAV3UZS+C3oRCVnC
 niuQePD3HeCWI1LleDcDhyskXZmHisKZee205OnidXJWss/X4IG+GfqDggu0WYCFb50V
 dZOw7TaAqFPTyVfh1ZWSlYyrfi2gWHOvnyNX95lA8a654DQCHS/Ld3AhTqRfFIo9Z8RR
 OIWRXoBnURUJc48N/C+lha2zclYWBpYio93dULi5O52yfhx3IU6FDv3cGHLWVGezMSCv yA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 37ht7b889h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Mar 2021 08:13:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12R8BM53132597;
        Sat, 27 Mar 2021 08:13:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 37hsts9s8v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Mar 2021 08:13:12 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12R8DBgv009317;
        Sat, 27 Mar 2021 08:13:11 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 27 Mar 2021 01:13:10 -0700
Date:   Sat, 27 Mar 2021 11:13:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     gregkh@linuxfoundation.org, marcocesati@gmail.com,
        ross.schm.dev@gmail.com, fabioaiuto83@gmail.com,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next 1/6] staging: rtl8723bs: ieee80211: remove unused
 variable
Message-ID: <20210327081303.GI1667@kadam>
References: <20210327001736.180881-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210327001736.180881-1-eantoranz@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103270065
X-Proofpoint-GUID: SS6HLezw6mJpYOt3LRXs71y1zESbc9sX
X-Proofpoint-ORIG-GUID: SS6HLezw6mJpYOt3LRXs71y1zESbc9sX
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103270065
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 26, 2021 at 06:17:31PM -0600, Edmundo Carmona Antoranz wrote:
> sec_idx in rtw_get_sec_ie() is set to 0 and never changes value. Also,
> it is only used for debugging messages. Therefore the variable is
> removed and the debug messages are adjusted. Adjusting debug messages
> forced style changes. Taking the opportunity to adjust indentation
> of those sections of the code.

The re-indents are not related to the other change so you're going to
have to split this up into two different patches.

Generally you're making a whitespace change on the same line as the code
you are changing then that's fine.  But sometimes re-indenting it makes
the change harder to spot (review).  I would say that this code is
easier to review without any indenting changes:

ONE:

-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n rtw_get_wpa_ie: sec_idx =%d in_ie[cnt+1]+2 =%d\n", sec_idx, in_ie[cnt+1]+2));
+				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n rtw_get_wpa_ie: in_ie[cnt+1]+2 =%d\n", in_ie[cnt+1]+2));


TWO:

-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n rtw_get_wpa_ie: sec_idx =%d in_ie[cnt+1]+2 =%d\n", sec_idx, in_ie[cnt+1]+2));
+			RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
+				 ("\n rtw_get_wpa_ie: in_ie[cnt+1]+2 =%d\n", in_ie[cnt + 1] + 2));

>  				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt+1]+2);
>  
>  				for (i = 0; i < (in_ie[cnt+1]+2); i = i+8) {
> -						RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n %2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x\n",
> -									wpa_ie[i], wpa_ie[i+1], wpa_ie[i+2], wpa_ie[i+3], wpa_ie[i+4],
> -									wpa_ie[i+5], wpa_ie[i+6], wpa_ie[i+7]));
> -					}
> +					RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
> +						 ("\n %2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x\n",
> +						  wpa_ie[i], wpa_ie[i + 1], wpa_ie[i + 2],
> +						  wpa_ie[i + 3], wpa_ie[i + 4],
> +						  wpa_ie[i + 5], wpa_ie[i + 6],
> +						  wpa_ie[i + 7]));

In this case, the curly braces were fine in the original.  Multi-line
indented normally get curly braces for readability.

>  				}
> +			}
>  

regards,
dan carpenter

