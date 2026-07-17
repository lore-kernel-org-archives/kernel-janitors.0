Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977D742BE80
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jul 2026 15:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300772; cv=none; b=N3stSgJVhrPLLwJkVn6aLz4C8pM92VzeiRx2JoT0ksy3OZrklvoQ0nsZouzrJyKwrv1+NLe4+4S7bYKSVoR+8rTwrGMO7ngPcVWw21jccdz24dWhVyckBWtSZIujmK4imdg53drDSKbjF5qFqQ/19mFUots5lY3Ln14crMizvOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300772; c=relaxed/simple;
	bh=9VkWsm4QRs9dUSd6/6dOYCgQXmhzoHK39y/6eyAkwfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E3YkkDzi0WWiKgJFDLvDa5sIyz1e81Irqwb4TezJxfA8595Gtp0Os7aeK96+wlpitF7r0jSaTkeZsfRtCKzgZ6Xh3bWMQ9W1mfghsYyXrhwhntSgN8AGCvr5DVHthAFNGDCOHjHrEe3Cg3X4IxOc1lqWpCw3nHfQyLDUPt9quA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nA3Hz/z8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2ogfWs1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nA3Hz/z8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2ogfWs1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7gsW3123290
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jul 2026 15:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l4p3TEGAo50xViMa0mLxtrvMyupxCIU52JinKAJuBPQ=; b=nA3Hz/z8glHnVomw
	/n2fAZX85ZjXPngXvYzPTv4qtmvLPj5Tr7Dtr7Mh/J5HqOQacM/ZxWHS6Z6TeC+5
	Hp4bXR6Fmx/+YJupAAIxFmSKOaKm5KIDDIObD7aZ2ojuULLsg4QocGZrniM5uRCb
	vy5XpmBjXxzujYOqV3tm1AqG39J7IAHMAx/iMgEPgmxdGD4OieKKIKACwYsCvwdw
	Kg69ELGMmKqC1XLImEMLHqEgLJGjoES7Itf7sX9Tm7nQGnkm5uhMbml6C4S75axN
	CPXcmpNl0wzFw4imPUP5TXTf9XR2KBxO2rnVssUfqvosM4GtlJpLmsHxRUfmg4qT
	UWXPwA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6mahk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jul 2026 15:06:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so1383514a91.0
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Jul 2026 08:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784300770; x=1784905570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4p3TEGAo50xViMa0mLxtrvMyupxCIU52JinKAJuBPQ=;
        b=A2ogfWs1wcPxeDsDa8haOqo2lGr4ps2lpJVDhncuk8uGCzBhP6O3AIyOFnxxq9dEnB
         e55xkJsWjHXiREP5SnMDXyeykIT/1EqfKGlUMny6LsW2DCHHQQEGU2vffM77pzN60xWu
         H5/DlMJFU9u2spRFkXlotq4HM0ej/v7M9/e5KvQ44h1vpdNNSGSr3cEiSWM5yJl0DJzC
         3DCLzvKN9EzCrC5fUQkpLhwp1kRuQDOuKZZ2WsxPfKkTDzalxhLfP245MgEv2MI83gwt
         kP72Gkgia3WQ+wLlTzgAEw9GHVcnuiXZfFbLlPGX0BQcdOf2lkFW1o2GNqn89d8olY2r
         yidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300770; x=1784905570;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4p3TEGAo50xViMa0mLxtrvMyupxCIU52JinKAJuBPQ=;
        b=chrA9h67Kws9GMrKpa9RTUjxyZVbkoa7nLQK720oOxSCByXbsGAK7w+vUqPE6Ex9L6
         XIVjPmn9D+qAG+DQ42snBzs/3ZIPPf24Xo7UGHL0fLOgULN1Kkt9UPcecTSy/3aLaDhC
         jiv39EYwDUogme0eSgFj1ETxQAP/mogqZ6Nzne+SkolMJ3RbHxgk9So1i6xZNg/9zMXA
         8XzvvNs1WEg9FSZhPZTYO138h16Z3wc5lGS7PigA3gk9friTzmfr0SjoDVmk/6Gdc1QD
         UMs7nREpklBuWf+sou9Iex4wwOgZVeaGz5YFj/hQmfW4b3JBwVqDKqNdjZyWTUFVhxy6
         +Pww==
X-Forwarded-Encrypted: i=1; AHgh+RorNiQrQGsRwqK2IrWaTpZsHa08P038Bmx0+lr1+VQTVg6bMmvwRZzBHjf9bKrQoBcVjUP7iL5wadOoU1nwwbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIi+8TtoqHUhZBmOfZydv0qk1169zB9gRyHiuGRAUgQMzX1nkI
	UaY2W2qKtgPKokjKqyKfJKbrDZNefM5d/5gVJLunLtGZ7rauoFDb9WvJgkDCrxtH9c1EBV5jUYy
	X2Am3oE4pHDaV5f9kw6omF0NFm7fZltReqA1ggqMEZ6LxdUjYaOZFst6Sdp+B8hYw9Gj77nI=
X-Gm-Gg: AfdE7cl1Q3vKBrL0oeG0oR1bJJPemhGzNRjVGUV6JZOvu3MfJMPEyTwKh3MpbQ8haCx
	bkKP8GQ2FfP5OoihTXYrV2lzEqdnCkZ7QDms+Fx5GSggjHhHU1vL4jQxnMSYleSaf/rAKAVBfKD
	lFpug+sMwSa4p3IhIMjVWk3JrpohLoY7+xWAUvkqIBofV50+lcvJL4Jy9xN0DfkrjWulPIMSn5N
	TTqrcILsRuXqvwv33ySOAjyAV5j0uBdcnAZA+/S8IZlTpqIoK5sx1/4qS7KjqbrbfQ6GSnJ1FeV
	vf/qX2NbQBV/QusohblDmMKb+kuPLAjJBlMgZCaPA9M8XAx3295jtBb4/Jj1PPPW40kmSpxg2qi
	WW6wUohUqe4BXetrMbhMSslB8YTQ15NC+/VvhlFM/ntvzvn5kS741Sa0=
X-Received: by 2002:a17:90a:da86:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-38e3d21fc15mr7255025a91.13.1784300770160;
        Fri, 17 Jul 2026 08:06:10 -0700 (PDT)
X-Received: by 2002:a17:90a:da86:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-38e3d21fc15mr7254971a91.13.1784300769630;
        Fri, 17 Jul 2026 08:06:09 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm15681190eec.21.2026.07.17.08.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:06:08 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
References: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2] wifi: ath12k: Constify struct ath12k_dp_arch_ops
Message-Id: <178430076786.128359.10643101937455909473.b4-ty@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 08:06:07 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfXyGt+CoQr/yPp
 WEo3VrkjnPSuM9n5AplKZzVirh0RycV+nRdJ8RA1MjjRJlwSvFI6/eiZtoJhHbu4Kj9P9ubbGQS
 dICjaKHj+IZksNHtEi2UKVwKuy3Ma/ckGbXGYCGQ88404M3UAwzfkX84Blp0A9Im7efZSNakXQo
 5DRvazBngFbwpsitsiSPzz1z07Qb9rZGtg2f20o4Le9eat4+kLJTu/ZhxS+PG+VyGFd1/FvLjLU
 Z9vLb08vN6d3Phe6Q9y1VZO/B7MOSdwS3lDjlWpDZCw6srVGY3ZnfvwtotzhWbvW7ZdXYaHGgto
 WYqOZLMRj0OjUcA1hMfdg+o09B8zsqtw+tACHSIgdKcZGg59XlnV02XtpAgK3VTXHU27rvuzRAQ
 7ceOD5Wzu8AXk1uk6dix65qng53ieZRkgZZC/Y2XnixpTmGNHHBr3oIVR7G3NWKIAtcaxnk6MBP
 y61sqL8Had0IBZdLqLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX5I87wCeEANmG
 8oeL5qAJ0SRouBbfKRl+9XUmZgs0u471Nbj3kP7vfU6XPNDZDRXTh2cOqlfl37l9oT/bzGnpFLD
 1rsLLyPP7SANrqfWiDkg4EWVGJw/VYs=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a5a44e2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=riUHQTvyFV0r_oIck2EA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: UN6AValKRc0URFfD6eonbWDmKb1kAM-M
X-Proofpoint-ORIG-GUID: UN6AValKRc0URFfD6eonbWDmKb1kAM-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170154


On Tue, 14 Jul 2026 10:39:14 +0200, Christophe JAILLET wrote:
> 'struct ath12k_dp_arch_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    6318	   3384	      0	   9702	   25e6	drivers/net/wireless/ath/ath12k/wifi7/dp.o
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Constify struct ath12k_dp_arch_ops
      commit: ca435fd0650ac512ab6c5bdfeb90ed130b8f7574

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

