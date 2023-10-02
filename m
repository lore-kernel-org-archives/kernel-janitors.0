Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C3FE784BB
	for <kernel-janitors@archiver.kernel.org>; Mon,  2 Oct 2023 14:57:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237903AbjJBO5n (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 2 Oct 2023 10:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237651AbjJBO5m (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Oct 2023 10:57:42 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2D0B3
        for <kernel-janitors@vger.kernel.org>; Mon,  2 Oct 2023 07:57:37 -0700 (PDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 392EkJqq002052;
        Mon, 2 Oct 2023 14:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kcPOFWWqOO0WszrP8FNwY6Q3nAzZ1hr2GFFQLObNMNk=;
 b=gChTU3hg7tB85vDI6rgJtuu6R60tYM7FO7mSethdwHDqjt282nLhjXeCIwzF5ZsAQ7mu
 2YgVuIbQs64uepsLs+Dacnjya2gHlwDCs3HWGVwHB5UhOirVEcEX6JdKTXBWeub8DyNa
 Dwld2gANFcS4J0X3SxUxzB/250p/A9ntCrKE0Bh7Ohcxvl/N9uEKkZzo8TC9UqgJsPZW
 +9pphrDnGocDhnkW9h93TYmEwNLYglOWUvNUCDrUkUkwWwpZwT1p1I6gX0KIYrOQBVNI
 jJ2f+7yaIYzmwCt8KMnOFQ/ZotIZVM5pVBXa7eXfpaEkWi6tYWqDdvgKSF8yZBj8kgkU XA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tfywx894g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Oct 2023 14:57:23 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
        by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 392ElYYd010892;
        Mon, 2 Oct 2023 14:57:22 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
        by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tf0q19s75-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Oct 2023 14:57:22 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
        by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 392EvM04066260
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 2 Oct 2023 14:57:22 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8B21E5805C;
        Mon,  2 Oct 2023 14:57:22 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 636A95805E;
        Mon,  2 Oct 2023 14:57:22 +0000 (GMT)
Received: from [9.61.141.201] (unknown [9.61.141.201])
        by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
        Mon,  2 Oct 2023 14:57:22 +0000 (GMT)
Message-ID: <4666c1f5-06e3-2b03-993c-5d53637856a2@linux.ibm.com>
Date:   Mon, 2 Oct 2023 09:57:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] fsi: i2cr-scom: Fix error code in read/write
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>,
        Alistar Popple <alistair@popple.id.au>,
        linux-fsi@lists.ozlabs.org, kernel-janitors@vger.kernel.org
References: <ee554aa1-0257-4662-8da5-1ea6be2740e9@moroto.mountain>
From:   Eddie James <eajames@linux.ibm.com>
In-Reply-To: <ee554aa1-0257-4662-8da5-1ea6be2740e9@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: X_vf9-7XHt4chyeILbSEDDm2kz003zBs
X-Proofpoint-GUID: X_vf9-7XHt4chyeILbSEDDm2kz003zBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_09,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 mlxlogscore=913 malwarescore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310020110
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 9/7/23 04:55, Dan Carpenter wrote:
> The copy_to/from_user() functions return the number of bytes that they
> were not able to copy but we want to return negative -EFAULT to the
> user.


Thanks.

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Fixes: c0b34bed0bbf ("fsi: Add I2C Responder SCOM driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/fsi/i2cr-scom.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/fsi/i2cr-scom.c b/drivers/fsi/i2cr-scom.c
> index cb7e02213032..df1e1df40332 100644
> --- a/drivers/fsi/i2cr-scom.c
> +++ b/drivers/fsi/i2cr-scom.c
> @@ -45,9 +45,8 @@ static ssize_t i2cr_scom_read(struct file *filep, char __user *buf, size_t len,
>   	if (ret)
>   		return ret;
>   
> -	ret = copy_to_user(buf, &data, len);
> -	if (ret)
> -		return ret;
> +	if (copy_to_user(buf, &data, len))
> +		return -EFAULT;
>   
>   	return len;
>   }
> @@ -62,9 +61,8 @@ static ssize_t i2cr_scom_write(struct file *filep, const char __user *buf, size_
>   	if (len != sizeof(data))
>   		return -EINVAL;
>   
> -	ret = copy_from_user(&data, buf, len);
> -	if (ret)
> -		return ret;
> +	if (copy_from_user(&data, buf, len))
> +		return -EFAULT;
>   
>   	ret = fsi_master_i2cr_write(scom->i2cr, (u32)*offset, data);
>   	if (ret)
