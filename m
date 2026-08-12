Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F0D2FFF8D
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Aug 2026 18:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786560428; cv=none; b=ctME69tMX5JgYbF3/lve3IYQS+08zKql4mwjPXtNhD4Takp9dF6NjcTJVQkN1th990msLEv869+HHGtMcGGAxuRsMB/il2M5sJeSkFeCQnOI2APy7ORZz64i85kIcTEQ5mEfVsATtxaR9jQV0+WuS+JiEQsOJ1mKZTMLGMI/P5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786560428; c=relaxed/simple;
	bh=vgLcBFjUyF9dsrQARImHXFlbmGo8PPdF+S5lujB9Py4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/jRKY0nMiSWjxxlUwKmKfD68fdPjcSSwEnu86FAAw3kHuTEF/t+89et3AwbBHVQYKs4SsvgkVva5EuT6yp/wLICwRj5lsjrZr+eYULipA2vuxw5up6uQauUKennz5AnVklDR6awPaJ12xkVafNx/awZhvC2xgs49N9Jgs/m8lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErEW3HU4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R7xlFNME; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErEW3HU4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R7xlFNME"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI9FVE057210
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Aug 2026 18:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+9KjwlB+VepBlVYOnDYLDplB
	PswkuldRjCac+kgR9nc=; b=ErEW3HU4rCmis8W9Rx1wQdw35HHUWPbpH37tRq2r
	/BPMzun4rk9ZWt0CMq8IwLXztHyfrO999oh5Ut+kiEIfCGLJE2k9IFB3mGOBGFXb
	kTir3lIgW+1YTLiXJPJSeu3Ly44LStpujXHXkcTFgHVQkVxOk6amPxCnlYk0oxSn
	jzkyJcEDxnOiaQmVdwpVMu9tzG9/tLjvu0bnicExrIS54Lj3GnHdI1U2kmgjN9kh
	pw8kt06ei/8sdBqlNZHfnIvgVNzhY8Q0lS0YyEbrSJ+41DhqcDcXaEF6W+WcLZ2A
	W4AmDuKHyLJhr9txBHKACStbyTrk12ZBGO4dDjrNA94HxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0pmytcfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Aug 2026 18:47:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a9764f0so13894131cf.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Aug 2026 11:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786560424; x=1787165224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9KjwlB+VepBlVYOnDYLDplBPswkuldRjCac+kgR9nc=;
        b=R7xlFNME9QhiWY2SQoGxminlhJ+MRYBG/VpjG9hFxJOPdvzCQX9pCF9v2MKPqrr2y/
         IQ14GmLUeg8XITUxdYYc0tkF1TRIq5TC4qfnK5k36iXIrGQ6wg5j16uPu+CLj82fW+5J
         Sht8OWnl7cfpHUNwDVFA3L8bwPPfGdN6HzgdRu9mwf9FQQhQw4NuM3qd6uHadWi7HbJx
         otQdFb9HcMHwUmIm3RfJv1+jW4ZeaiqyOUSbYICaMQIAX+jEYLcx0Q+l+yIfBzVvU5RQ
         rIsnCsPk+Sgr09Xs2hmJzevNm93aI69n5eTcHOtd3rgwHk5PJjKdIosIVLG629tZLMSQ
         Tnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786560424; x=1787165224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9KjwlB+VepBlVYOnDYLDplBPswkuldRjCac+kgR9nc=;
        b=LUi8/hqSkM5/2tnQzsm2q20svpx0bW8Cu92+G40PGTz2mdkYjGhQU9tTQadE6Iy3UB
         Ac5k6c3TlqgyFRX4la4Lztm+SFb17wJohOvgSxNJmBBaFvfqyk5jWQLuwpi6hy0DvNzB
         FFRG6ZQGxHEx72Wze22vr+2RFfslSLpBOsN47nGxnUKPVAltXbMPowWqNDK9NFsTJfh0
         TKEkjpXlsLCrbClBcFfVLSabK/6uWO9lP3PnFzJHUoyinPhye434Owl3a3sSk6nhjTXv
         GbD7NVpZXFGmP+0W/cdD/JjFmiq7Pi81+Fox8Lh4qj/aoTNdFTItvavV7JiL/86Zp8bg
         v/TQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/qF6webvjei/yxdo0HuWNGiXmuxpu93O+VOk8YOcJj/6rh8A8SU2I8SdCpugz2rz54P110wGkBxcxlqzXaLo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaekznvp873ipSKBfmwiUr+H1cdyS2J+0B3MBf1XDdCwXHX2b6
	jHFEFMTQKht4e66MNgfPo55XvUAILJNrB7ga8u0YY1m3PH8SsOMsprhIzXCQKIa13XkWTLXbOZv
	Jj+GUgIntq23FXpKK5KgG1n8Lm8V1PWn3HvPxzqACZPveGhkQ/zAbBghSYnkrOXgAlVMxlPU=
X-Gm-Gg: AR+sD13W8AaehKBCr829kjLtEtX2lInK+8lbpWyzt+H6h679Q6K7GF8PdF/bEOaeUmi
	kM1hZJM4/oKkSESsw6Lf6PhmYSRIuAFYbiEQgRbWcucsS741+93trl8LjeOHF/Zfk17tjpxsBCz
	2/wiN5eudID19IOLIO3Lz2l1pBI1yLOJ2EZKl4VY1poiy8+ImY1npQqhkXa/LPrO+8os0j3Oplz
	95ZbJ7JKAMmoItBJ/36O6hYYu7N4paeE2sWJHwgderXJJZ0JKQBtkq1NyAuRCVFnU/Qn73cQrcL
	Q/5smlNP1ElkB0njZsCd6EoxnYl8QYn99iyIdyK3+TigvJTVCZUX+h20ZAaMHCQnVI9MHtW1/Ql
	REVd0IApokCEbXACCEhigv2ILF73bh5/3J8fZm6ONXEGefvOaiSd/vKTRyGJ1ZFPQCq/Jl5Ld9p
	zT+fYTG1X+iRNN
X-Received: by 2002:a05:622a:c15:b0:51c:bb79:a52d with SMTP id d75a77b69052e-52d73c86f42mr3220731cf.14.1786560423916;
        Wed, 12 Aug 2026 11:47:03 -0700 (PDT)
X-Received: by 2002:a05:622a:c15:b0:51c:bb79:a52d with SMTP id d75a77b69052e-52d73c86f42mr3220091cf.14.1786560423479;
        Wed, 12 Aug 2026 11:47:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a548d5sm7054e87.39.2026.08.12.11.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:47:02 -0700 (PDT)
Date: Wed, 12 Aug 2026 21:46:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Georgi Djakov <djakov@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: Constify struct qcom_icc_qosbox
Message-ID: <5nhxxcayafpu2gknp6hazzyvj5q363eqooucfijbmz6oxftkjd@b4rs6snqkhxt>
References: <f9d9ab49e961b3bf3f9bad39f22cf8b06afb2381.1786554463.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9d9ab49e961b3bf3f9bad39f22cf8b06afb2381.1786554463.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE1MSBTYWx0ZWRfX3z/LOyYZvwBN
 /9BgYM+0nUmGvVamYchMaFr/nrJci2m5oD2U6RzUdOcXL2ZitFGzEX1cvzTgrrbzZwGsVVSKAbp
 BOjofR5zxrhOTU0GSbnOg+bQp4b2D8Y=
X-Proofpoint-ORIG-GUID: aQ_VcLf8Li2fLwiYwGzf3KuL6P6oaJJO
X-Authority-Analysis: v=2.4 cv=C/fZDwP+ c=1 sm=1 tr=0 ts=6a7cbfa8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=DA585B7Y4R_hzP9QSM4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: aQ_VcLf8Li2fLwiYwGzf3KuL6P6oaJJO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE1MSBTYWx0ZWRfXzdIhp43z1sVc
 JEyn98mF/gH8qN2TAVHf8mKalNBuxiqKWCO7D+Itq1LPHm2V7/0roiGmuVx0V6KRypZngdtl4JT
 oCO1p/ZmIzMSSqWM7rwCFNSIDuwbYYSbX3tjUpwNPsWT7Xw/ZVm9jJff05KFExNG5EG1RDJP7bF
 b1jKVNU6hUn0T+mUphmaKaJQXOHAs46BzKIwux375lYmexwXbpYc0cgzEOssucpN92ENVHMCAAW
 TyQqp3yy/ZSgp/uNNG8oLetRZe219dTtFYu7LOgMm9V1C9tvKcXyjhzke1N/6B2fKRIC7Xy+KNT
 6aGShP52MDiTkGdePRuL8S0I0bVYDpLCLpA3GF55uccYkpisq04lm7kzf8eHUloKMOwshsaZUPN
 foODfwHYZXp50WrxqOscAgKdSg3VHRYdu9RzhCdB8/lwBfPPnwWFIEnm3VBxdFHvr40vJaBvnOP
 6w45xaB1fRt3Me7r0uA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120151

On Wed, Aug 12, 2026 at 07:08:42PM +0200, Christophe JAILLET wrote:
> 'struct qcom_icc_qosbox' are not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    7807	  18632	      0	  26439	   6747	drivers/interconnect/qcom/eliza.o
>   10027	  20176	      0	  30203	   75fb	drivers/interconnect/qcom/milos.o
>    8768	  22640	      0	  31408	   7ab0	drivers/interconnect/qcom/sm6350.o
>    7626	  22000	      0	  29626	   73ba	drivers/interconnect/qcom/sm8650.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    8095	  18344	      0	  26439	   6747	drivers/interconnect/qcom/eliza.o
>   11079	  19120	      0	  30199	   75f7	drivers/interconnect/qcom/milos.o
>    9668	  21744	      0	  31412	   7ab4	drivers/interconnect/qcom/sm6350.o
>    8746	  20880	      0	  29626	   73ba	drivers/interconnect/qcom/sm8650.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> ---
>  drivers/interconnect/qcom/eliza.c  | 18 ++++----
>  drivers/interconnect/qcom/milos.c  | 66 ++++++++++++++--------------
>  drivers/interconnect/qcom/sm6350.c | 56 ++++++++++++------------
>  drivers/interconnect/qcom/sm8650.c | 70 +++++++++++++++---------------
>  4 files changed, 105 insertions(+), 105 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
