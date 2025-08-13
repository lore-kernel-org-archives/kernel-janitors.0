Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CBE26A0EB
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 18:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755110929; cv=none; b=HYHLmdLugHWI+jXkEIdk96Af/V4jHN3GZjydf29HlnfMQZ+4EOGLXXuriiH//AzcO+D5Cl81o54cupHpdv2Ww0zonBIDZnXTQ9SZIyQnYiNieIYhEUzJEgFkgS+z+2dz2AXGniI/UFNMJYbhpFk6ITD534HvzkAmfF5CMzwctXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755110929; c=relaxed/simple;
	bh=3XlHQrrJ9pI6NtpfqVGWx14HfZDZKEzToBZSyzUBuvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWP6KIDvEAz8fxnXfi96gX44CkjEXjR0FjPhTEmxM3SDxFg6/tD5U1QjkWI18AZG5sZ73iNXLOWD9abI/IwTwzmOg6OOx8Meiex0PXG6BoKbSH/kcv72Rw+vD3j0rTVtfyL5fYh/59N9ohD1CcRNE6I48379SOJI558OOYkW5FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENkavh0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENkavh0m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLdP4031942
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 18:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nzjG887+TpcpPmgncHFaqwjK
	5tO/uMDuLQd9TmbYrLA=; b=ENkavh0mabML7ff8x/WXpVF6Riy7+2enLJ8T1NJb
	f8uueFqvBSa01rTEoC0t7WxQjJ6Odt+KNaFJzAzxPlgkAWczkZOdmiNcMFeqdc7v
	8fb9kW5J5lR4XGmWrJ6/IOa936ttVF3KS6/zdSIY3djLlUZnQEBJR55gEDlp5y0U
	acTf9upXDmjmmYM6DksSt4GroChBSNB54XQwQXeXFAD2b7eEYYCax6yMjYffMj5S
	EyK6MhcMf6pPOveP/sp5L4MQBICW0/eGSB2OLNx38pq/tDAOcXLZ4Q1Qklf2hFUL
	Feadq950mZF2wA8vy3Bzt+jNQQcyWFSjOLxW9icf84fRFQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4gx3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 18:48:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b1098f924bso5109191cf.0
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 11:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755110925; x=1755715725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzjG887+TpcpPmgncHFaqwjK5tO/uMDuLQd9TmbYrLA=;
        b=RqyIpBzoUURLOTYvUDMgt9TrfN8GMJb48+8OzJVxNnaEq4JYQKEHqDbGp4Y0gC0g+C
         Q5gIT2CsdsVWCEDMVWqOqAKjSZzmzBpU0Q7kDF9aX6YA28H2Tro6xNkJiAAu1o6SM4tO
         2HCMlV9l15+pGxL+Dr/I2lc3l4N8IInsKSPx0ThG+11Y/L20j8saCx0M4sM52nH7SnHK
         51gm3w9nzFAjs0/kqBzBokdd+yLvWmHvuz2oFua7Igl21tf9fbnlgEinQ20WCpX2kRLb
         Dvu/YDc4SVOrpkF+VVkPRavNxQpqMLJAZN1BJsLS79qLG6HrbhJ5hytkGMfw+Eepa5ms
         ZoDw==
X-Forwarded-Encrypted: i=1; AJvYcCUjCRNA+atb9r7Crg1KSXd6xQXzzQNks7lk8zS9dRTbLP6hZzcakTJQ6yOXyzSb3nGtB51G106bdY3FK1cCJy0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx37h7liJnG/8/6qv0Sks457GsFs6HL0MqGRp4+vbHd5ZVpt8CV
	+P0t/jGTy1/F4RudqmjsHK7ooPBpjJes0K2dDcIHNykbqtcqJw24/n3LxRs+qypVKS+7MTW73HR
	FKB7J09ir+fs9DAZobgV9Xo10HRyP/QtO772JidD6/cOdMOOoql/efpaH7AZgffH2HB0xeqxdVJ
	tmeJm2Ug==
X-Gm-Gg: ASbGncszyXVkXzEgHroUc/llWTWZFOTu1AnbmK/NV21Je7UKSvclDN2C5eFCKmq2CRj
	CvGG1tz/gQd5YzM3w1SxiaX4x3gmA7Q7AdfWkYlPMlUBAcMX/VhAs60rRCUebX5OxdUVuPtdkc8
	ETEbmMk44wagz1sXokUNLExsNqvJq1rBo1fjaLibTS2s35ZeV79ueiOoA9DoaxUwtqvkA1Rgw76
	CRkxjsL+kt4YHXnWwLmVpWa6gxzNT2PKFtSBBh6ebUscQdUCDZjaJwC85thFu7VIFOoO7Yul8c3
	OFCudcp5KjV4SgxZtaqCLKwD1Ni+bqi8JXk6cdKE9am5tB+ri8g/a0caZwgPs9DQdf3iwMaVYBi
	mkUF5Oo0y48NnFZl4njEuypBIAAd432iNcUscnARUfLQzjbw3NGJi
X-Received: by 2002:a05:622a:1f18:b0:4ab:4d30:564f with SMTP id d75a77b69052e-4b10ac25797mr3389771cf.47.1755110924717;
        Wed, 13 Aug 2025 11:48:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtZj7q2ie90roefmuQxk12/j/f20h198XGmN/KkyYOEK/ni5a3exApphv1+GAMIRNZyzAErQ==
X-Received: by 2002:a05:622a:1f18:b0:4ab:4d30:564f with SMTP id d75a77b69052e-4b10ac25797mr3389131cf.47.1755110923983;
        Wed, 13 Aug 2025 11:48:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-333f8cb9cdesm316421fa.6.2025.08.13.11.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:48:43 -0700 (PDT)
Date: Wed, 13 Aug 2025 21:48:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/dp: remove redundant check on ret and return
 statement
Message-ID: <l67rsnpd74uge4lz2tm4jbrwmn3acxt6cbrj5yasz3x26mt4su@2oqljbabkj2a>
References: <20250813151243.2055798-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813151243.2055798-1-colin.i.king@gmail.com>
X-Proofpoint-GUID: DHgz81SpdrlTZh7BIddSBw9qChgKpXJJ
X-Proofpoint-ORIG-GUID: DHgz81SpdrlTZh7BIddSBw9qChgKpXJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX5JRUzv88yUYb
 Sq14zC/jFQ3ExI0nfM4JGGZqtw5WD3m1oFaLJVQxtBR4ZQ5rVruswHKpa513CssPywG1Qp9gEDK
 nzr/gIbCkC+o44BEexgRVSpyfxmClMSFEOpmSGXq5uMN+6Bx3aQOrlirt+AgjV0BSnrSFxx6N54
 ++pw6QCBemMfFkQ5cKVM+IAp190uYSOfdBW/7pyRquLEYalLesxlYuo+1K+ssRECKf8uWzG8Vsj
 SXND9tCmfIGdaTtqj0m3ueh2EBlp2l1HS71X1gyzICqd+pgjRRgOicA1/WgfFp5fp1VcubTQyHa
 dCkZdzO8KNauvFuRKr6XMQiUAIGYke9PG4leI7Y2wHyoGzMJHeGgmVd38Mx3ZmgYb4sv+WN4eYj
 4AldoiGB
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689cde0e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=HYx7VuEMISGMiPhQd08A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On Wed, Aug 13, 2025 at 04:12:43PM +0100, Colin Ian King wrote:
> There is a redundant check on return and a return statement after
> a previous return statement from the call to drm_dp_dpcd_write_byte.
> These statements are redundant and can be removed. Remove the
> statements and the now unused variable ret.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
