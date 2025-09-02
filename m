Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E7258CF2
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Sep 2025 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816564; cv=none; b=aWHcBX3UILeYhOV9rQODxW71djW4Kpc999ifq5CcvxRjpSTKCfU4HoGFUR8/TTtEjnDp38BDIA+3Vyw4AONjVojwVzdiHaCWhCdX21iloJh6J8gF54wEV8MMTuRVRUYSApB1dv43AL3lYqHHTxN4JW5kNDC1OPZarpTF7phtOKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816564; c=relaxed/simple;
	bh=3awv6U4/xXS9ndF1y7siUavi5LFFCkIU3jbXd69usVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLD51yPodbwN8CB+YQVASdUlK7Ce5RZGMtp6n4XzFa6tTYQPpwyBuXQOpC1UniIy7MkiFeQb46HLQDAn6nSei0yvFC+BZTKGruTfSoymCvr8+cwZbh6aPLA5FBQECSrbxHr1Ihl1N+9xeuQaLpRrCqus8bhTwW5Siju7rKy9cPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fg0v34Qe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fg0v34Qe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Al7oY025161
	for <kernel-janitors@vger.kernel.org>; Tue, 2 Sep 2025 12:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ILiX1Kte1Zc25Jd6RLaKwW+X
	3sQ2KmSi7ISWDpWCZuk=; b=fg0v34QeKa8PlKiA8AmqgJc28GgFG57beSxyadVE
	Ouo7snmBxZhCd09165t5Guo7+2q2SlK74wL4OFgCoSP8dMpT+9kylrWKouLpe1Ed
	Aqr/9iNaXc0NB9a5p9k66CcM5bIC/9erA4LC9s6I4pzuvcBVZE4vSjIJ8v7ZH9s2
	gAH4swQn0EEEUglXDerpFaAUsqMS+3MviJn1eY939x0l4aowwrjVrgA5+BI1vK4N
	H/aEFCsu5aofmSL3ewAVf28ATrWHyv5K9lJCYfo/iwWL3XJO40lxGFqlW1M8RHW+
	1g3BxCZykbwGPNXB1q/+cHydivt3sW9jSMuVHhLZ+OKRvQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuytmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Tue, 02 Sep 2025 12:36:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3349c2c38so46236311cf.2
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Sep 2025 05:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756816561; x=1757421361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILiX1Kte1Zc25Jd6RLaKwW+X3sQ2KmSi7ISWDpWCZuk=;
        b=n35XBFBHWaAj2GU7D0MP73aMu9/Lnl4AAbwXyPv9VHNHygET444DzjkmH6eNKSk0CQ
         LebT+4v0MR6PaKyu0iyUOi24y+/pBhizrCmk+PE7luClhQqtFes3dXPeAsDVJf41xNbx
         Yxexm/WMimoTV1k1nq/iQxju+khG86t2oM8g8aMEig6AWfgP3bVwR+vDeXxSGaqsPfMv
         iO0hlZOSDtYwYOA8bSKFhby6drq1udRw8dYrN0h68pTMj+0MsP0ma+JLbCcwuzlX0Kim
         fc6QxRVxED6DRgtiUGjl5HYvn9lHWWVTEn3a4+hpKyDatiFlTyumnhL1e+DOll/zmfgN
         408g==
X-Forwarded-Encrypted: i=1; AJvYcCUMzcWtKaSbykEB/a6yvbZ2Jc8xwZj7QOziJuniSI2wP/8u1IZQYLm7olAZz8rgkYrksmvak1ArNtTtL1A0Kmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgIGQ/iD0L/myjHWwlorSIhfz4Zj37KXBfEpmMui/T/9OG74Ze
	VhQwuJ8I/P7vQXtk3FPmkAe7ofRIS1lzX7MSXDKSEBin0emutI4baK85hIr6ujArOTvNYBV0dH4
	0vSQe/U+hsL3pqC4gp8zB+VNsauisnD2+hhZ+QOfBRoqsjwnnBxx0MRtGDgAA+jQ8e6yMKP0=
X-Gm-Gg: ASbGnctEHq8nkKXNO+1m/7Qz72FaR2J6T2u+Eewc1c73BfVO9EESQo1TG3k6d20Ts84
	12PmazgDXJ4PITadn4vF8MFfpKpxioHq7RBjcgG2LVDN2Psrkw/J7KTyAsyaspRtLprLodqOlJ0
	yq9gx1JLf7LWfaqAT06z1wu42AuwnsTMWgmD1t2eOnGuMCmLa/hnHvrwhySZHDDgIHvHpZtKNIc
	QRntAA836qZ7WlPHwhNAlEqVh6RJ6+mLBWr7JtxjepyXvGYKQtJGXYGw23sc6NERCfTZI0yFojc
	7q+1VTA68KnnrCKy0IrfP+Lj426PH2e0lyMF4nKu/TbvObX0fWbZihf7vf9NwNxPSMxJKJRURsR
	eRZYyVqr56M5WX2VuH3fk/p8XHOQNBT3MBiAvqj2yiQbXAUnkULym
X-Received: by 2002:a05:622a:2cd:b0:4b3:81b:c5ac with SMTP id d75a77b69052e-4b31d85d5camr129762431cf.24.1756816561123;
        Tue, 02 Sep 2025 05:36:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvKP2rcrShFJTSAgCxbP+O5cx19CegSGWpv0b+ec33ky1+7ucp/wBQW9HOyyPTSs0QsJn7tw==
X-Received: by 2002:a05:622a:2cd:b0:4b3:81b:c5ac with SMTP id d75a77b69052e-4b31d85d5camr129760761cf.24.1756816558669;
        Tue, 02 Sep 2025 05:35:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56084bd2803sm317462e87.64.2025.09.02.05.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:35:56 -0700 (PDT)
Date: Tue, 2 Sep 2025 15:35:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] clk: qcom: Select the intended config in QCS_DISPCC_615
Message-ID: <uhjhgutnur3qjbmqhpjgg3dnsryf6glm56szwy6iys5ffuijsv@ld23wny4s2fx>
References: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX25aNXoX+u/xZ
 bgLGg38rYcs2FBxCqRtOyGcdN5F+f6GYvZFNHb4xT5STvUz8HaKnr9pFPkTWZCTurOtMpv+oLZC
 8n5oRoUD/QKAY/RVAKWUnDZn47MgQCSPkjDdU47oBAr2aLWS8Tdl2f69Sw88rhpWrW20PhgsOAE
 27w3pILoR4Kz7G45kSaQDcFxgDnRN55RqadlHJrhJ1PaXaROnio5ScNYSIJfX1sPicmv8bB0/qY
 YYITCX+9luI8oAzN/mGV8lwxRMSjfNvKAH5+RAN9aZcK9MqrHUOhlqqf6qux+JxhQArzcvFxIGN
 MOeehJ6nscqoqu2+cl5EAclL4hJ+ilKLIfXTlXMw+HcYQ7HAkA4LK9bfb8Ux5hchA79yEZjjZmp
 ghy+3eyz
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6e4b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=GxmfVdM8WKu4Uw088-MA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: bojUIBmuDlnIYCWVS4PAIxhXrwlG9IPc
X-Proofpoint-GUID: bojUIBmuDlnIYCWVS4PAIxhXrwlG9IPc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On Tue, Sep 02, 2025 at 02:17:54PM +0200, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock
> controller driver") adds the config QCS_DISPCC_615, which selects the
> non-existing config QCM_GCC_615. Probably, this is just a three-letter
> abbreviation mix-up here, though. There is a config named QCS_GCC_615,
> and the related config QCS_CAMCC_615 selects that config.
> 
> Fix the typo and use the intended config name in the select command.
> 
> Fixes: 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
