Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0462DD60E
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Sep 2025 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831335; cv=none; b=r8oEbJyZry+5w8Wr8HSEC5xxcHp2wp8Ce+9cxidZ51DKNUNznS1UEqorT5/dxT94ofNCGBA8GJMm43LsuTPNbxKko82K66Vw5rSxCnGqfvg6TX4uOFGccaiEUtJQESboZ8WrRZSaC93qJEHG4tko4MJD/3P4dVuiVVQUoQ+Yd7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831335; c=relaxed/simple;
	bh=6JPyymmvsXLgSrpKkNJr7OiXZInk91jh/EV9/M7ovDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGoMhFICZry9aiHgjff22DmxmHibzMj/pEv6xy8ehibzhJ6VYVQyMaaYSEXL0hAFSRMq0YrO97WH/QCaYFRTIamZhZEiU4O1TVLS0RTycVmI+PmIzms+h8kSPcosFdBI9EX+8391DZDoueDcbTd4tsE5XIucOPR22UBlSKDzckg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InSFRzib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InSFRzib"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqBMl032191
	for <kernel-janitors@vger.kernel.org>; Tue, 2 Sep 2025 16:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1Q8KiL2+HCUEDUShMWnnt0o3WQb0VxSpGfVw6mYrX8=; b=InSFRzibRwaNxWCD
	z/bsbdqrOwc/qzpCp0ZFEcgwePSsuq+PLnAdTUP8j91u2j+h8SouEkx0ziTF41LH
	Kn/rmJUGYCzyjdpgB8G9JZksY82Q0tkw+efOgBuKsMowB4s6buF91n3yqGFKgJgF
	WjDnptD3BZes84QXSkwiJPF4aAHW1l+gBl0ChnmL1ECDowViOFnkiEh2gMqXwQ9T
	IY+hI3PdE2vYT3jmF7RzArY24Ld5MWHgTPEH3ASGTGucJGlCwP4L4VzLsKJ7A7OX
	XZQPhRo7ljWEKH84grIA8FLHj8MNhIZibNc19nOzJEwcZl0GMYML2meiA8cYx66U
	m7if2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8rhr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Tue, 02 Sep 2025 16:42:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329dbf4476cso1050481a91.1
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Sep 2025 09:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831331; x=1757436131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1Q8KiL2+HCUEDUShMWnnt0o3WQb0VxSpGfVw6mYrX8=;
        b=BAEHPyubrK8eyz5qyuBdMi6AnvPIxkLKxkGFVrf6o1jhEVdz6WuwJmbmxN/IAoP9Pi
         dt+SXOdOt/MutFpo2+a4HNd98oV5Eb8ifGkm3Db4y0pUeEMQtNeQhdkWX+G3bEDDTu6k
         8AVjt2XsRDWNPrXYQ6u71MF67t+SSXFWsFXlMMgnFzanKvcDhSAYvBX9DJuUhY00Wc/d
         emIHgD449Q0hkR3nvp0wSlvuLKWNPM3lGBBXkWSYVA6PwAHCuv+An+mgSvqhGmqj7c5p
         2+mlkQ3pk/oTDSjWldszuJC4o4USytgcqg2z3Jhq2M4GBw+ULaS5btXceyO/bXzN3vCs
         GFYA==
X-Gm-Message-State: AOJu0YxY0rnskPhCShWf2OZ8YJ8fH8cet9JjRmJ9+emMOey/NoN0KACp
	HccMgNgHUDGPj+uZhG2BUzWi1g6QewgkoulX2D4/qS3bGQwc9TeSpydK8K5AglDEZEKe0UUOG+c
	4TktjxoslA8iAQ4fBQhWnib31XLNl212DnbQKZFNGqALLFuW49D8S3/tMtX53bAPVcabG/vY=
X-Gm-Gg: ASbGncsCVJjVl8eaXUYpuCNLsTuuRC9S+2MaQcaKYTuO11qsW9oMgU4ptolxGDsP/VH
	3/Bez3qZCwXOUpccwsfoMatKijlTWhA+u3lD29q9wdvg33ZN+5K4wTyfPjxQCZCke5UOLM4j8he
	Kzj8Q/gJ5ZX9IyERaSc1wYr//fr1GFKxKO9CSaEW6cNouiIyxjFdA9pg15ISEPZdPmF7B4Ggtlh
	Xdz1kYy6ekfTZgji3kPPdS2xm1rYyOZvSALKORkx4ZxNTSi3VD3G51ovSEGg2Cj9msUcL0I+fmR
	HIdjVBU1WRt+jx18fZlHt2L717qcOn7oXVLDh10emkc9d7KIZqiBPYv88+E1X12pacHDwms=
X-Received: by 2002:a17:90b:28cf:b0:327:b66e:a86c with SMTP id 98e67ed59e1d1-32815412c52mr16856276a91.2.1756831331252;
        Tue, 02 Sep 2025 09:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrTc8edUsC7Q5G+n6pAISt7v2+ZY8Z1MUO2XiPRAk1RhFTTNaTZFdRS7z00ZYwIpbd5J4QOw==
X-Received: by 2002:a17:90b:28cf:b0:327:b66e:a86c with SMTP id 98e67ed59e1d1-32815412c52mr16856239a91.2.1756831330711;
        Tue, 02 Sep 2025 09:42:10 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327daeeca1csm14607210a91.25.2025.09.02.09.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:42:10 -0700 (PDT)
Message-ID: <c6bfd2d4-ac4d-4d51-8ee6-b1cc4e1996bd@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 22:11:48 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Select the intended config in QCS_DISPCC_615
To: Lukas Bulwahn <lbulwahn@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Rj-UcA2dacOgGahbw7CeEoM6Q2Nvyklr
X-Proofpoint-GUID: Rj-UcA2dacOgGahbw7CeEoM6Q2Nvyklr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX3StSGc35NpSU
 yXnZPvzRWrWkn0IP3tuel+kFa0Py2BNPPkohrwg032co1BSLIn+2zVt/euN5xzjnnn1MrQPiPBg
 5+edI/MsCx0EOD3dUrbCRiWmchCI+3MZE76ZuPj8YqOaefNgODzfYwgeP5pjlnKk+PR4NByWIoJ
 WS1/8xHBJlXLXimzniIfSOtNordVm/+oxAtE7VJaNYG079llj/+oL6JW481zPqE1/ioVhlo9+xV
 zzlY/O4Q2C+UdIJcdZY9322eXDfBp9kTa9pwV9GPX9cgVl/3cgCe3x+prcLVkdDd0APEkW4fNfj
 apxtP6jh2mQpFzKP402L0CKfPA3aaRCmCTa9W2VV/kRkW5hG+1EkL0e05UL0Gc4XSgFEtKQcgdF
 yxa+e61W
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b71e64 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=+KjSowhBs1waSO1ngDLaHg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=GxmfVdM8WKu4Uw088-MA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020



On 9/2/2025 5:47 PM, Lukas Bulwahn wrote:
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
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
