Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB7225A652
	for <kernel-janitors@vger.kernel.org>; Thu,  6 Mar 2025 19:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741288379; cv=none; b=gdG58s6xV3a5C4shEePIo/5WjVVo593aQx+Y0LDjQnv7b9oXIN2SUYuoD22giQYUaCDRfuM40VWxYUuWOrkendlNjULYuLg3yWuHbgdfrsIjnXVlkF4x/P82nfI+BeV8ZKOdXak7dRsuBJqfH3EjyTV9pfK3AFwAT6UPGk1lPkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741288379; c=relaxed/simple;
	bh=ZE9+ebNgM5KO1RE0JNAQaeD0DnX2SDcXyjjzXDwQjRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nMtPRiRceMkKZJUtHcWiixtuzjsNpb37BCNU8h2yEVTP+WWo03vb78Ydky0Py+EN6HaWHuEs5gAh7Yb9G+5L0RNkjYuHNu49q0gsepgW3jnM0FCFlYAefUIjuneM88eh6p1Q9HNe7TyRHnO7304FxBTBtHImEHK7YZQ7grGNvaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNVN+TTK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNVN+TTK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526B3jwj032047
	for <kernel-janitors@vger.kernel.org>; Thu, 6 Mar 2025 19:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fb3of7w9Ie3DB6n9UGY49aYrXPyhRGq0wD8JUa9GVqg=; b=aNVN+TTKmbstWgz4
	NeRQlPry+8vIeEBDsDA93osB6+tzRBilnc3FJHDpczpMUTUNd1vhQGv4qrgc48DN
	RKHqvh1Svun1Z7eKib3rj0f5Dl0THgKgPTSkfj1zLZgqqHluN5MQJvaMIY8Exfxs
	tRl1ssdpr1LcHa9mDZbI6fWBvDtntMgULz+OKm5hGoe7t1ESBVZyeGIz9YPY3a8G
	JLGhk55Knx5/BA26RKfqOaWZge8/N8kfcurF024Q9d3n22uZ+GnrtRJkjnQNcTEq
	sqAvs/D42CngQ5bVwHtsa8LROLatbZPA02IVt9dWwZXri6celDyGwGcSQ8pfif63
	TiCn5w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 457aghhd2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 06 Mar 2025 19:12:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-223725aa321so29224595ad.2
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Mar 2025 11:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741288376; x=1741893176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fb3of7w9Ie3DB6n9UGY49aYrXPyhRGq0wD8JUa9GVqg=;
        b=r4dj5ePXnxawhDMGk4Lo0RjtcyATk/pkLRsu4k6bqEdd7DiPX0ZIbVaoBE98xG964r
         RiwTaOeYHB4OWMqgxtgdkHZbq404GSsXct3YhsrHygKuviu6E0+i6bzS2onnfmRZUEFe
         gbPnkZ/AyWSmLblc0KbU6Nu1N4MyVp9bHKngtIx7WwdvWgarB0l6SPEAhWCpw0dqTUHf
         7UF7pFtxEx2PXGF3GBce6urjuIkinQ5LR4d4KiQjxBhnPs9pv0yKy7x35wvbV6Y0SRfV
         OBphwy3VfBZeI+F2lIGorsydBrg3nZYK6+zI6eJJRT3welAKffsuX00AzewgJnWGWG8D
         398g==
X-Forwarded-Encrypted: i=1; AJvYcCWFOJLJYnfemUAV2FrneaGHHhGaMo3d9cV9/BATm4HdhavgVN4fTzXlQXV40J28aeyW+j39XW/T3QB5GpN8ey4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh1WMrq7Qmpuqppz6IcWPEZh74Zmd7F9iq61KKE3E9F+bK51VF
	DCTveBCgXZohjNrZ0NIu/0LCEIodBiizlCqYIqgN+hkjAcaHgr/5Z1SvdrL+DxBDKDolXZwcxv0
	I63wACkwb53DtuVu/Dc3A1/ELvdN8mWw+QP+qPArJQraAtRG3RgtS6quwaiSJq6IdbUQ=
X-Gm-Gg: ASbGncvsSPny3dJFL5m4b99HHlFrGW7lG8nCLbikAW7V4rd3i47iw754dD34UlipQXt
	W0yPep4OVtRZfmKXHJk72JCUiCbx1e/YUUFVgFMJ+nybGWJf5vnxgAyLaHCDGMfJ0xMiJbp8q1G
	LCuuyidaPc86Exqe8J5vqpbf3Tq9swDCAl/5hr3PaQBViSOQAGs59jufTv2QoS6m8qEKgXwRT7G
	D+G+vexjFKVjdjL7h8ShYB9HquGWJEmZX7HXoVWUoSCJhFgRhYjL1adI1Vdace+ss+VslgTFq1p
	9KSMpGZ/89IgK7s6jPtb/qmy3POL2wQg3UPPyHTdXPF/vlsFRcyXO6In7bB6/qWAIg==
X-Received: by 2002:a17:902:eb81:b0:223:517a:d2a3 with SMTP id d9443c01a7336-2242888ad7emr7775945ad.17.1741288376406;
        Thu, 06 Mar 2025 11:12:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAx44BUCXx+xU4NJjeRySwsv6RYLFJfvyLsxvcs0xJneFlHm5kPRPA6wLw2vuLOUiAu+gRDQ==
X-Received: by 2002:a17:902:eb81:b0:223:517a:d2a3 with SMTP id d9443c01a7336-2242888ad7emr7775535ad.17.1741288375935;
        Thu, 06 Mar 2025 11:12:55 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa8a86sm15958525ad.240.2025.03.06.11.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 11:12:55 -0800 (PST)
Message-ID: <03bfed13-c541-4a09-8330-ca3563be0f77@oss.qualcomm.com>
Date: Thu, 6 Mar 2025 12:12:53 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix integer overflow in qaic_validate_req()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay
 <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <820aed99-4417-4e4b-bf80-fd23c7a09dbb@stanley.mountain>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <820aed99-4417-4e4b-bf80-fd23c7a09dbb@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8QfbsBDquc7Yn74fP5N-mzqwL37t6muN
X-Authority-Analysis: v=2.4 cv=R5D5GcRX c=1 sm=1 tr=0 ts=67c9f3b9 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=UIlczW43xpdIlxS7G2UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8QfbsBDquc7Yn74fP5N-mzqwL37t6muN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_06,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 clxscore=1011
 spamscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060146

On 3/5/2025 8:53 AM, Dan Carpenter wrote:
> These are u64 variables that come from the user via
> qaic_attach_slice_bo_ioctl().  Ensure that the math doesn't have an
> integer wrapping bug.
> 
> Cc: stable@vger.kernel.org
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/accel/qaic/qaic_data.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index c20eb63750f5..cd5a31edba66 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -563,7 +563,8 @@ static int qaic_validate_req(struct qaic_device *qdev, struct qaic_attach_slice_
>   		      invalid_sem(&slice_ent[i].sem2) || invalid_sem(&slice_ent[i].sem3))
>   			return -EINVAL;
>   
> -		if (slice_ent[i].offset + slice_ent[i].size > total_size)
> +		if (slice_ent[i].offset > U64_MAX - slice_ent[i].size ||
> +		    slice_ent[i].offset + slice_ent[i].size > total_size)
>   			return -EINVAL;
>   	}
>   

I agree this is an issue that needs to be addressed.  However, it seems 
that overflow checking helpers exist (include/linux/overflow.h), 
therefore open coding a check feels non-preferable.  I think 
check_add_overflow() would be the way to go.  Do you agree?

-Jeff
