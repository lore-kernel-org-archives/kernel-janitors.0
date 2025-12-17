Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0C7134CF
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Dec 2025 09:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765963647; cv=none; b=V8KITuBWjsLqPzenD/li3RreNiM4NV8KDExwVTwihMGMYw8UEweM6KXovQoE7ryCkyfkqjCoKCX4fVrJ9cRdOVXl7CO/EYzfBJaQa9mb2tGDnKaxDl0ZAHwBJ+ZbzutEheWJaVhhtSoRqc6z4hPB8XY+Qn8YyszT0q6ZZKc94jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765963647; c=relaxed/simple;
	bh=CzLpVP8GGJq2E1HVq7Z57TqBgRuwA6apaVgbWCK5d5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ba5EBkraRYuW15ToSke+sbkUdeHD64tc6jzrTp3SY9WGGeMWRGBlTQ/4gf+5QfAF3zCQjRo6mx5Kb/UCk2c2kX3twuYnHNvxBOII29IKY331vryS6tJh7RFsHcWUqW90K01ssiJiYNv946oakA1utjUPUOnfPEpSTVLb/ftpyTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKC1d/Cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7VlebX6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKC1d/Cc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7VlebX6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4XPvU2316092
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Dec 2025 09:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gtGPMryLQZ3kqDpBA2QGBVLiJOcv9DgXENOLBJG/aOY=; b=ZKC1d/CcE6CHngBV
	oGcaEpf9tWrb6NIe9uSSPsEMMSebCoDfG28RQbjRWn07oY6QK9WocS2ECmmw08rA
	P/iosGyE+y1jgYmYfqGIuBw2aXSPAaPdS1/eAopxltVcEeuh68OgASq98HgfxIHt
	FCLDrRwQ0wCfSLDya1ey5CYu9yGd44jMDz2bljBH7QSMwx14PT6+5T1v1CzVraaE
	54uJ40IC64eCGupKkMmbnO0YpIwGUWW6KBGUTkvPQRKA/oCdmqc7MzeJXG/15Njz
	fpHnxUqAlCrrb6blcEpMzvpkZYfjynsGN+jEiXTVT5fZpUldiT1zHEgcyJFNZXHo
	BqrHOg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkgx85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Dec 2025 09:27:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ceab125so127390951cf.1
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Dec 2025 01:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765963644; x=1766568444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtGPMryLQZ3kqDpBA2QGBVLiJOcv9DgXENOLBJG/aOY=;
        b=V7VlebX6UBLqQmSzIds/K1SC3PmRnQEisWqk1Wxg+3Yy5smWmU/9OfhHox9J9Fnrry
         yQlE6HKWq0kOjSH/WC//A9laOhJuG4YEtUTvnWXzW3LiUjZazmxyoNJub+TpfacKRmgz
         sJhlEhxpxutesog4SkRL8s9/suE7Mw1bc+dEFrbRHiktudfgB8P4T28i7cfm/4G7MHR0
         BGC0rKb2x3y07qFiMG1ZCr9QW1usW5Y4/+oy4pp2grsG8ec4QKd8C8OPAzC0oSbd2aLC
         AKyAfZ3LVly0dXjxFJVD8IHKkRW44hJmL6mn6CDSZYNDkdMVmfRD0FNjsUA95sFJpbm1
         phjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765963644; x=1766568444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gtGPMryLQZ3kqDpBA2QGBVLiJOcv9DgXENOLBJG/aOY=;
        b=O0WE/QaIuUH7AZTRHUoNejzsiyLIPnGInm+z59md6eCitKR1QP/wwuBiwj0TZbUeFM
         bhWOMQYm1i428Fy2y5Od1XpjiL3rgLlc4lU2fECTCefFv0I/kahWChJKBq9dSrFjQtQj
         4UYKNYy7nwD+WxBrV0qtA4NGAkD6XmrHrAyiyAnhjci52y4iuJhvZgBFPNPaG/SUnn3O
         IYvWCdSxTMJ1emvyAX7WG/ibrc0Qb9KO3A69UMgEdDMdva7tWaJqkjfu6kI6aU5pPk6M
         73LnrY+8HjxfDNfSTKpICsK/98cYJ+nSIY/a90yvM44nXVO0dm07Lb0arKEL9IfkshUa
         r0wg==
X-Forwarded-Encrypted: i=1; AJvYcCUTU+Y1HiccFFeUNidB3ObAGvfEVIw+Am9ntyuDxLd7ZcBdqHQMKwQMski3Ec377GAcQn8MktAklKA0XhkCjPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmrr6mYhmY/D9NvofOtYbCL2qz/hhAPyvkmWt29kfyjkb8+GdH
	YCWHokLaO0hiRcdVXlJQTtk5YxxHEQOcHzGo1ba3fixwkgY34hV7Y5AZLDp1lcZVzMQBV6rm6zH
	EXM2X4dzE1lnaNt0QPXieR0zTqi257K2AsXLfPoXjshEemmPUOzlM8GqtzajEh2W5HKuTvPI=
X-Gm-Gg: AY/fxX7fkiljo3GxHgLqH1CUWyrcljnRO8gyRxAjrL8TObaPR9Ls5bIxceflFH6/MNy
	Z+wY/aEDin5nbTDBI40LtFIctd24/nCT+gVTDPuaHyOLcVE3ldyaFsahv7VHRL59GZ+O87A++Zn
	MhDrtJZAJMIKgAIRAqQY1zHHuZo1+E8PvWe5+JcP9a2idVXtAwuVL1cS7W4zW55Ln4IE3+NsVIa
	t0pXsK2ON+E8of360rNQrvpuwAXL3PlTg2NkC8wMBPe3aZJbh2PQsflKOutVJeadoIbX/XF2PUE
	xp+wFQHPwDNgsM5a/9peqRaVYoWTRa7Ecj8Vt2zXs7zd6NFbkTSi3SeT78aZaUdoEfmv415bTUk
	U4rLJ8IbvEQkZfdOMhKuTMIclr/mPYvT7T6w=
X-Received: by 2002:ac8:7dc9:0:b0:4f1:b6bc:5833 with SMTP id d75a77b69052e-4f1d059d469mr231640281cf.54.1765963644213;
        Wed, 17 Dec 2025 01:27:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnaqLLXKxD1shjTXJI4BgYnZGf4hH5r/VZzJHeKQ0o7E5zlGxZ+91cNSPHIQVUUg0AXdJV/w==
X-Received: by 2002:ac8:7dc9:0:b0:4f1:b6bc:5833 with SMTP id d75a77b69052e-4f1d059d469mr231640151cf.54.1765963643756;
        Wed, 17 Dec 2025 01:27:23 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:594b:272:c2fd:21e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adf6f91sm3550757f8f.39.2025.12.17.01.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:27:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: Constify struct configfs_item_operations and configfs_group_operations
Date: Wed, 17 Dec 2025 10:27:22 +0100
Message-ID: <176596364003.7779.12383830679614587037.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <ccb5155342ce6dbb89cfbad0687b448860d8e8f0.1765703044.git.christophe.jaillet@wanadoo.fr>
References: <ccb5155342ce6dbb89cfbad0687b448860d8e8f0.1765703044.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OB-Xlhy2l9ZC3L4qBphnBCDWyLGieYIV
X-Proofpoint-ORIG-GUID: OB-Xlhy2l9ZC3L4qBphnBCDWyLGieYIV
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=6942777c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=deZ4fTmgwZbTqJCxqFkA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NSBTYWx0ZWRfX6XXgvcG7ePZO
 TQD04k01Qh8VCJsoicv9Ci2owWNGQOodXAZ6T5ZTE2L0qkIIa9nEj79Rnz4MGArZXUZ7qqDKTs6
 PxBF9kJiEktSbeTjtmqIZ8r3+f8FM3LnvNXwLIZCzzJ8bBePduJSU/GQdIAy75IApbXoxNeoWhn
 ggFneT2DRXfM31m5qHNizPa2SLEshsRgWIHL9kZofcGV34tZMgNYYIHSloPejdBEZ2Z3OsvaCEU
 R4ToEDu8Jca4MvUbKtTDX3kNqHIk5/zsLKhhSaEzg0I62Xn/e9NWH+ZtiUTFpAEAh6de8L9lD+N
 Ye1jNZJE3TQt85HLWxF41M49tkrdOAybpPpx9DJm+tiVt8gpmjMqyy4TmfTmxgebj1WiczeTCeu
 ZzVk+cZG8NoktuxTvtnfFEKxyYiSBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170075


On Sun, 14 Dec 2025 10:31:40 +0100, Christophe JAILLET wrote:
> 'struct configfs_item_operations' and 'configfs_group_operations' are not
> modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> [...]

Applied, thanks!

[1/1] gpio: Constify struct configfs_item_operations and configfs_group_operations
      commit: 0eaf298143684da68a61b2633121b3deff47b267

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
