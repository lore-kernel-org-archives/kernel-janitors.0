Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AE920E6F7
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955902; cv=none; b=bAE/6oRMxTtZ8w/TBAOylcsl5/gljkP9bAqoL931YrBYRFz4Gz2WAAqthrlW4pi5ph2x8lq6DpTtymf5TDRloz5ftNgpL+WQdXFMzBfWcMvA8IuEFCNjwrLiBtA62szJnKh+fZUon2N6YNi4tCUB4m5+jU5o7A2RSNumAcF+ydI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955902; c=relaxed/simple;
	bh=otmGiPyRcsaRheCI210PDw5jFdN/YH8ewWhEyPAqHN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioxn075MevEq3opAUVf68LOzwxf0k0pwZSQGZerItuqcL1VVBLS353HCVd1w1CRynFvWCzjMdGDAeWBCUMfA11UcSS2X2HB0EdZ9exAbrzdWpX1Be0AZ6077zutp/LAyJmPF1/rTwqPBuJWgg8jX8OT5eIpSlus2ZPYdGkn2t/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxtsjcMA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxtsjcMA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QCOU9T010573
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 16:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ds5OIBbeNrEMt6KG9DFB3gNzCj+lz0ilvqEPiQA344=; b=CxtsjcMAZ006oS80
	533AEL//NhGDYWiQFz+DwVSvXZ2NRcM4DbBX5KhjKD8atNKwTTw/88uDrqkrDQFq
	CSRyzMfeiYRKQfJzhEGgqxPR3XJDACPMaXdCN/dAQ2Ofj4WWwJCD8P49lM2vyaNp
	wH87FM3YdqpNDe+dn4ZlVIqLygRGdcRT57qzEC8OKaj1wBtuyYrsLLm2KEIPFjMQ
	h8yOP72lw3VXNpDGYMhKhje0essOJkkLSqw/WP5D/rfM6fGARwnhJuyE/4wsAuAJ
	DXIqfMHytujXUYPNbEmFOSdt8zKS6VGnUwBr49i3LelR7qQCkcLek7gz7zqSjSQR
	ISeGFQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fds9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 16:38:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23689228a7fso17769375ad.1
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 09:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750955898; x=1751560698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ds5OIBbeNrEMt6KG9DFB3gNzCj+lz0ilvqEPiQA344=;
        b=fkNfGeOS3ynsIdykPgK/f6nGjUyzh/OtZ2mQE+IGR4k6cCPEEkyF/O60xj0AxNbp0s
         +gLh3ijl/0vYdR5TWQgmgMLnEGGUOO47p0Gcru9mOzLa9VXNtWGZVEJvCvnDlgDcYxIV
         4vaz3McdHQk7o4ZN6LDqUlcEvudREsBR3nFyDV5XbSxffOYi+XTsWTjCyj6KsDk48JVb
         m5zfL0SxvICwdALuwfzqckvUVX2zLk63LT+RiZVLkO2nEv/Q6R0x/cmAb9TGhSwzC92r
         0g9Jg6tX7j6bUkSik0xzOizwW459iioCkYWsw9KqzKhn1qSlxB2XwHtE8IQLhE2nrXWO
         ut4g==
X-Gm-Message-State: AOJu0YwQtzTX95d1N/xoImxubsjA35qYmGgCDXMn44Y2kv9z54sAX4j6
	9zIZ1d0Fv2cdLxGOc5tCXtrxa1NXb6zaIHoNGkGh98xkzIOEgO79K8MuRN97V+RYNjvYRVxK1pO
	xWr9/WPKCfN4MVvJ2m5romK2BABcpmPmRpkrgL+X8UPfZK/KhMLlezabJvPaFRdqjQrSUKP4=
X-Gm-Gg: ASbGncv34xCOhuGuV5CrPDnPpYZGoN3EykV2F0E9kbxt8Hhq5iHVcmz82S+nT8cMQBC
	ZMuyO8/JI/FqcBr2nSR3eLwcBtKDSlRuGcHftvJndH+FB7elVOymfOhqidC45mL9+uuwvg0c73a
	qFjgMe3NRCR7Q6r9tClO1EUcrUhXjy98qDYFd72GEDOdYCBBEfz7bNw2nR2o5tE/27SiowDmq3d
	QAtudw2OlogmmILLeypqDmA8f2FSO+aFz0YYc3HOTxKYXG8SH8QmJyhp/+3BwcamG+n+8ggQcTR
	oThCDnDGxWE/SY6SOX8ggcp7iFqd9zwg0Ww7cumHzONxNfnADG+WcJDewFEWWCyzk9ydRQw=
X-Received: by 2002:a17:903:2985:b0:224:24d3:6103 with SMTP id d9443c01a7336-23abe462f3bmr5850445ad.35.1750955897882;
        Thu, 26 Jun 2025 09:38:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHTg5bU2RCynjfPOJov4HiYgc9/oR7gcvFmbmqvfPAlowElQPIS12aIx/PZTAcUpaQOcITUA==
X-Received: by 2002:a17:903:2985:b0:224:24d3:6103 with SMTP id d9443c01a7336-23abe462f3bmr5850115ad.35.1750955897475;
        Thu, 26 Jun 2025 09:38:17 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.255.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe3daf4csm2003995ad.112.2025.06.26.09.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 09:38:17 -0700 (PDT)
Message-ID: <8625ddf5-d362-cffa-efd0-0ada8e547700@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 22:08:12 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH][next] wifi: ath11k: Make read-only const array svc_id
 static const
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250619082010.1834109-1-colin.i.king@gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250619082010.1834109-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE0MSBTYWx0ZWRfXwth+pXMweDzj
 7xFu25dJf0+eNJulWABSCxXq5SQN+u/gycG1gpb1Hjm4s6R/kjJ6Ts3IUswdNyzZ8l04uVEtimI
 yi+2imKU0AWzO1Z8EwGN0npWEbpvlg9lTPimR8AtLsDjlw+0c11mZngHOJwI3KXAhaooxl/P/uZ
 xOmhBpcmj0FI+hRDGeB9ZuwJFlGq8OUGj3nb4q2WNIngbqlQnCpgohXgJ/Ii7ry8po2xVtjRwvX
 uSzPRdzPsXMKghZ7sCzqC4QVTInGWKIuWpxsirGov7byYERvMuSc/w2FG5Ek5SBHToPffMEi4aX
 svKrI5YgIn0YHbNmJnjyuHt3ZpVmVKL9CYRtOZZXLNffwduxP8yjj1qYkYxP/RXN8wi9ptLAvC1
 CiiThMznQSPkRLeXugNW4rAwyPiE8Hdl6JXdXmmo7TdoL081fKeJeJw9JA04IhrLVMyoZIai
X-Proofpoint-ORIG-GUID: id9HEAcXJH9E08I6tcHzA66apljou2Ai
X-Proofpoint-GUID: id9HEAcXJH9E08I6tcHzA66apljou2Ai
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685d777b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=/xG1ZwzdjF5UbGEDupzz2A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=8b412UgErZc1wa3ZSjAA:9 a=QEXdDO2ut3YA:10 a=LXDWoPVop_EA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=778
 impostorscore=0 mlxscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260141



On 6/19/2025 1:50 PM, Colin Ian King wrote:
> Don't populate the read-only array svc_id on the stack at run time,
> instead make it static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
