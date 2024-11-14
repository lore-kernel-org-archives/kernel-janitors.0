Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BE722331
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731592650; cv=none; b=A5Aj2t549Mobzx+E+ZyCQ+aF75sILRv4viJWM+S7CMKSs/fILKQJ/nMeXp/TQo5JFep8f0p1XHPlTtUo3ofbhuPVXuZ3WMy3pqowZvRDaB0MJOoDcW0OUaV+0WT1Jdpee/uj/Omz4681K/RacNKsjMUTBJGZHqLMJL4G2ItjE10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731592650; c=relaxed/simple;
	bh=a+AUQrdW+PYA61YxrcqIvJErr6SmNmqDLMixPc3UFdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkES6ISJ6llUxNDlhYAkkHjuWdonzxMLs1Olu9gm8P9g4I6XPt7SXBj91YHar+NAjlCAlucOkMWqtul9Se+wzjjNmISCC9G3H/4RJJadpEF1nilWwOMc3NBctXT31jUdz17mSILN0CPO7T/pTrpCRKUu3QrWkaxJ9lZeA2673wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GghzDWtq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GghzDWtq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE9or2R021648
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 13:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5goF3KV2cIAs2QaOfnwRv9qRBAvGbfSx7o/YGvGW+Y=; b=GghzDWtqvmaAP1j4
	vOufLtvEUGYsuKGXjo0khJzFlWa8OWZEbRzCGfwLcxiNEwmPdz9i6O18u0PmdsCB
	Qg4gsypOsQnXSHk3eNJbpbJfSIsRTKAaMN4GX1KSlxBAvhAAzQGk3oPUdVDi0eKP
	8fnqxwXBLLeMSEVgPYggKUP80cCTkHByZe8M4s30d4HeoJm+iCeSeJm9SsMJK7MH
	v8MvMcjVGohDJ6h9Z5wUOpOv85d7Z76mqB5mylAtsLrJqZ9hQ8ctmVo6ennA6UrG
	iYs04Fe9eOtp25pGgtIRYiQcYxDO6vICtr56lh67TktFw09+0gqDu0HbFIddKAQ4
	tzQV+w==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wex8rn0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 13:57:26 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3e60838eed4so23440b6e.0
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 05:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731592645; x=1732197445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5goF3KV2cIAs2QaOfnwRv9qRBAvGbfSx7o/YGvGW+Y=;
        b=sAljw4sCUpei13aZ4pbIL31FioiO3gpSdH4nppmg2fve93Hp58Ec1YHiFU/Aubopzb
         gfN0TzOcf53TkrxvKeS4vSfPpNRknHy6/LNtGya4NbTlMflDCsD2OvMN8bukAyHfYGPr
         v3wyaBEOddst7ZaatwTbsRFrjCH16FeZbXHxxRoFW+2JL9HtowwL5IRfq/FjyUVLMRLH
         /ZdcLQdseXyysEmlgNX6oLsu0aouDqCGTDyYQhlyKRdVL5HiPyUxsv1i9lVvvWSyepZz
         AUhiK1kr1EWxBow9afOPoFRnRtMtAmtL5uCKgwXhwhEWV3ED/QLVIjN3XSIycBPNS+ba
         M70g==
X-Gm-Message-State: AOJu0YyKhApLOA3AtVZvGLYoU+m0bxo0UEmtUdO2M9KNmJqLv8z6K4cj
	qrVCgMHUYqL4FIu9c9YzHpmOLWC7N7Lr0c/1nFU3ykfOMUREMudQf2QWQhGh0JJ1VhEGhbSpF6U
	lyTB7KBGl7/2W2JXoUTnGA1k5vz/gE4a/3ibCtjy5+qHncxX9QZfbjWGSoQiYautWXdk=
X-Gm-Gg: ASbGnctzlkkq7pn470AG3okxeVRWvmOAmFllZDxXNSM2gNTvhozSuml9JcKO0JuV3aO
	oypYZvWuzD7WmSo0De6iOtcafCRDNl9ztLESXm5l3/pPgI4VzuP4QODt43huVdTJX/ekaxn3a+3
	TRZN+GTlCra49Nju0GHnwybTNu3ceRU/xkoYeGAJoJjNq4uI5leJZPSwVh0BagqqKmvzTurC9WT
	bylmgT2/WsfIJ6EQ9UOEoJSqQjHXOh1WbdVT0miYMnFDkeeH0QIx5JV6Q4jvZrPNTgbxsFCSMPB
	X+mTJSqDazNs1mnst1Adi4OhQJxDW7w=
X-Received: by 2002:a05:6830:f93:b0:715:4e38:a184 with SMTP id 46e09a7af769-71a1c2ad1d8mr4817816a34.6.1731592645258;
        Thu, 14 Nov 2024 05:57:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6WOi/e6VYMuaESWh26yXjsRegZdqLm5bTpJ4NEg8Pa4CgUSOaZkbMvHVfXE3iWkVhZnN9DA==
X-Received: by 2002:a05:6830:f93:b0:715:4e38:a184 with SMTP id 46e09a7af769-71a1c2ad1d8mr4817809a34.6.1731592644879;
        Thu, 14 Nov 2024 05:57:24 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df2649esm66079966b.39.2024.11.14.05.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 05:57:23 -0800 (PST)
Message-ID: <49b50756-bb6d-4863-bf19-f61057d5861d@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 14:57:20 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][V2] drm/msm/a5xx: remove null pointer check on pdev
To: Colin Ian King <colin.i.king@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241112182218.1119158-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241112182218.1119158-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 14LGoU_HN5QLR8iXBul0zKXNzCP-aRt3
X-Proofpoint-ORIG-GUID: 14LGoU_HN5QLR8iXBul0zKXNzCP-aRt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=704 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140108

On 12.11.2024 7:22 PM, Colin Ian King wrote:
> The call chain on a5xx_gpu_init is such that pdev is not going to be
> null, so the null check on pdev can be removed. This also cleans up
> a static analysis warning where pdev is dereferenced before the null
> check which cannot actually occur.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
