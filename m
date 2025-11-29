Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C403920B7ED
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Nov 2025 17:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764437639; cv=none; b=i91xs5ryOhPwDcu6bYX9G5nouZnV543thopD2X1rBDLDWDWyZNJQ17+YKAHtL77UUxcyn9/ypB76L5e1z9uHq3npCPILQwthXj1Fzq6D3qJMB5+MKe+lTCi3MsxWmX5kSwT+I/nUs2csj6M8PVNEUSXDh4Yzf8/ATOZzIrJ7hiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764437639; c=relaxed/simple;
	bh=gb8mPZsI3i+7tr6sMf07hTDcbjPY3ezekuga2imY2F8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m8tWSDSJreBEBFi+FGLvD1oXGYLsMYieWTxDt6ahQCkPkNlIFrdNuN7KE1qaiyiQCDpiObnpHW+x4f/TNMNuMWt+u+baMxAVru4+wc6zRWV/7ngXTI0ycSGgINxGhJV8LxoFqNi+9D5GSsQLkODLRnTC3ZcWdc8V39M74CULw3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPfOtUke; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPfOtUke"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso5459324a12.2
        for <kernel-janitors@vger.kernel.org>; Sat, 29 Nov 2025 09:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764437636; x=1765042436; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gb8mPZsI3i+7tr6sMf07hTDcbjPY3ezekuga2imY2F8=;
        b=NPfOtUke5k7Af6oeX/NKG2oz9fUX0rfOZ7kG8s9y7Bi1+4epsK37Zc5ohUo/cGPkX0
         +wz21T8lJrx6/JcZV5UVGyHVO6PN8a9zLLYcJFDHt040lSwJ2IoV3X3uqjJfNXSfAMIL
         1auZJ9VWF0hDTu4U7q25tqtbwuEily2vuJ8t44Bewnlc+OFwxWypYGTRWjIbxrHQm9l+
         bZxEI8446YxP70Bwxazzo1iErww2kXfV8fJIxroH0FPnd4747hi+uxX0VwQNLP3as6LK
         i2AgBPsHaSim15VNnMx0gp06pIdoaN/6snYm/kCweJi83mZAM9i79flqiMYkC5nfXSi1
         ca8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764437636; x=1765042436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb8mPZsI3i+7tr6sMf07hTDcbjPY3ezekuga2imY2F8=;
        b=d5azsB+d6kplNaqcuE1BSnHg5Um4s4AIpbaVSvs/gaLlajs3jkh2M/c0GI/NNezA3m
         zkZdzKTcMQdZIm9JIbLZ/k09yTO8DWaPFsbPrPPaunZI848cHD3yPrS3eZ4/LqlqICb9
         c6De3mnXle/MjTibnq89dO4MYO+MHr3k8yaWMtDwaT46mGKmORSy4rvZRmG9COCmqoMV
         c7R+puX8nXMfT8I8WHaVtRXpLFBv5IannGmZvFeYZIq8py1EarCbJpWbPchiUuTwruwc
         gCLT12Uv2ohi8de4Hlj+1UiFnw2iBoqUS7wvkd88YuHejMjbxu0Zta/MK3kGscCcS1dS
         RVng==
X-Forwarded-Encrypted: i=1; AJvYcCXYoUA91JSQcDom12wb9i3CsmUgmZAWvAzCEDC3xjJUVRbEVtQMyPchMhP4CsD1bUCqiH5Hjy7z2azMnlqcdkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXmcj3xnjt0VfVCtubUzQcN35f3S0Jraix+V2LTtGhfzkV3dUf
	ZS3hBKbGClee9GHw7qmFNaf4TfoCQTbl5Dz72Dw7uzJRfXGyXoKlo405n2miplvrUv42pGMinvh
	x9whXwS3y9T1c5jJlnosPbd1IiVgcMCo=
X-Gm-Gg: ASbGncunAhTN1MquMeuE6JaMh0waBSQcT0xrxo/MT1O1Q5cGhkWYy5wvgLxFgEarLoG
	KSEYXYBUVtOEkNvFmKcymRQ0+WMAcYD9TKF/g8RdQedtwFcpMmC1OZ7DU9ZCxy6PxesPYGWM3Oo
	iKa6PvRtIGcVwkhUBUj6mULxLwjo14t1FYndKRDl8XEPd/wo+oQol+P7d+JDTLmTmxjTSVLqgsg
	MSFUW9kQAveo3lylDeXHqJ3jWqMdLoGTIXUlxUFIeJMBuUr0LQpLAbyItR8SX7M3alxhfdy
X-Google-Smtp-Source: AGHT+IF97TVQKqd4QpF5rZw3LC7DwErt4VbnYQU7X+rMmOoGn1BNPQDrloDRnIG6wiIw7nVrZXk8P8V9HT2dcIS4XAs=
X-Received: by 2002:a05:6402:4404:b0:63c:533f:4b25 with SMTP id
 4fb4d7f45d1cf-6455444ac37mr33624439a12.15.1764437635420; Sat, 29 Nov 2025
 09:33:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1605dd43-5e95-46eb-a0c6-78ff8b4d51b3@web.de> <CA+=Fv5RDbA-=WFf1bdekhheZfYScbu8J1Eud-sEgTqUGnk00qg@mail.gmail.com>
 <aSslgTu6_HQfhbB2@stanley.mountain>
In-Reply-To: <aSslgTu6_HQfhbB2@stanley.mountain>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 29 Nov 2025 18:33:44 +0100
X-Gm-Features: AWmQ_blXJLKqQt2Z7fhU_XKZ-vP-poW5knLgf4NBLeti_sq9o-Z362H1NN8Ndes
Message-ID: <CA+=Fv5Qm1g9JFaeVXDjXRgW8BiPCbsvHJod50Do7=KZaBvLssQ@mail.gmail.com>
Subject: Re: [PATCH] alpha: Use pointers from memcpy() calls for assignments
 in two functions
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-alpha@vger.kernel.org, Chen Gang <gang.chen@asianux.com>, 
	Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
	Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"

>
> I feel like generally we decided we didn't like the p = memcpy() patches.
>

Thanks, yes.

Regards

Magnus
