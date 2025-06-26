Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D93218599
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 06:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750918994; cv=none; b=sG6aXTHbkLOc1lUmx+IOSobFjgilmjHQJG76mOwRg1z9d+9lGGmAuJUU64WnoN5sdzMj3MFK8FfSr3qf2OmmT3JmRxA3XX4tbAEVj886IXPWAT+01ExN4YfIuTBxN9UPWBd/vC3LPCnUwr+8gmtlsZssDcbQckq5WRomjau+MZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750918994; c=relaxed/simple;
	bh=GBMZ20+Dx521eudEWEJS5G6reVV23iA7Cl0uMWTkqCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXaamO3k3eTCWzUtl0YyL4tscAgzRcvMdKEZB8Losij45qKmCkWw/EjbFDs+LiPcQuDtPbADb/fyH7fxYBIvl+BiqCULWKmFeQ+GXDhzUVZKfXmbhUKk+vRKoUav4rX4T7WBoy2BJpqSWG9+rhTGcRcjf3nUn67VvysvTm2p/Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7QYsI0j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7QYsI0j"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0DqBn002543
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 06:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSPp3x1ZRhdbBSvE6qtd0GrLv5iuaB817ClElVTDfa0=; b=i7QYsI0jqXY5ICIh
	MjhKUgo+deZ7nGds3kDxAzLhazFjZ2jmOCWw0kJmB+qcEd0ftB+dn/6D73/So3Y0
	kpj56Hq+YX2FOjwRKeyq00azJ24uFswmBXCCx/pLteNZ4n7cBRFtchh4ebyB4GSt
	baP0MCr+5bFukgTyVrhbQ4NrdsfiMvKdM2yUxwIv34562+Jm/SyOoAfJtfrJcUlQ
	xE1V1dpJtJs9FaEdZ3/DKlt5i7a7KuucKWULAvdLQhrm+e2fHdkV3UP1PgGOOSY7
	JG7bQdNzU8I0RrlbitPFVBl9mNMVMgiTcvWokMdugHa3VYtFxZGbKz2LYe8KN+j5
	sgeGTQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmuuvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 06:23:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23824a9bc29so11914535ad.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 23:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750918991; x=1751523791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zSPp3x1ZRhdbBSvE6qtd0GrLv5iuaB817ClElVTDfa0=;
        b=X0gg/CoLLgjwLrSX+Wph8toQE/wwsMgwc4LvtQYtneICCKKJHGexL9N6bikdRJq9Ic
         1H1D696PiFaSwA4aARoi4YZO7i+wzlBNfx19U807STqVVmkTi5RqH/ECTMPgR3FkAV2N
         gse+6CEfOjDfKSXJn2AfKzeSunGvyLWkZ6A3LZryc8i5Cm7HjsQoDwBStYvK4Qkzt+wA
         fwfiODA+yAEB0HnIF4a+qZXkjq0c4XD1oy/6KnwivMs5yckg8acHAAU03L1swIOS6lFm
         nYXwzkDSgoNMsfEP/Srz/X09/+/uSExdjAwt8WW4PROwuGbJdTyvQvdqKuMsBeYIhMIx
         Kw1w==
X-Forwarded-Encrypted: i=1; AJvYcCX+IxqIFJ3faHpZrB1WERHL6jF6Ykowd7xntqqmqAgkAw29B8fBDwj7HO+22Jn95AS5MXhDAG77KM69AJeTOw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwf3ezMotRjCrmrUCiKi1+rB2zqnVHiiYVAjrDLBF7IH9Xy4Qs
	a2xZiS+ffxMNq5ShWrkSVyAk48l5uv5pAwYXnFPIHnCSz6mNNJv6U8bfAupnjdMEqdv0wJEhpJt
	WLYnN2WFTZhzMd6NZE4gKdPNYZfY2F4huR0pe15JtP1EF+we0iq9PA15Yp+5Y+Z9pd/OBWJA=
X-Gm-Gg: ASbGnctGuYo6v3NFZ+xBtRhddrqyOouqjR0vnKcEpzzMGD+2XrdXlfeBOVb6lxkROwT
	G6+nZsIetX/1Ejg6tJSnhaucl9Ry1Qr19Ct3be55Zyh4jgBPvWaLomRy0OfV4DqmYVq5ddfB224
	Nut698I9/0JzhY8ea4TX13y9qsUaN1f4jH7PQIqNMj3KvPNA5fFgOq2HXbT3Qw67vEIKN0wYapv
	rFuhsGCNEatb7L1Np56L6DuAO7gd90zLXpSzjWZ2HlvjlqP+96FzytNAkWsGCdL0KSYOyMzAo1E
	PjDTksQOiyB7NHfEUu+TZcO2JFwrI7i7TBqVD0Skh4dDg6ko7bA=
X-Received: by 2002:a17:902:e546:b0:234:c549:da10 with SMTP id d9443c01a7336-2382408fa5amr88572935ad.47.1750918990968;
        Wed, 25 Jun 2025 23:23:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER407T8JX75ySM0Lw9z0XE+rIFx1Ls7SaSTA+7leEyGkIE6L8/SALvv6z5XbFaMGqM97xPBg==
X-Received: by 2002:a17:902:e546:b0:234:c549:da10 with SMTP id d9443c01a7336-2382408fa5amr88572625ad.47.1750918990576;
        Wed, 25 Jun 2025 23:23:10 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86c5a7dsm150270925ad.201.2025.06.25.23.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 23:23:09 -0700 (PDT)
Message-ID: <fde57cbf-4367-4741-8d67-b569ecb9dc61@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 11:53:05 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: u_serial: remove some dead code
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lianqin Hu <hulianqin@vivo.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Michael Walle <mwalle@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <685c1413.050a0220.1a8223.d0b9@mx.google.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <685c1413.050a0220.1a8223.d0b9@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8ioot8kc65t832hHiYgTcgcz29OPYGq0
X-Proofpoint-ORIG-GUID: 8ioot8kc65t832hHiYgTcgcz29OPYGq0
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685ce74f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=xcl-ZwCfIxIsq7HH9cIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA1MCBTYWx0ZWRfX185L3KcjM9LN
 iGJRtyP4HYUfkIj7RDmESkL+Wkoc7tOhxaM8vv1W5t54iJgDgOEXODZjIGRVtvpjs9bjXAdy2za
 MkwVH72QDvFAAIwTbIZc74gieFLKa3dz1Wpk+IMYDiPQ7beq+VGavBatGxFzAD7/k6jFSwiDF3A
 XjhL8e//WIwNOtgpvscAtUcUashCwa9z2+qcRz7tnZPxq987rzSIJe+2uyIyp8Z5azwWne6unat
 V7H5YHmXjNx9j1nPb/X4xrbJ9c4O4XmaIKgs0/ybdmCq6fpO3BDRcKT1hfE30c8bLI3FF419ZiV
 ABqQJqOIQJgUVjzq+v2uVd7MHvN4pOMJW/o5gwGNv4XTaTnv0z7QFutKJrYRIKtfsbv02OEw3JD
 EyD55Y9ccFPBcyb8a/0Frj6jpWB8brgumUvvwdzmG2ZB+WjzDrspQfAEzaoeX5CuiTMdbJtA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=949 adultscore=0 impostorscore=0 clxscore=1011
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260050



On 6/25/2025 8:51 PM, Dan Carpenter wrote:
> There is no need to check if "port" is NULL.  We already verified that it
> is non-NULL.  It's a stack variable and can't be modified by a different
> thread.  Delete this dead code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Perhaps you could add Closes and Fixes tag, but its up to you.

Reviewed-by: Prashanth K <prashanth.k@oss.qualcomm.com>

>  drivers/usb/gadget/function/u_serial.c | 7 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index ab544f6824be..96756a489d6a 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -1501,13 +1501,7 @@ void gserial_suspend(struct gserial *gser)
>  		spin_unlock_irqrestore(&serial_port_lock, flags);
>  		if (!gserial_wakeup_host(gser))
>  			return;
> -
> -		/* Check if port is valid after acquiring lock back */
>  		spin_lock_irqsave(&serial_port_lock, flags);
> -		if (!port) {
> -			spin_unlock_irqrestore(&serial_port_lock, flags);
> -			return;
> -		}
>  	}
>  
>  	spin_lock(&port->port_lock);
