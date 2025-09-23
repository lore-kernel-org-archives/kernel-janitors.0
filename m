Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE2C2749C1
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 22:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758667719; cv=none; b=hSIg2c+7a0Dp05/UQ8fS0Ufh5URy+9EvPxjDM94GuW8955xOB8Hn6XdLHXVADglGF1bTHju8ZWbaEu0pIy7xNPnfvQLNLG/cSGqEKvSeQ7IgY5bLlpr+MjEQUFdYXN12zrFXquLhMe7PJ/Be6fkJk8Z5TNZCZYWQbi1zlv38fHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758667719; c=relaxed/simple;
	bh=KGYrdccxkJWz/NWcgi56AxtyIRez9CZ3n9EqSfyRTOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKbChG0aBeUxnTGRYOL006hzyEGtE+dOLOZf8+E8q+XjedX3ctNTcMFYCOYtoQrM3pWiYO9ll/4AngFFRDkneXFYB/4cmK77IJZc6GeNZx7KUy4SLsUlSIWZkPNqEA9vQ5U8IoMRbqfYO1UB4odOZdetJUTdekTCqLGTdDn7dgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYjD5ssd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYjD5ssd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFHIva007557
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 22:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhTBs1uXxvVAGkh+Pb8xn+0DsTafgd8f9wM86mvWR0I=; b=XYjD5ssd2TIZMs4b
	KJOVFYCkUg9kb3Bser3VbMMsZsiZBfeTldoEOW3KslMmAg3wLdGmKJaY3J3wHiFG
	kdwytUulDNRhT9w0XqMg24YNnDTurVfRT1P1iyJqlwcsh1j9H/x/ehQLcklcWqjE
	YgYQY7SaBFWUHA0A53LGf0WhJXuZWiRZTIlhT8QmN/i3W7HMmYIo0VWTmfHz1Uv8
	pL6ttTnsUjcfRh9E9k9A7D0eE434QUlReDVv/l1AfenvIyQL9cMpvibRSy+U2wlU
	BSbd9EHSK/5LNTQrI6AtQQJOpvhRjnQPXjwaCphxq/ZhzQteZYZ32aKCqczu29dV
	d13xlA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98j9bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 22:48:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-25d21fddb85so104275495ad.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 15:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758667715; x=1759272515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhTBs1uXxvVAGkh+Pb8xn+0DsTafgd8f9wM86mvWR0I=;
        b=DObJYqmlurk1BJrK5PEpIICQQm4mw5KTf99ytxl/T02icMDNUze/rN5hNXg7h06+QC
         0EEMIKyKk0nC/E1G/5B6HshTNHVKgq3lO85b1fsXk4VajC8CPh/pivIQX6S38Cl5ume2
         eo1TYTLitV5qmADTu+5k0sSVvbC7ZRLEYAUclcNuCuXGGrBSOY/PlN0l9CO/GBLAhVIX
         m0hwxmGuL935wsUIPIOx9nuMV0OwKCzosQwJD+LdJ2AZc3rIYTV0Zq8FfWT5kFX6vtw0
         ANx+pb9luUceXM3T8kggb9lyJOx5U1RTjLoBlKeISaHHcy8oUwR0ObHA5eBgY/jX6YW8
         89Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWRVvAGNJbLzYPLh9rfK5Eaa/wcPhoMcZ6i6KnGeWebcOjddRD4Q78egy1tWPxMf/Aa14B+QEJUQgOFHWaaJBw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8dbV7uUdMPfWsUCftneWoD6Kpjtsy7DG7SJ/tQgGRcsmsIIw
	BtM+f4TrG+A7bewLzF1ks/znsko3BBjV2DhGpPoV05CC1w3xTB/3pS7HzYsVek4FH/l7l7W1JN/
	s8tEqe4RQDVOiyN5GC2XHB5IfU8GO6E2is9I9xh9OJ/k3QOJW0evcllsbOAy7+quUzOQ7jNgws0
	aVTA==
X-Gm-Gg: ASbGnctugJxGIX9CneCeaw7Yu8K6LRdy+PEedDoKviNfavW6ut0O09XrNT4ptxZuxNE
	FK4P8QR4qEVqzkiDe7ud4WMlBSLmqgKMA4J9DbC9ALgOmImdhrQauJXSWaGCOnvws7muBkpIrUY
	jOSU1acPu7tYjAKql5Nr+gITgoys5yJg33yK+iurfswH3kZ+CxEMIkRaIMDSZmRoErOBoGh5W2+
	3lZBZN12o5MEMyKsvVIJqvWjmiZRu2dxIZYsjIlFyRbIpgbF1a7lgoQpr+RW8B41eJ6zyjqP/Ds
	2FvB/OiNJqueC5e/iLaIoIqxfw0hpfIRUSbHAfgSNzv3Nk5iVJPgtBY/5H9TuO8/YLkaQScpINW
	srnqULqII8TDSsRZtFwzmsWFZqKzBuJy/hIWMhw==
X-Received: by 2002:a17:903:32d1:b0:267:e097:7a9c with SMTP id d9443c01a7336-27cc92d6390mr39514815ad.53.1758667715279;
        Tue, 23 Sep 2025 15:48:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOe5Xvqff3pEzpF3RusBgGn/eeG6J9jfCttvo4aiBAfj9fCkj86Q7V5Xt8WKarN6JKSQIm7A==
X-Received: by 2002:a17:903:32d1:b0:267:e097:7a9c with SMTP id d9443c01a7336-27cc92d6390mr39514695ad.53.1758667714901;
        Tue, 23 Sep 2025 15:48:34 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c265sm171438685ad.49.2025.09.23.15.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 15:48:34 -0700 (PDT)
Message-ID: <adbccfc0-0f9c-4b71-9fb5-5582c8180ac7@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 08:48:29 +1000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] tee: qcom: prevent potential off by one read
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aMvV4kK386Sni10i@stanley.mountain>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <aMvV4kK386Sni10i@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A5xs1UxXQRYsZ-THkOHDVwFjOv6eiA-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX3z1KZx+QDOMx
 L0cNwhAYY4CbBlHao6kKSrrxbNndj6NSHGZYVpMUHYC4/NTVQKCTX3EnoQCDrk28mFvayC+0vSF
 pju1au30ijyho1K5NlxGQbROxIMM48Z9sJgVFHLi7gOrCCVZ2+kEUAblhsHTj/F9rijcfJx6Err
 ios2BrzsBVWbrK+nRL86muaVs5i4DGUafHPjqvvWc+PnpL+fJLGW71R9FAsENzMNyDNY+i7QGkx
 Yd+RpamrpRzaAv7CpPMX+Z4hlw1Z+Heqdj14fvs109CUu6N2ANtzAAm5PWmnCp59CyiQ05qE6No
 L52aW/uZZQijVpqJz9OELXeNOIGSSfc8r2x18lejek2AetLyEZ3gRe6nVtRKhmcDQziNOORSxoA
 Jgn69cdS
X-Proofpoint-ORIG-GUID: A5xs1UxXQRYsZ-THkOHDVwFjOv6eiA-f
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d323c5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=ok0EKaH7qlBqcbMr71AA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_07,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On 9/18/2025 7:50 PM, Dan Carpenter wrote:
> Re-order these checks to check if "i" is a valid array index before using
> it.  This prevents a potential off by one read access.
> 
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/tee/qcomtee/call.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index cc17a48d0ab7..ac134452cc9c 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
>  	}
>  
>  	/* Release any IO and OO objects not processed. */
> -	for (; u[i].type && i < num_params; i++) {
> +	for (; i < num_params && u[i].type; i++) {
>  		if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
>  		    u[i].type == QCOMTEE_ARG_TYPE_IO)
>  			qcomtee_object_put(u[i].o);

This is not required, considering the sequence of clean up, this
would never happen. `i` at least have been accessed once in the
switch above.

Regards,
Amir


