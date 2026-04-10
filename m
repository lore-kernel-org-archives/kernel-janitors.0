Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CCF3176E4
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816148; cv=none; b=J6jB60UxtVqz9hzS6uurfAD57vC0CoAmy1s0wBa7reQItrTUf/8mlTlN638Nz8ArWzaafnZ0CR+RYf7vkKkXXM4WndIond8mKuE5S8JkiSfPVgLXqf2B3MbFc+bAjvnZJ3AF+UQDCOBOvKBxLpv+a9sJ8n2k2uMncafrjukr/88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816148; c=relaxed/simple;
	bh=acKCtBBY5beJJNJxkoJd+8Z4H/GcU/gRY0KIHaFXnmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ijjr0u7hDpRkQwZmbqs9ut04uYX/a6zuh12zX9FIQrLAHmTAJWXb1W6x98c8blfkb4NACzjW23xazeCftQT5jM5ctAregt/ZTzanlGsYDNfIE7UwTHaMZkNys5a0vMfywuaFjubyDS1UAbbaDiTzbbmQjs1EmQSTVN2sailrIcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7Y330Oh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSUab+LQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7Y330Oh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSUab+LQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA9aLR2047080
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 10:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnUoPeyCpQ8Rchdbsf90x2AVJoXX8svgOzQ8+c1SLPk=; b=M7Y330OhOedqkhkf
	VeFi11Ur0gycO8qw/fbCJ41a1u/eULKUBLQ+NOeyG+350lApkNfXxqTecd1ndsJe
	OuVdFlAA+tEdfsPohYTxLtC29QBhHCuCCorLJWce2lXGxHtqru7ULFPDl3PhHCPa
	KnSxEzV+3Bt0W+1cx6a175NHg9B6nTtjdGV84sCcI1Nfr58qn+pFRaX39HU+To5u
	vjbFCo9l5/N8C/nJMtCsNs8kYKwjUmpZZ5KYBda7UdI1pye8KIsEvkWk2TdPjINi
	MCmCot49Gy+hVP6rDIPRrXwVwVaod8ilBrqYHsLU5B/mvAJ8r3C32IiDlZawh4Db
	+q+zAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey77819w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 10:15:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a016b99579so6321556d6.0
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 03:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775816145; x=1776420945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xnUoPeyCpQ8Rchdbsf90x2AVJoXX8svgOzQ8+c1SLPk=;
        b=XSUab+LQvNjixZcUvnHwykHjqQuASHx6bDSY4B5KfPW9m1fflZC3ZofBsYwhv58Chh
         fv6Zg5+NPYBlfWGMk9Q48QDiI+pvQmUhtet5nPjpVwwC1+Z6sMcv1npVElxSFhN6aMXe
         8Oo+eTyirimlTm/fApz76Fag/Y9iqP5seQTTjVAWZdAMeCEgOrlMQskwuR8MSX5SkNfD
         zl/yL2pL/GZC1wmA1dNqXF+1zFv4mwC82E4bQVFeEyhMa5Qunwj84aua1b/x/JVjmfY3
         PxA7H547xwYCTgPJtMNA9eCLsAK1TRS84P4evilrSdqiRXw8qsoUK+syTewRE5B2E3Il
         mcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816145; x=1776420945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnUoPeyCpQ8Rchdbsf90x2AVJoXX8svgOzQ8+c1SLPk=;
        b=tAuBEVMBAA97p0iHmNOFOqWopNOSVa722L/NMTuNhjvdCKioNqRRNigFbAnHBfIpfa
         HfCFS2NvjDk3OzsI/b5+tYE8ljdcN+7RcDZ5d/4FLGuicgHaevyDp3gSL8EGjj6v2X17
         nd9UfpVRzaUhWmPV0eT4i3vfenCsbT3RhPaVTSZWc+QZDGQ7YSvSVAxvdDfxPQMi68A4
         4zJpjKs69WgV1wrJYOc00SM9PanS/DQIicEeN7wWjdhi8etqinEgcQL+7GJfaNonbXat
         vSWvaCCEwfNl8u7zruXfkzrTBW7TJT4mwJCcMaURw1++QR3p8TwWRrVFk+SX9rur01sb
         1nfg==
X-Forwarded-Encrypted: i=1; AJvYcCUPeezwUEcAdv0KgHJH2H8myJ8NFsdcOp9e4el4wnlmxae9x5spjG7Va3ht94ftvHn6pq8Y0S5YqSEq9VNpJX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYolu/b8FbeBkThZ4n0jV91MwnDdGVCSMOkLzUN0TDsQaRk5Fj
	f8AOf1kwSpRd9QzeLExLZauAWExhpIMp5dEe80J9CYn9W8aK+bh02+uIA8r1r8jvWyUujHvPnvq
	ebUhTvnoycCOkyVVHlTlbhjh7ckZF4TwwzM7+iKMYNVLpUW7t3JEeOepC/c882UZmKAGy/3U=
X-Gm-Gg: AeBDieuUo00ElX0ER0RZXBwagM82/VQcdhA2PScyDodwQoTJ3Qf7xCmh2kzkopplIGK
	c6VbSVcIhPcjOrx/cZWNjuusbsKZI/Rs6/bp+Z4dHeOYvg9whIPkKzcPHRFaYc4XV+h7jkfoI3X
	blo9yBrs3LTFa8GnLw4K8SIueWslK0JV2iTLz2EdtKjPlOpMs+5hNAU2kWnQXJ0yVlEw8cQxuEh
	xSfyiR8V6BvPJdJ3+VgyjNESIwR5aRI9HtGebYg1CovwGwwRSC5AQsDfbb9ctKH7Wr6BapIpYtb
	1GN5+ha4nMDeqCe5Vf0bw56851owLOCdmF9vyeBXCUCHadkXO+16kapOEitS/cPnFFW2tRFgSeM
	/50vBfUXkMPQY4leB0fqbfBqqyopsLBvddZ/VUvY49h5VU0U7SPSg/tKWxvNJodOmNgpIUnCuIu
	JFLbM=
X-Received: by 2002:ad4:5d64:0:b0:89a:564f:bbab with SMTP id 6a1803df08f44-8ac8746608amr21609486d6.3.1775816145141;
        Fri, 10 Apr 2026 03:15:45 -0700 (PDT)
X-Received: by 2002:ad4:5d64:0:b0:89a:564f:bbab with SMTP id 6a1803df08f44-8ac8746608amr21609116d6.3.1775816144641;
        Fri, 10 Apr 2026 03:15:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f188fsm66430466b.59.2026.04.10.03.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 03:15:43 -0700 (PDT)
Message-ID: <69fbeffe-1a8a-441e-a4c2-a1fcd3d41421@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 12:15:41 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] iio: adc: qcom-spmi-adc5-gen3: Fix off by one in
 adc5_gen3_get_fw_channel_data()
To: Dan Carpenter <error27@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        David Lechner
 <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <adjM_ZXs9IoIYjyN@stanley.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <adjM_ZXs9IoIYjyN@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1FAVI5N5k3t-hS9Xd8RyXlwpbfyJJYMy
X-Proofpoint-GUID: 1FAVI5N5k3t-hS9Xd8RyXlwpbfyJJYMy
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=69d8cdd1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0Kc_pid0jmsIozq9se4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5NSBTYWx0ZWRfX9tObxgeOzu6+
 6IWr9WPrLGkiBNPgrPHEcdmqalI2UJHJWqj5AVqiBZ49elF3HtQ0Q2iX9Jg8hFbCP0dPw3X6Sx0
 FplSMYkaZo8Zg0tXfP6EIcEOr0w09Cqn+lx1DQrR/QJxk/99rn710Pq0INGRsaADPAn7E+x2vuV
 xKimpuYh5Apx5QqRRA7wVp1R9VIpmlIW/0gIFaYPTjJw6lKjRQRCinja4i4BUpGTOjnCqXjsACc
 wsXaDlSW5bi6N13jorFxMjHoMrM692WA6Uqxvg8VYFoCUMgdogVdwU9fjYroFv3oxV6+YLZzE8j
 bbi6JRv/DQ0K509DUGSw1duKCSgy6wtLNpHBAYSPsINjL70jxexYPuCPRJm5oDN2aYKzWDF14F2
 scg00u3/EF2qqOk4brV3Bp5n9i2yV2GKXzmLPfGM5RbAiIyyB50rdo77FlTEG+4w0kXKM6B8G/E
 IP6R+ew5HN26cmVNR+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100095

On 4/10/26 12:12 PM, Dan Carpenter wrote:
> The > in "if (chan > ADC5_MAX_CHANNEL)" should be >= to prevent an out
> of bound read of the adc->data->adc_chans[] array.
> 
> Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
