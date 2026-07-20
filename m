Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96258272E6D
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Jul 2026 01:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511894; cv=none; b=tjALbtnqQ9pSueEHAQPRYp993Orfvx/sLH4kFix7vf7J23DsC8MkAkMili5GFPapGkW8/fFTZm7eUxPJszes8OGoeCxx588XJ/LbcsIr0EyRr640/o2/584vqbvbhemB8Aq0Xryk2amQ6JxedOYu6ixXhlQhdpxpJRqeoU5XVNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511894; c=relaxed/simple;
	bh=iStVGvWn8peZsqiqAMgO1DeCCaqU6NDwZ+ll0MQqFSA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mq8a8SRt0VZUyQetenrvmM5yI0qc+Yhso8nVhvVUGLzWlBqMLWLiqgcSU+YskT2/pDc6AXKL/4IthES3f0EbK1QKLjjHv3e+jDZgD31hcJXK18i4/abuVODArNj5bH1XBrQYCg1X3phH7Y8IJIxktflarauwx2JXxOXthNrKuTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnCPvrmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CH+xnHMl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnCPvrmA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CH+xnHMl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNt1CF757341
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Jul 2026 01:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A80KOCLG2b6sD2R8+bULxsxxaaO8AzJe9I4MDEg+WNs=; b=mnCPvrmAqXBfWRrp
	wZxN5vjL4ldL9SNJk5wkxlmEyduN7s3uSfSytSGOwNO9soC6Lt8puw9fx69VhIL1
	2oxRnt7V3Kd1U3tTKB+wjXGtR1vOMgKyY+AXg0V4S8+6lT9LXCTUw/QDLp8wup+G
	gMwMKdvQXVkrBUkU/Yg28plTkoG1aHNWdMXapuyT0pA22hydksATTsvNBWnGyzVQ
	w+C1Ns5fyswf7yeKM4Q/TdT8k+GI2YBOjzIKES0aDFjrFhzHdF9FP4phYuRWoriT
	ZE1dRrPp6jJzriQh3lL6x3GtJ68fnFf+AZsGPH3aMotejfEf+MnqqqUmwLhFagbH
	k6GOLA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnkw0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Jul 2026 01:44:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8486c3411c8so13163545b3a.2
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Jul 2026 18:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784511890; x=1785116690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A80KOCLG2b6sD2R8+bULxsxxaaO8AzJe9I4MDEg+WNs=;
        b=CH+xnHMlh+/NlFN/HoA082K5nRMbfXhs1l5Yk60SqC3CjgfQjJwjlGdjYscymXZ7uZ
         AGMITNASCfRnTI/gNL3WZPZofUIAsKlDBLeb81boZ1pXSXdC+Uez64FJ5DEd9dehm7Zq
         cWuDj2nVT6rbD3cutA5zckvm5s5vU9sceHiYn0emTZv4AHiiWncx+rOcdtQCz3Ui8rtO
         ljspCx0Sb2ah4/ZWNEezxwc9nzchO9LMztzieibZzY1oJTkx+/ZKbNmFiEh0xfJctWVX
         MV01d2fP7KnDbV7bFcHVmDMnot32LyVi8mRrqC11Fcs49NQBq1mFLU44jikDJ1sx2fVg
         6I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784511890; x=1785116690;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A80KOCLG2b6sD2R8+bULxsxxaaO8AzJe9I4MDEg+WNs=;
        b=KAnItJRxTzEWSFh83UtX7tVkUhn/5SOVTpclvKx7HNHlIwAvFKnIy9dkqVjZWeXJl9
         rguZ8iTXPCkM1irNvnLUhfK5Yfx27iMvB/UBPOI9RYm1MU8O5uTmlEn7aCCaWKSYGtk1
         8vCVLmLm0jiONouGCOybQVCWGhNZRrsUgMsYewztYJbnqTo0tUW/WItHzYdwfoO+mW88
         eZUDg5iyUAjF99QAgGX2h7ErV8t4OopPgz1O4KcvscOw/dKRy3NTD+iN4lItkA6QNiYK
         k5hkraHejX2GNIsdCt96ohB8gRPj1bB0axuuwPeN6Ga8J9DSJCeNKyHEkGkaWxQpSI+n
         ERjg==
X-Forwarded-Encrypted: i=1; AHgh+RpmLB4jDTuEWZMZ3rAS/VnkOasa89bCJL2IkKsRXW8JW4XAAVY5ecKzjYptgWdTCMA9Hqg0Xvb8Vw7zS8005hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhCnH5gbuxGq2tawkQvW5/xNKI+q0jwXD1hJHpc/zab7sa3BFJ
	jjx/4xe8+GHyZOT3zq2X+hK6QLs6hTyZdsdCQbVeEbuIQAP8gbqMvU/nLL60Oaha6fkzCBzoqrN
	BMwsdqLq//SV9/27RkFWDw0SpkEjDGBJIxyCftBoavWFKUdSFhjUrfxMLWT+Ab+p8+Afl4WM=
X-Gm-Gg: AfdE7clSkK4sZJMTpxq6YIPlk25fN4cY1a7uv5uQZHKgaNKJ4L1w1HSa14e9kfFtRPO
	C7VYRimol4hKUt4IgXJzrqw7Ddt1gEAEx91i8HM7tjk4Yh6F9Bzs4xgCQziUpiYl0KuB187jMWy
	jdbpKDmTOdwJPKkqqQ2jPtVyVDFoZvwuFo4eetGq0VqmP5KTtLTbHukkCc7QLUhZw8vRDfAKzq1
	WA3cPaF2IhFgKdvblJI8WmfzyNjeQEUT4rPHuD2kyg4UkItM0vh/rT3GKr4xZ/+xd4Dbyc86qnJ
	wIXtRIhLR3hm6pA4mbTk2XfV0H+msfSFoP8it90ERj7eTIee3XZoFNwoQCtLQxk9HSc2PKoGVJA
	rlpL2RGDw9hgVuG38
X-Received: by 2002:a05:6a00:1945:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84c2926be85mr12085644b3a.13.1784511890209;
        Sun, 19 Jul 2026 18:44:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:1945:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84c2926be85mr12085632b3a.13.1784511889749;
        Sun, 19 Jul 2026 18:44:49 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c4b640050sm1946332b3a.45.2026.07.19.18.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:44:49 -0700 (PDT)
Date: Mon, 20 Jul 2026 02:44:43 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: "Colin King (gmail)" <colin.i.king@gmail.com>,
        Dan Carpenter
 <error27@gmail.com>,
        Duje =?UTF-8?B?TWloYW5vdmnEhw==?=
 <duje@dujemihanovic.xyz>,
        David Lechner <dlechner@baylibre.com>,
        Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] iio: adc: make read-only const array config
 static
Message-ID: <20260720024430.2d1359a4@jic23-huawei>
In-Reply-To: <aleRBRrht2PPuHWl@ashevche-desk.local>
References: <20260714165012.184651-1-colin.i.king@gmail.com>
	<alZs-uLJug_rnRnq@ashevche-desk.local>
	<aldfaM2aks7qOz2C@stanley.mountain>
	<aleL2gmDZDJRhjVo@ashevche-desk.local>
	<58361942-9082-4778-a3a6-cd0bc4034644@gmail.com>
	<aleRBRrht2PPuHWl@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dX4syVYvY4AEUxxYZM_FwlFo9n67TGwA
X-Proofpoint-ORIG-GUID: dX4syVYvY4AEUxxYZM_FwlFo9n67TGwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAxNSBTYWx0ZWRfX8QFSFEYBiyaT
 WOmcUzqXzHtw3I7f+l3FVti2u7oams/ehi0WgyynNzTj8jebHWC/N2UCrr2LBaoEaecEVhq5RRS
 sYSOqEN4csGWb/wFdMzC8abNNoWOAcRdM9GHQjaP+hMIKNGn2CZwtjO4SA3Rl4XzmRkXryn64cD
 FqEIj2rZJFry1rmqEQcBWU6thIFsWh40OZHsUInvJGpL+mXwVJ8sJwwb8OD4CYSwPz29XkoEGBe
 r8GFLIMpXVRuy5oTG/XcPRzQfoqjxEG2CZN3prF1e72NI+vhe0GSXdpazvLkc7lXazrlEGsJu0j
 kqaRvHWXXVJr+lOhT0BIz6RiBHQBYtuR6fan2dcLc0eZ+E6lajgYecXv3ly+ycj5kcguwJdrUGh
 2OL9SjOUyfgutIVN/RyeYhilzkpk/yUNq+7t0r/pqju1c9PF5AowyMgvjmJ3syAM7nRnrdgGT2n
 XPVPlEbkhA8+aNT/X9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAxNSBTYWx0ZWRfX+/sRUYClH9Wb
 /mESK7COqLKTg5efpuEtI7Qrm6ruoWekf2Pr+oCdpy1qaolfCkWqGVg6AYA5gmQ9Ux1bbQtNxEC
 bo5jQyJVmKPqyj9VyPtoOz09iDoElA8=
X-Authority-Analysis: v=2.4 cv=YsQ/gYYX c=1 sm=1 tr=0 ts=6a5d7d93 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QyXUC8HyAAAA:8 a=Y5yDRIdPUsbKug6gOGoA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200015

On Wed, 15 Jul 2026 16:54:13 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Jul 15, 2026 at 02:34:50PM +0100, Colin King (gmail) wrote:
> > On 15/07/2026 14:32, Andy Shevchenko wrote:  
> > > On Wed, Jul 15, 2026 at 01:22:32PM +0300, Dan Carpenter wrote:  
> > > > On Tue, Jul 14, 2026 at 08:08:10PM +0300, Andy Shevchenko wrote:  
> > > > > On Tue, Jul 14, 2026 at 05:50:12PM +0100, Colin Ian King wrote:  
> 
> ...
> 
> > > > > In all patches like this it's always a bikeshedding possible of moving static
> > > > > data outside of a function. I have no strong opinion in these cases (when the
> > > > > data solely used by a single function), but in general it might give different
> > > > > readability experience (it's harder to notice static data in the local function
> > > > > definition block). So I leave this exercise to the maintainers of the respective
> > > > > pieces of the code.  
> > > > 
> > > > It's an interesting point...
> > > > 
> > > > At one point Smatch didn't track static variables and it used to
> > > > generate occasional false positives.  And it's like you say, those
> > > > little "static" qualifiers are hard to spot in a wall of declaration
> > > > text.  I've never considered moving the declarations out of the
> > > > function scope but it might be a good idea?  
> > > 
> > > Maybe, as I said, I have no strong opinion here. I am all ears to hear
> > > what others think.  
> > 
> > For small arrays it's a moot point if this type of change is useful, so  
> 
> Yep, it actually becomes a trade-off between generated code and existing data.
> With a small difference that static const may be located in ROM (important for
> the embedded devices with minimum available memory).
> 
> > I'm OK if it's not accepted. I appreciate the feedback.  
> 
> Me too.

I prefer not to think too much about the trade offs and just assume it
is 'mostly' worth doing so add static everywhere like this unless it's a hot path.

Anyhow, I've picked this one up.

Jonathan

> 
> > > > But in this case since this data is const, the static vs not-static
> > > > doesn't affect flow analysis or readability.  
> > > 
> > > It doesn't affect flow analysis, but we also have David's point about
> > > amount of data to be static may affect the code generation.  
> 
> ...
> 
> > > The main point I have is that stumbling over the 'static' in the definition
> > > block might rise some additional questions and slow down the understanding of
> > > the code (by reading).  
> 
> 

