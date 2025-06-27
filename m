Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57802EBBA6
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Jun 2025 17:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046940; cv=none; b=i7+Pu7NR+tqlrTu1FRibrcVTGr2+2EyM3J/3Lst+2LJvn+R2zMJmORyyL0QvEgilW83KXOzTDKlKVcDYH5dHeR87AZEJ8iouK6mbwEI+e0cBedw8x883scSEGKg/bFl28fi4YIijaZKxoS2IavohtmRCmc+ORoIBuY/oDq3tWfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046940; c=relaxed/simple;
	bh=sP55RcNGRtVXAqUW36R17TRg0JabtTdiLcEfMjXZ0rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRFi1sYKzdicaZFsuhDSoAASfMvPi4Cfog1JNHwep7kAlKxNVFfC+omTxLevtHLE+X9wUPjxMgLXSiYtGUPqMeWnO5Iqt/WribQKDGF25D+nG8n7Uv41zZiP0mBHeqmNI4hxUO1SoWMVyhNBi8aq/vUN+NIXv/d0HMEMmb1EiDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bktBNDHk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bktBNDHk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBj1N8007346
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Jun 2025 17:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhtPwHF0fTtys7QWflgWfeVzTXfKtMLTUh3g+imGqfM=; b=bktBNDHk6uXDTEkc
	P3hPdPknqjLUHgdbQBnOxh0EkFLa3qjGh0hsd72BMxnmtzFKmSqT3MZn6H5wQFZn
	esyndwzb/ajSbcEuCUFWD6HeppBAWxX45VTf5anMua3JjOjDl+mRUxlIT2fh8DNb
	LFX7XX7JeuSDBYFs12oq1x0qRnbASgbjTqZmYwvKsNNPX9rzMduNHgdttdd4TY79
	htJBfVjiXzKr++u0m8uUbvkV8dJgth9Zp6qf3fbyWl1ej16lGxZrKGOczkqGWWEO
	qMsuPvV296TfDskYUzZ1Cu4EyhSKTYnjECJUlJ25z1D0BUiR4jJOgy6b2GMsZpN+
	HWYIcA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc60tht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Jun 2025 17:55:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fac4b5f949so4924596d6.3
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Jun 2025 10:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751046932; x=1751651732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhtPwHF0fTtys7QWflgWfeVzTXfKtMLTUh3g+imGqfM=;
        b=JckLEOYJiMydISwGp0nBEsFeMmoJUWxA3NR3QNlUFHqTphPsW6M3zloB9pyVjfoQgj
         bg7Eo6pxg6sgXLCJ7Iqrv7ov9J//7+GNVqUpd5jNcpujL9xZbzA2eu+BgIxWGvn4pUB2
         ldEq4aHRaDzPxSLAtckT5KOHR88wceaYVyvTTqIP9vajU2ydj+9qZO5df8up3u7psRLH
         034x7IQFpnh7NinD2zvLvKVJB6nNULsrx9Cj/PNgdHJkzGSrtuO3NE/i4MADUv0z+JfP
         +sUgUViMPnoe45DRzolyg3Y37k0Uh5MqB7bZXo43dMs/mB08eYGVN4EGCmOl5cxx9FH+
         Q+wg==
X-Forwarded-Encrypted: i=1; AJvYcCWAhd8bVET33ZDmBaO4NuLn9ARtDWK+sgY+gZuHmbiPM3AAhDQvy/5GS2wf/YUslKJ86tP3DWRuX8JBf6V/IJc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyxc8x72XxhoEsn8xujHGCTh0zGoQ7FAXpkXIZ9TdRcaTl5La5
	/sWbrOdWS+yQWIvsVdjBIIwEkjYbJwlT/HFky71L7AJC9cn8rNaffRphNkzOZxkQpZyvpUlm5Y4
	5nj8ITVr2b8CTtka6a4nUocTT3lDB1e6Pbdeqx5aaAiaBMHFgfiYjPBVzUxeEqrzCdgMW2Fg=
X-Gm-Gg: ASbGncuwdf1yHiQ2wdejo+rNw+6F5OLqgZrxGGIpVTa3Jn54KSKRWCSxB5okC6qOvNc
	uBna0Vr1p0FoszXkfXEUNDihbV8nQuMAXanRv8QTZxfkWTNfE2+lm622R2Q1VXB+MXn0mFTLR9/
	Gh49b8pv3Y8FGirJjS4Cz6m0f9lPSfL5RBVMuPwWWXWV2+dicdrzlNMwCD/Y23RrGOc5KgMcbtK
	AmkjMfRlNoRj32YlcPKS80EMJxhd3pOunjxlFIH0P2Tzousc/g9KS//55B2k+/BmJbF6OsEtqYq
	EfLhTTxNndq69YGy6dk8/cBuLh5og9VlrxHW0yXhPCKUaSeyx7dy9NyMNzA2SvLpHs/vOYbM25O
	m40A=
X-Received: by 2002:a05:622a:1a0c:b0:472:2122:5a37 with SMTP id d75a77b69052e-4a807390ff1mr1923021cf.4.1751046931756;
        Fri, 27 Jun 2025 10:55:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjS6V7nSMnoKIToCQDAP4GKzUa5d91t9ousBqXncQjQ5eyhDeXwLOlzvN8i3GRTqy4F6YNGw==
X-Received: by 2002:a05:622a:1a0c:b0:472:2122:5a37 with SMTP id d75a77b69052e-4a807390ff1mr1922741cf.4.1751046931099;
        Fri, 27 Jun 2025 10:55:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e1a96sm1778182a12.19.2025.06.27.10.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 10:55:30 -0700 (PDT)
Message-ID: <80912fb3-2af3-48b1-b81c-89bfcdb54841@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 19:55:27 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp4: Consistently use the "mdp4_" namespace
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OWSIK9QA3C3Sg5vbLPh8tmCvD5hegFrP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE0NSBTYWx0ZWRfX5if/MkD8PbMr
 o4ZNGDYHtKmcC8Q8UMujYboVgUiKUTjTKHkDQawt6+8zt+Zofo5FM8ojfH3nCbscM2hKELZhMnD
 LMSN2dtIBnDSEKV+XYS2IJhKVdKbXd+8o3UGcXZFM4vZrCJcJ5qovfvT6S5Ua36qbnn8t0jD4O7
 kHGV+GAvo5AbCQ3ktyCncEMlny29g1sfoaboPY1YbwP5GyCAr7Rb7KIbtcQcj97c+4GgYIy20eP
 Co7maeI2rNOT71N21VuSNMPgV/Qj/wX8Cup5AeLkL8YBJ0ff8yrZNu5meFywYwrOX4q9FecGLOr
 +H7kHG0uh+WETEauZhefxKeJl93Jqo9bglYti0+dA5sIZ2L5yjX2Y29LlrLAAX6Aah1nOklhzS3
 BbG2mVmxsAv/DHzVhtWtM314V+fwWe6qMDIQCd209+CBIEew7A9z+KFjjiRsLybbfuFuJ2C1
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685edb17 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5MiDvfStR0l9wvLywkEA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: OWSIK9QA3C3Sg5vbLPh8tmCvD5hegFrP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=783 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270145

On 6/27/25 7:18 PM, Christophe JAILLET wrote:
> Functions and other stuff all start with "mdp4_", except a few ones that
> start with "mpd4_" (d and p switched)
> 
> Make things consistent and use "mdp4_" everywhere.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Nice, thank you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

