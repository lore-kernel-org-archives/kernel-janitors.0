Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F0522129B
	for <kernel-janitors@vger.kernel.org>; Tue, 24 Feb 2026 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929308; cv=none; b=a9+bpxbDWN3eX3LCetpNmR0B4RuDtUGzQecJK6+1CNcaT4AGHWComflhb/SUZzq2/K9NAQbjJKo2a8zjIWSKcs8rKDHWqBUgtg78usdSbxZW66oQDMgwh8wIusXTk4PJGwYd4i4iz4/l65fX4dCmFhlRSy12YQtGqvZVjQJDyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929308; c=relaxed/simple;
	bh=7xEZa8uoAbhMwtXaqyajIqhfNmpR/ZMNvcan+/yRrF8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QkL20SHOZn9Py8L/6qc2S8MJWtNu8b8PRHq3e6TLOmZhqj7HALQYrgrXf0qXomR3ApOVrBu0ZFhoUi/zuiNJjWmk2FTHd8zU4Md9Sq+gVlHvTVqjl5wsoOrK8bnQyHaHESiDiEFm8Nh0+5soDxIvEyI5E36DVboyE6bt3iq/8mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HS8bdqGS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=am9XrAlY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HS8bdqGS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="am9XrAlY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFdie2512900
	for <kernel-janitors@vger.kernel.org>; Tue, 24 Feb 2026 10:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1UlbTvov6ijl612swotAv5UsQX4AvuOmCO2c8PY7QI=; b=HS8bdqGS9AH/OAK2
	b5+T9NOOiFAWCkH2foE79pNIhFsDGpffpDYs8FLEQ6ml0HRxnQPZOPSQES+44Puq
	5GMogxmSEISYNK7Q4JvxY7BNj1w739g3sLufN03k1nvNvcsKJy2Px0FYGtwqFT3+
	JVAQfLOL97ei+t4oxrQMSpExj+lJaQ7fN52GY4NGncsRfe/rk68ewTaqq1iuNcgu
	tpKglna3LwDgB5H6RT7uh+yutGlXvdIVB3s4lSamNh1qt4lUQaK+brklyGjYXs6+
	lMmMjZd2vnoy1I8JpX3+WLZt1scwsYrCaztC4aw6vo3/rtWxGWIZKrE2Fcjhwx6+
	XXm2Sw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn81bwyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Tue, 24 Feb 2026 10:35:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35301003062so39538389a91.2
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Feb 2026 02:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929306; x=1772534106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1UlbTvov6ijl612swotAv5UsQX4AvuOmCO2c8PY7QI=;
        b=am9XrAlYmiGgydK5KwA+epVPyp0UjTKk7TfJ8g9Tg7DjeAJ+EXiqc1DBD3BHGWjINt
         ASay556I63QZ+IYSWm7yUfn+XSM95FGPSjOdUGjL+aXHPIP9yGdVPNrHwOOLhCJR/qj6
         nlBfaodRGMUGjZoITgUhqfLWJvYVM243L0Qr2WRAcO0UnHX3mucCBA7twA5Pz0sRrdrl
         EUr2izXjiNMenMtkkRaVjkvpp/oMi836T0FeIwrvfCfuEfLl/0+pRkyXy8h4BoXtLMKY
         vsDKKDsc/918jE9ooqBq8ESQjEIRknIa2u2r22/3DnRMDB0bZ/sJ0ao8u4S65KKHS/MB
         o5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929306; x=1772534106;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M1UlbTvov6ijl612swotAv5UsQX4AvuOmCO2c8PY7QI=;
        b=QL+jrNT0+MOY8F7tY9h2Boidu2/sAcOb6n6Aa6evo3zrsyt9h1gJEO5msHyybLJ+nf
         5c82YabVPpr9+TU17qPgniotnITO1toazdVwP6YPzCrBBkPJ9cEWW+3fovj2PnOGpICw
         jo7PWrEJKVQMdFwTgkhMPfEkBwhWas4cVYKT8jn4qka51CnTNpN+I/S2IDSxFfnbZ0LO
         qSiM7raLH618lopd3z8O+r9YvIxBH7LGguwMeHuhdu7cqOdxmIPgTlpLWlHZVHIdmh1z
         8e9VXCXQ7VHTWFB4PLxBOuglM+sVf1MUbhwq2gd6nhaLHGMC0HDxNVHT6UZiAwbzdmyE
         +jbg==
X-Forwarded-Encrypted: i=1; AJvYcCVSl6gFRrWs9CbG24oCU8oTR9wxRFOjtjs8M2lD9ky1kfshBMh5E7By2hJe0jF6fNb0fmM9fNKROgZwc8rDKVo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk27DZHJee6MgYZntotFlFlD5qcTIQfscPOztpPY+CJ5wVGE0g
	MTXqtrtNfM2GJ5fc5qvtN2zfVanx0c706kbR3bVKjrlnrFWo1In3XN0hIZQvCziQXSRa6faaq/C
	wPYHC1aGZcW/wdqTzxSSlO1CJhReBgXVR8sFI4gcr0beE9JUCbylXTQ0A4zR5HW3JhZPWkruEYK
	fYW80=
X-Gm-Gg: ATEYQzyIqgJ79ys3fSw2DkgrqLXvq1vh90Qrhw7zOO/GgCEoqmJfEzC81DjOhJysFRM
	JpvZYc0JWXbjElRl/ULLwTBLMEzNZg+154BSe9bVtzcypY/PAJr5hdDka0y602/I69qm/gYupYw
	FitwGOjCWP48NzlRbnalHWYrCKEWZ6zmWrSCXj5krFYtaMEEh/7yZYpwjSWDbahrPxpBEGiuTMq
	Y9XlT9rgez1bbYFVokSPblB89hpwnbKbBDApn+SKIkVSzLwpB6pgwilBB86jZjzjprP1ce+YLy5
	aq2SLbt0Gmhp/7iZDl0ZufdqLqAr96Gl7biY1gKdzzl7e501D5Mrj+MCnEKTKfRl+ztxyhV6bz/
	rt0+WH4ECPFp9XEVFa48IqDw=
X-Received: by 2002:a17:90b:53c4:b0:354:a546:5edd with SMTP id 98e67ed59e1d1-358ae80084fmr11717601a91.11.1771929305541;
        Tue, 24 Feb 2026 02:35:05 -0800 (PST)
X-Received: by 2002:a17:90b:53c4:b0:354:a546:5edd with SMTP id 98e67ed59e1d1-358ae80084fmr11717571a91.11.1771929304954;
        Tue, 24 Feb 2026 02:35:04 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:8fe5:3076:bc82:a67f:ae4a:6d25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358d78a9dfesm1374205a91.0.2026.02.24.02.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:35:04 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-pci@vger.kernel.org
In-Reply-To: <f1f05f1c10c6caf37dd620fa12f508c53536996b.1765705512.git.christophe.jaillet@wanadoo.fr>
References: <f1f05f1c10c6caf37dd620fa12f508c53536996b.1765705512.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2] PCI: endpoint: Constify struct
 configfs_item_operations and configfs_group_operations
Message-Id: <177192930173.12333.7729769734066192636.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 16:05:01 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: anprwi0V7W81k6rCTz4UG7bHgSeT_hRI
X-Proofpoint-ORIG-GUID: anprwi0V7W81k6rCTz4UG7bHgSeT_hRI
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699d7eda cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=nO81vR3YHEYIzYpkiMgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfX+dXCzCsieNWb
 dSpQJSpO5qXWJZ9A+A2FKHDADdLoU81PTc+fHwrRLLZYlfpIOJZ7ja2CP0v9jF29c3G6essHqA2
 ig+QP3IIxTFifbdkIJW7YEm5c+b5UFDvRNRSKIT+m0gvuR0xKv4dCdpkuiFydTnJtjalbYY+Ojx
 QyaqYnwYTTtGBSPemHOmGzjYyS+3mN6ywA4h5mgttwDzSaXV/Z/5re7eo1+TWkPoIscwlr9K9p7
 qXeNT5zw+IpCUEggN2iRpzAvn9a27drJZftJIvh+ePRoTn6Ps/JToia8P/1NoH/+1QndDZaAYw5
 MuSQCQ6Ea3L+cHlx4K4cHbKMjndW0hJ4JzBYCjYElR5CqhHkspzWBaxLvb8HzZ6GJOsJu48SWrJ
 S0NwibgH3fQMcTqPvQefeAeMlv5tu7alCo7/B0EV/riYUEB6vbcru8X63lA9N0oH9On7YeQmkT/
 xqoPCpp9UVqkAips/uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240087


On Mon, 29 Dec 2025 12:13:29 +0100, Christophe JAILLET wrote:
> 'struct configfs_item_operations' and 'configfs_group_operations' are not
> modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> [...]

Applied, thanks!

[1/1] PCI: endpoint: Constify struct configfs_item_operations and configfs_group_operations
      commit: f457c18d7904b22f8b6a9c6475161810085c34c9

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

