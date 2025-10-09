Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB4527A931
	for <kernel-janitors@vger.kernel.org>; Thu,  9 Oct 2025 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760047622; cv=none; b=ty8cDY6NV2DMiCa+eWjVEDEUkYp8ot6Mc7AqeAeSPkWemBTPT65gY52wekqRLfUMukgIhxGZ7s9BlveJJNk5/xA185JWEUYC6l03/cviYkF8LB50NjZ8fZfqi99Jz0bBoOlqAu7gvb83Ff7MnkzV57ZoCdteAhKOvTbhGynqnWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760047622; c=relaxed/simple;
	bh=dQORkJk6lnXWVGu2OR0fRY18hl8zcwHvysnU6b6D/2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1ifz+fUaaFrHnXlh7n73GYXEncXLX02T8NjaGMBxDf/uGHRErdzoRYqG1GpEtm+cjQTvjIA1n8/3fpLI0rTrnPHfHguNuH23Ydmqo2sTTa/ZfBzwlgvcHKv/BD/fn1xRnR0TJfeHNW3Io6UR+B4740eN70m8DISXyqgety5Bgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fp17ahPT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp17ahPT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EaJqb004934
	for <kernel-janitors@vger.kernel.org>; Thu, 9 Oct 2025 22:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PR41P3ZaU4FEtAYgEwsHsgOa9cZPdhmWSVDIIYk7xVk=; b=Fp17ahPT8DWjCQpt
	qouBdxGL1HMc6qfBQ5fW9eknKz0/5+fYAXH6FGfBwTVqeKnXsCrtGof8SNNFqChl
	vXB0p1CInUbxoMqW31vKUzukBG8LlPAY+IEhKUX9qYRTPK2aaCV3Umy4IqPsxF1Z
	SXZYRzGntiBxBIdpbPw1MTD/qjsmSCBn2o/mGZf5seTFB59S9odpAcMN921M0KzF
	vQwv+yLvRoH1N1oaJbeePgp1KDCm6Uu/gv1iid4CEI0KeNuygZ6mnT5QHiCJOKB8
	2X8OLjzYRY/cVhU2ii49bg060HRAN/F4ftjh83y/pP//xh4qQgU7yZWwE1Nzimma
	pM+cUA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u4dbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 09 Oct 2025 22:07:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6325a95e44so2171680a12.0
        for <kernel-janitors@vger.kernel.org>; Thu, 09 Oct 2025 15:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760047619; x=1760652419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PR41P3ZaU4FEtAYgEwsHsgOa9cZPdhmWSVDIIYk7xVk=;
        b=ErJ0y8U06zkHFTep34+MBaKaW12DA1ep2QigacOzDzIJOwKcid0j/dYc5k6z9gpeX3
         pc9uthdx0EeOm6ZsVO+0gttpCxPaOC9iu4Cch1TDsCYdVlv/Nuh/bRc/RJyI/sKCpFkq
         sbZUJO0zxMgpSB5q5SRISagn6I5dqE25h1CIP3rY3v/jneP5kJ5IJFk3VTnbkuhS3fZW
         tcN/a9BVT2utgohpI67+QxKF852B9HNy8DtyPLxLrKmv22JCtVSSiadxzT64IMS1icik
         LPrzBj+HZDVsZkpT1B5djdWWScfSwjRIJpauV02poHsEP0RoiXYj0ioY3bgssXLLOs7W
         5N0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvtuqpnSZBCyhngrtwQrTSrM2x3wAdE/smXkN7TtIkpcTi9vxL9QsLUvJTeP98qZrNcAXJXJVHed/PHKxjla4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIfMR15ukBdVUCdkaHTh1U4uYKvjHsnIEbSlTWkuyrHdVc9l3M
	NeZtSW6lKpIZuwr+rUpxGGsTK8r2PyBdxefTkJ0NBgl/px31JsXqwqHxUkCPRxErCdq1W80sDdi
	/7ooqq9ubejn5YDc2iw0GoMl6olmgj8GgbK2pLbm/o95H8E6sSi9cu11uq3XWEuWxD1bXtmU=
X-Gm-Gg: ASbGnctz40v3yzo+5BMZYu9XdfALmbnbEDiWmi4orMmMcrwhn8aY6vXiJBIvgy88xSS
	DOz5cpp2t82j8AmaRkOEfGsX79iamqCNo29pk7KvjyJNrKILPXagdpTg+fgpbWw1fpA94H4XUxQ
	orZ8BD0UjcbFETIDQcXgpgd4xVN3ZTEhxMANk3E6A9L5SyyN/eZ7tCsxQTwMTm/J5b/GhIopfP0
	5ZUB6P63tJ7n9XLQiogHBISERnqTxAtGk+4t/Jm02A5L16MJoOWJoTxqmXT3+o8A+REKB/LhIIS
	sEdazdGVJidiuirBx8tXlpRCxtWnMtEzllI9f6JH9c829Xqq01mPsJxEEyklnZbDvIiLcsdEaM1
	NWsB/G+aGPuPnUj7AYZHWG3aEfS0=
X-Received: by 2002:a17:90b:58ec:b0:330:a1ee:e119 with SMTP id 98e67ed59e1d1-339edaae564mr18570375a91.9.1760047618898;
        Thu, 09 Oct 2025 15:06:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4fyyM+GG4JOApDItPR8uaTlgz9TNMfnQuqAW3pfKetHHZhA+J8uV0VeyiU+3SyCfTwZRmzQ==
X-Received: by 2002:a17:90b:58ec:b0:330:a1ee:e119 with SMTP id 98e67ed59e1d1-339edaae564mr18570335a91.9.1760047618340;
        Thu, 09 Oct 2025 15:06:58 -0700 (PDT)
Received: from [10.71.109.75] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61b0ed20sm908807a91.23.2025.10.09.15.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 15:06:57 -0700 (PDT)
Message-ID: <55709a7e-21bd-4728-a818-d2739fa1a86e@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 15:06:55 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
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
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vrcuwu2n c=1 sm=1 tr=0 ts=68e83204 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=HXVKm-MKDGyxfSjg48sA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: iKWzmw6bNVtyjS2D1ZzAv_rP88TVTmwe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwxM9F2W5F4UR
 /unZ9UJg7/MphFAUW9ElnI2omTorukZo7d8GI9mqayPIK9uMaZv1zRbQPbiri06RaApVzRPa9jS
 Jxe2ZM3CST2yY3ighREJWg97T+d7sTGZOLD8JZhh1+eQsotwaJHW4m247PZGwWki4dLILvx/kel
 u1NXK0P6c5tPqtgZxRFguND25kbLu9jXeMf10nKO5jeDSHX9OIGxH6pbXXn39dtOdqMOCWEwyOf
 n/wrc2HbSrlV1ysaPw7uJcvmoO+rFLqAricqUtCIoQ7xbhC/kgAINlLbuRB57Gd4d8C9mqxW4sG
 R0+7wjF1hdVedns9d4/BcM8elUeR926zw/S5t868R0Cdb5kY+DvpEbvLjCbfLficgOyRDK98i2n
 rBV2Ni9JF5liMfDUDIhsfoTn8akepA==
X-Proofpoint-ORIG-GUID: iKWzmw6bNVtyjS2D1ZzAv_rP88TVTmwe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_08,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1011 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/2025 1:09 PM, Christophe JAILLET wrote:

> 'mixer' is only zeroed and is not use. Remove it.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
>   1 file changed, 3 deletions(-)

Acked-By: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>

