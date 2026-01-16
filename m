Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFB632E696
	for <kernel-janitors@vger.kernel.org>; Fri, 16 Jan 2026 01:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526825; cv=none; b=L+rtfEKxx4QhfZ3Ic9BJnonBdADJDvsZUGcQWA+7WZSwlnVxWtm5bOwlypgdojS9r2j/A/zS4kpQn5QjIpjgT7TUMYpzWO+jUJEXqAjkQYi9AuyCgpE2oE8Ovmu5xrhIF8VT5rFFJQ2KH3P2LBM5QpqBgVjTA1Tri6iOpiupOE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526825; c=relaxed/simple;
	bh=gwI9m6Qrn0HLwWHQ0y5FzFxHw0ZyG/ACh7Tjl2JVm+Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PseDToSENreB5FK/SNfcgHtrOOVJAy0xxP8dybjtil8yVO9hU5HsepWqTbFHaRTTC1V9AZcPCXUb2P1oIbqJ2iEGPsPXVyJdA2ojn5ukh60mdNmB2LqX2vPAwL/2aIIqyo4x2WzK1HxSbyueApEMcYDfUXDdKEw0mbYDxWGauPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niopzYqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2+rwmcH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niopzYqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2+rwmcH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbbJx3596358
	for <kernel-janitors@vger.kernel.org>; Fri, 16 Jan 2026 01:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88rACB5TJZg2guiiJgrgY/2HQRCAqkBXUr1eDvH9nho=; b=niopzYqj7qyrGD18
	K4Bn20x+YUCKazivETYRG1v6MGvo9W6uppS4phla4WJFV0gS1lx3reNB31XU3JWK
	5Um5iI2OoBVJqTyD6mqk+kXatYE21agkhgyVLbd7G4auLWNUpq7CNkNjXeJOvxIg
	dKemaGVNDxBSAYJY4kYQqhIQN6Kn2QZbFhkbU+eQJiXKVUbfWJldGWBpFjYLwe5c
	Kj+JqaI8lciAowY/vUvTUj0EXDxUydKtMyKGC5EJq7qYixeJPiSjdgVmyIGdu35x
	lqeTAQxPAdmstGFSgOFuZ/p/8GdAo5G2+30UHjdey+u9vtkncmSa00gjGEeEWdWc
	OfDTOw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rrb6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 16 Jan 2026 01:26:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b6b56e2b07so1803302eec.1
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Jan 2026 17:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768526816; x=1769131616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88rACB5TJZg2guiiJgrgY/2HQRCAqkBXUr1eDvH9nho=;
        b=e2+rwmcHxHkIsRfLgJlFaJFDZxJA8Hgh1CzdCgBFClPQq1OJ9LAiN4+3I/ey134eeF
         HmI5kE85oaS4uGmd905xdLBL38stMU3/2FF8FphOZl4iiowbSodUZTJS4xZHvddElC5w
         Vv2X+fcpdQo7ctmB0BJdZ4GoJI5drZdMS9zyspic/tWKHWLeAk0JxvE13eobQFvjLm7h
         06GhfM7JBjTo9ZeWtkb0u568a3pfsU8Ra846QkpEiXkBiRLjgBhWMHXbpJJwmxk8YgIG
         3uN75+zwyAn+JyHyU594cuMlHIPCh13V+p0N9jGiILVIIyJmGGujufP7HRVvlb3eJyMt
         zp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526816; x=1769131616;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88rACB5TJZg2guiiJgrgY/2HQRCAqkBXUr1eDvH9nho=;
        b=bfvPV6vIP5mncJ9dVQ5Gotc+a9/iDjP5gujAyfzjC4juxC094iK1Nrg2+u0nTTGoSx
         KbkCbXPRr6qXw27/CTYjp5RSGhuGCP6aAnDHHpAoQdQNnqIJsubug2lIOGyOlJJFr2QL
         o3I4wjeIHPVFIEfAijUjXlV7cOwvusHRX7NvOYwKocOd2g+a4MF911NeLWBdj/MkEKbi
         17okdr9qCgn3Wr+3phvHRM2tAKFlyLulvvmn06amDzYHI06o+zon3B+5zawtykz+z29b
         d7Vzy77uMdNlsbsoHfTk4uCtmjaydczVwMW02NLKE110tJpprkA0JoazMRj9KdMHGvJ2
         hkSg==
X-Forwarded-Encrypted: i=1; AJvYcCUGj7r6UJWS6si3V7iZwk+fIQLPwAtJkXXB1th88fGioANLWM9yGX+dtVAat4lMYxdI6ky5wXt5OJERDiNU9tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYGZLakYtEux7mpYtkQTsF3Qzk46FQtm8Hq1NjGtTuSgewno3Q
	5aTySQ8oBEqsFnT2vF+2pqGk9iQ4i+rPcXvZeD6ZzwmaA9ERAWmv/hZFj12k6QuGs71e6IWdfgs
	DLnh+rDzuVGDCrQ/iX16fY5l+/8LbhZYblMHBvhTstOKLsla6EVAdByTmqO/ERQhE5D1f72s=
X-Gm-Gg: AY/fxX4dBTdcHSz7qnVi4vToA3ngUgXN+vAVrIlvd/K/E8+hAE+sO1W2Dn63MpLc89R
	15XVIyZb9OiosP9E0VrVehEmr8t5qcP0ZnuYqUgmweAMXdIUKdSqCP4bM1w/CkPlWO5FxcTvKrs
	du7PkzXpuTTeJWKtjdDZIml7+zgs1TFPhdDYA6Ec9bRuDLpjiuGuDGK/l817Zby6Xama4vpFXGQ
	vuyrwsK8fX+6KMTNXn+5FO1VDafxp0NUpPoKIxILoifS9QxaQt24c56UtTxTX4zmXSgqYOYbkpV
	9+c+vQLMzCO1S3ZD9fmrkiwZraFoea7/6cB6lQ+GO+qIcqeQY2+Uubts1Kbv13Vx3Qh8y55x+NC
	s4zibShVnEBSgd6EDlHq9o6VwPYxKG21+s4WHN7AX1WrvoKTrelLagGdlaj/YoXHW
X-Received: by 2002:a05:7300:3b05:b0:2a4:3593:9692 with SMTP id 5a478bee46e88-2b6b3f300b3mr1322038eec.15.1768526815886;
        Thu, 15 Jan 2026 17:26:55 -0800 (PST)
X-Received: by 2002:a05:7300:3b05:b0:2a4:3593:9692 with SMTP id 5a478bee46e88-2b6b3f300b3mr1322016eec.15.1768526815193;
        Thu, 15 Jan 2026 17:26:55 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm884104eec.9.2026.01.15.17.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:26:54 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aUOw1J0TU4VgeXj6@stanley.mountain>
References: <aUOw1J0TU4VgeXj6@stanley.mountain>
Subject: Re: [PATCH next] wifi: ath12k: clean up on error in
 ath12k_dp_setup()
Message-Id: <176852681459.1143034.3213517841557777716.b4-ty@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 17:26:54 -0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAxMCBTYWx0ZWRfX5p54EDHrXqJI
 mCNg/fZEhOT5PTFMyZgdDxt2Pw0gVC/AZBDLZTqEVXuiTLzdFSqrzYvJNW9cfTpFM0PW6UDFdD7
 HNnPK8Hg1pNPmlpJD9lwdgcaPPF8mlmOXD74ABGP1jB7OP2/Endb+xlHEhKsg1mtkEosIAh+X7X
 q8yDlY5CHvdvUJvNbCxDsRfKXcuIXQqeVL99c19gvPw0ngXe47NCqaDnk45Jji2KvRxaMuLMErn
 G6JjvyRHBLDcKXryFV9zRHp2r8Pw0OEQ1EbtffQeOd2wJ1oet8EQx8j3+s8haF/Xime4+rHN14y
 teDFdrV145U1dsJ/dIN3LieSuQ4MSP1zDcxLHCplPZ3rJuBX6gEHUGDxNpBOzKs17AjHYzlwyv1
 7H2nrKrXLXFWYQqZjM42JuLMXJJk30+37eNMeh9Nc5MGyJTDnbBOpivcnkWeSjL59z2kq9esncr
 Ta7gC+nh9ipGjgORtDA==
X-Proofpoint-ORIG-GUID: qQ9RssbhEs6HsfAv7mOfmRkCi7FkPn7y
X-Proofpoint-GUID: qQ9RssbhEs6HsfAv7mOfmRkCi7FkPn7y
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=696993e0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6YG70U5JATtl4AP3FOAA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160010


On Thu, 18 Dec 2025 10:44:20 +0300, Dan Carpenter wrote:
> Destroy the rhash_tbl before returning the error code.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: clean up on error in ath12k_dp_setup()
      commit: 40feb23c726369700918b9c35db987f9fe3c6498

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

