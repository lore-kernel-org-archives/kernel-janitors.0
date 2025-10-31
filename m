Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3402D47E6
	for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761924619; cv=none; b=GSB5rsVWWUtNtNaiu/mlU4EjS0EfMcn2jsJa0LTeJ+BXvPUX7mLzg2VbUy7Cooejpc+4V7l4/CpVJ3j8gO5g3cPFjhQ5BJs+Fw1R03qhlDunn3PXxvtWttdTkmilM2ay6TUvFJ0kf0TmkrsMcocisa0wdl0G6coUcanMmRQT3kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761924619; c=relaxed/simple;
	bh=/eiVLLLAUQkmCi47mmct2VhL24BCqlSBWKy9afC3gT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eNc1hgucKaGGv53WzlFBeTOWG/PVzGXXdmt18FykEEGuWbLhImq1d85BicLydQUyuqHjpx0ePRAAVh7iZYjXv8ol2Eksu2bdeYXK8dzuvTdzrFnmki0sj/HlJ5NQxPUo58TSE5wqncyPo2VB/DG25DD6mZF5Pra4RnQck6KlsiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k83hUwoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GrD41hJ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k83hUwoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GrD41hJ8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8SjnE873191
	for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 15:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aubjBpZ4Wxz6WDYi3ML1S8Br7mpPFHUcMeGT2IdqfJM=; b=k83hUwoE2hZlFlIS
	oITN13ABbcaks5UErqK2TdL64wOAw1HGbfYOj/mxk2jhaplLkPD2f69cpA9lyyel
	BnVXZ+fbCtyn4IFA+wgHiQQZa1tH2bdci/akd+TnDbyRyk9D0HJ9c+SzO3i749lc
	eXgO8Huj3AgL4EodPMD6YTGbUMLo+L0DaXzgDEHsMyh/LYPEtLZ8LZPG61cIjKl0
	mr7F7tMjPXtCNC2rjoxsZhlGEEbfK+OoD0ljgZ8THSLhfBksXW4OjtqcgtUO9TEi
	IAJHMkK8PtE/PCDUkNVtaOz1TYjdfONAX2g95aNsZ4OMto2VGTy4eVUlSGwa/Yuh
	k2qzZg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn2kvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 15:30:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78108268ea3so3057718b3a.1
        for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761924616; x=1762529416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aubjBpZ4Wxz6WDYi3ML1S8Br7mpPFHUcMeGT2IdqfJM=;
        b=GrD41hJ8jzZMBgyWhYuwHmU+zRJjw6Bv6OJ+Ic6PoRabb9lurrLI/KCEzidw+CXCg6
         bh/CjS5r9OVtoy6mAwvS0+4CIShLVHROG/c+aWIWhndPL7uQwNsmKrqUXmaS44t9Jbe/
         M4Uq+TjCRR9n/5Kzb6k+tMOrsAtoXHsVDT0zg0ylj2CbDfve0mBVAIDPfo4AwaCfp7RV
         jjlVhn85ZMkFHoM7Yrj4Ygx6E5oAdguWhHE6PiB6jIpGbDz1kWXtG2pHo4qrEzbGgnkp
         rY6Kc1xZ2O7ZnKaoZ/THro6x9f1+dT3baaLzg5ZBZcxkb/nZqLMNh50e/SdcOZrqLHSj
         0xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761924616; x=1762529416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aubjBpZ4Wxz6WDYi3ML1S8Br7mpPFHUcMeGT2IdqfJM=;
        b=T8mS6PZlfec0Uh6nY8FMvhZkw+ewN5l5ScHRH//gYcTs43JXuegvwZJw8HvjPbPm1M
         ht8VTVP3L8ExnWyrdP6BD1fCY3zKlgyWxMxEjtIyBBg5/ZqO+fkzgXVAa1tbNtP0Fcad
         lwuY+kUClbgME5WlCoP8KBReriVz99furrU5Vio6boANCw5zweuB8Ima4hwVyzl7lg/T
         rzmwro9rJnma+nWKAyzBsqlge1qtDFTvMFb69v3Eh7e49QFxI6x7pn+NXO0RhtuRDJVB
         Ctijkj0J7KOZtb9c2rYQhAZSsGMb+2sBI8YeJovEdPi9P+JuV/JUB6xfKV3+hvmPT8dK
         nuTw==
X-Forwarded-Encrypted: i=1; AJvYcCWAWcQ4VRJteTfygzq/uyWsRlE12P0CZk6CkD0XqgW18mAScQ7GRCTjxv8i8CVKNBi7/D8Y2AUEsk2XORSGO9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5MJ04rAEsIsDBxtyHX9W/4IKBooyYdt8FmdXVPabsT14mcqUP
	hR2bHwLUTjmSldgTPZHlXKqnyiBq5jAt8kcYdMe/CKByecpmJGKITVKBc79bmAG1pT5CbNCeGLC
	tEfpXRXEd9lGoTp3+v3S1CqKJIyQg4l/KmezRaBqdIlmmPIf+9JskauIu+lz+V9wyFD99po8=
X-Gm-Gg: ASbGncuDtCxYobnJoSTIcP/hAIeQ8GjvHC+X6LO2mgfR15Ue0pmt7f5FjlNYUnkoGp7
	mNoUiAqFzWZuQ/6d93+Ba60O39D6Fxqnfr7YvDYC9/WQg2RbT/KO0+AU8DYdq0AqJxwiYSKu0Q2
	zJL5tmuvijiRG2unGfxj9da/zQ94Ihw/U306/JgJKv63SZUsy7zTEkpkHFpEz1hHPObRX/f7nVU
	/fVec76laAUtMkFt44BdXPKThT9ke6Zm3R2zPxXQpIS5q6yKKuqJAwlLxt8gAB48dXgOdKskwG4
	//W8641wCBvzm0y3QJvo4WhO/ET6K8cib850ocayPEHmGmgvXh78dyLBWXv3U+nPb/RbobvTf7t
	l3qA6lmhQoatU8cXMnRekYlER+lRg1S5kuf/vqPrmfP/L3KWU7Ncv
X-Received: by 2002:a05:6a21:3998:b0:345:3eae:c6a3 with SMTP id adf61e73a8af0-3477c3d4aa1mr11213332637.18.1761924616195;
        Fri, 31 Oct 2025 08:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI0yjTWVj8oWnooNwsC1xD39utAJSo9GaWuze9TCeSTyfY65uj7xmGoPU885hFwiAxRoWjtw==
X-Received: by 2002:a05:6a21:3998:b0:345:3eae:c6a3 with SMTP id adf61e73a8af0-3477c3d4aa1mr11213279637.18.1761924615551;
        Fri, 31 Oct 2025 08:30:15 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b9483c03f43sm1961613a12.24.2025.10.31.08.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 08:30:14 -0700 (PDT)
Message-ID: <ce252b99-c011-428f-a89a-5792f14c2eaa@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 09:30:13 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use pointer from memcpy() call for assignment
 in copy_partial_exec_reqs()
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        Miaoqian Lin <linmq006@gmail.com>
References: <d154d3c4-dd3e-488d-862f-5361867a70f1@web.de>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <d154d3c4-dd3e-488d-862f-5361867a70f1@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=6904d609 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FP58Ms26AAAA:8 a=i7YI89PhWf-mWEaAo1gA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: vDj8iRTKD4CjXgJHY39y5w3PzkpUu7XF
X-Proofpoint-GUID: vDj8iRTKD4CjXgJHY39y5w3PzkpUu7XF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzOCBTYWx0ZWRfXwU/St36fldTq
 5BW2vYMl4TEQ3I9x90JNMHxJ5/2o19enC/ZUNuoaxHyKi5egTHwmaRP2qzwCmRsNSF07deMwXFz
 MnXRjlhn9zIlj3KJ3FQDp/wwdu6xLaM8sx3qgVPmXZzPHEyjp/Bx4GpoQNwS6kxl1rlyCkFraAb
 edLbCOmvOBaUvU69jVQKEAz8PBIoRdhVDWaqc7wpg+YG+6uK247dles29tvMMzzRqbKVIeHADr6
 H5zLQ5Yqv8MZ67WlXurhxo30rShbMqn242gwLuyWCgfeo2L6P8hrMzPN4nP913Bx8zMJq+SAIPQ
 9tHeJzQiefobYAqmZA+AjNL6EY116T+GvNFRJ8aeDrgQpcLd6j6W8cISeKgf+BXJ+F9YpqMZ/LC
 KitX/bY2iAGgAv8iRc7yTAXC87bM2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1011
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310138

On 10/31/2025 4:34 AM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 31 Oct 2025 11:26:33 +0100
> 
> A pointer was assigned to a variable. The same pointer was used for
> the destination parameter of a memcpy() call.
> This function is documented in the way that the same value is returned.
> Thus convert two separate statements into a direct variable assignment for
> the return value from a memory copy action.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

This does not match the address this patch was received from, therefore 
DCO does not appear to be satisfied.  I cannot accept this.

> ---
>   drivers/accel/qaic/qaic_data.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index fa723a2bdfa9..c1b315d1689c 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -1171,8 +1171,8 @@ static inline int copy_partial_exec_reqs(struct qaic_device *qdev, struct bo_sli
>   	 * Copy over the last entry. Here we need to adjust len to the left over
>   	 * size, and set src and dst to the entry it is copied to.
>   	 */
> -	last_req = fifo_at(dbc->req_q_base, (tail + first_n) % dbc->nelem);
> -	memcpy(last_req, reqs + slice->nents - 1, sizeof(*reqs));
> +	last_req = memcpy(fifo_at(dbc->req_q_base, (tail + first_n) % dbc->nelem),
> +			  reqs + slice->nents - 1, sizeof(*reqs));

The new version reads worse to me, so I do not consider this to be an 
improvement.  This is not a critical path, so I doubt any performance 
increase that may exist outweighs the impact to readability.

-Jeff

