Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C525761
	for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2024 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719408153; cv=none; b=WKiIrYBEOt9nSVZEplgmjQDE1FzU4p97plDpvihOnakm/zHYtGtY70ykKK6PZJoo5wykoL6xJ9YNi4aWFGow7SxU4XXlwHWWn/qYTwaeeNqPxHwT0myBL2AGhhF1EyoMa/elfwaul3Ijy/cqLQEsZn9NO+1dgz04nMd2sGmcPUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719408153; c=relaxed/simple;
	bh=XxBobdsohKtbbp+VDP9sBXJLs9uMbEUbONhmhgK7pq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5LPy7Dj8Wkrgdp/pjD69JOWBKd0xeXMjlpVBcBCzXVm69XH93DbSRr1bWfv99Lkc698M59qLZw+g4jMGgg9M8BsbwAXuDXqB2Mv2crj0BB7+AoyygIqOstft9dgJb7U96IwYM/dDzZO32YAN1g4cG7Pb8QgHyeordyxOT/297M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=MkABVdL6; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MkABVdL6"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-700a6853664so2638879a34.1
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2024 06:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719408151; x=1720012951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5xewZHY2oJYxuRQNOBT5mZfboUik/lCsriRBhVol24=;
        b=MkABVdL6PzsU5MPCrZFzZFCczVjW1kUU2yObpmVSqXL8Xz0lfIhZvyXnvgWZHSlfDq
         Bd7cnz0GMGG2yRO05qkcnnGOLa67jjxn8WntvfOKOE1QnS02ClVmjobWGt3sDpLhWqhb
         ZOB2W0E7tGQjrr7XnVlbWkNJvRaNPD9QuqvdHkgeYAM2efmsk92ZvP2exj/XmhHzp2h4
         eDOYuLlQOvO5KDoQgPVR2eCfcksG5B+LUZAPm+UDCJqQFnSATipors1djcA0e8M0qa6Q
         mB2w5nVmQKCoz3EraLt3k0wP2NfIuSFwduNUWlKm/mjIgszBjrPaQ2QKPm+p1bCT/7T/
         BzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719408151; x=1720012951;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I5xewZHY2oJYxuRQNOBT5mZfboUik/lCsriRBhVol24=;
        b=Dk0A1I1qpH3hv67MeXAqM//iBZF6fVjvrPjteGUmuw70uXTO6qwtGJhaM3X0NKDqrL
         dGjMGnVruD9JH/tWtvm4QBC1JID6AqPyl9Kkf98ytvZ+ORo9Iu4r53pNDq7+HxQNVV5U
         HQhBMA1LGLoueCnBBcQkIF2wZNJDHgPuzo+NwfN4a+8sNynf1nL7PImn6oPP5AAQJolE
         o/oHNJTbHmrU71lmYgXDTcGCvEJnSpfZZWOmFVKCihiReaptzaEEMAXYhUJH3VW9NSWk
         o5KbcFlGm4emHmH7vZpuY2CuO1VL2XEcHxpNKhx49sMg8rqZKxZw1oljudIGBQjODcYi
         E7LA==
X-Forwarded-Encrypted: i=1; AJvYcCV4caCNUVvEerUnVI7Shxrw48Xl72iojY3AFolS18b5HATudABO8j2rDO71HrIDGEQREgJVEH4U8TKtwyiCt4x2MzXzB0gytZgtEWStvLDC
X-Gm-Message-State: AOJu0YwWwAE/6jog+Hc1qFM1r6bezYO+xXq6gUS8JmhrwKi4K7KAX12H
	aco5alBJRyOUUnWRahvg/22CuCjPhpNnxCsIZYBMcAAJHvE5xNOjJm6OSH/rPew=
X-Google-Smtp-Source: AGHT+IFQ7TQc949+gnCiGt+D4TzmOQ0Ckn0QWBw98q32b0sD5xDjYU5NsCtAsd0KDekGkzXy4fWwFw==
X-Received: by 2002:a05:6830:1d46:b0:700:ab11:86c8 with SMTP id 46e09a7af769-700af98902emr11454041a34.22.1719408150773;
        Wed, 26 Jun 2024 06:22:30 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-700d369f8adsm118762a34.48.2024.06.26.06.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:22:30 -0700 (PDT)
Message-ID: <6f5c1de2-42da-46be-9af1-9b293e4ac3e5@sifive.com>
Date: Wed, 26 Jun 2024 08:22:28 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/fpu: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Palmer Dabbelt <palmer@rivosinc.com>, Russell King <linux@armlinux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, WANG Xuerui <git@xen0n.name>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240622-md-i386-lib-test_fpu_glue-v1-1-a4e40b7b1264@quicinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240622-md-i386-lib-test_fpu_glue-v1-1-a4e40b7b1264@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-06-22 9:55 AM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 now reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_fpu.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Fixes: 9613736d852d ("selftests/fpu: move FP code to a separate translation unit")
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  lib/test_fpu_glue.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/test_fpu_glue.c b/lib/test_fpu_glue.c
> index eef282a2715f..074f30301f29 100644
> --- a/lib/test_fpu_glue.c
> +++ b/lib/test_fpu_glue.c
> @@ -59,4 +59,5 @@ static void __exit test_fpu_exit(void)
>  module_init(test_fpu_init);
>  module_exit(test_fpu_exit);
>  
> +MODULE_DESCRIPTION("Test cases for floating point operations");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
> change-id: 20240622-md-i386-lib-test_fpu_glue-437927d4afe3
> 

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

