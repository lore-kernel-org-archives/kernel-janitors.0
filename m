Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3459C125;
	Sun,  5 Jan 2025 01:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736039176; cv=none; b=cB/Tbs+OZy47gvaxRZylPfTqMtds74+SILBMGegUtBpPwaTXMirmRfk47lKc/4Lgfn8WgbXqhiVleZjQ1fckUeyLhjEsmvFiQq3SBM8tx4+lsW9Rii15s8iztEBCr9RSyLtWKXVl60/du6LxCs1yvwI3eirDSMIybW/Oqv4RBM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736039176; c=relaxed/simple;
	bh=mCRxuyl+kVB78bNtQcV/hQ7qqVQPf5w58KkeVR+VN/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWGjQtKwdhQd6mbdQsDvZRXrhhjE0Jg4hWAxMkVCy5fVErMp3+mbaqLt9trIYcHCJrc/t5KcHuuASXbxHGCEu6tC4Ynkcl/e4FD117LV1mEKfBZ/dcb5DS3BZvNp2xYyYNJLy73DuRCDHEc/KYArb8rw6ILObyQ1RvHifPw5N8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcr7Iece; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcr7Iece"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2162c0f6a39so196078155ad.0;
        Sat, 04 Jan 2025 17:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736039174; x=1736643974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vY9b5OBJ36FI0wX9MeV/1vqLXX/TI/kKxH0tqFEHa0Y=;
        b=hcr7Iece64ayTFWFOAw9b5SVqid6AnVkEXofItNM5n1LKntzKnTHsjlpCu1XK6tVT/
         Q9kBrKlk/Q94kDmadG33O7Ws2N9iJ+1zly3KGBbejDY89chyBOW6RklJbXWq1U4VvkTC
         3SRCxy/sycODMPEFlhbE/rrMWTve2YziRW0ihpy721NViV9fWPV8fRXFvBwZBnjKMgrb
         FoUajTvkO7SV8+KEk+gIddx+soTXnjW8jysqYXIWdtAtVkhXVInftMZ3EOQctywNXg/v
         MveHZ1ewsF//bKEqb3LAC7G8My09IcyRrY/lBpAOTYOf15HhF3eEbpN+regTeWQhTAUD
         wB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736039174; x=1736643974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vY9b5OBJ36FI0wX9MeV/1vqLXX/TI/kKxH0tqFEHa0Y=;
        b=YioVImMSDf+25lLsyBMmOAh0hbMKV1+KR6rssHz3bt1WXIjp+Hq752kG46qBzJfcGT
         7gR8c9LZEfcTAwpi1Fj8uI4wefunaOvDeyKUUdTewhp/nARO+GmDC3KaJiLoKp/zqbhm
         3XZ3taUKwhiYl7fflPQdmmvGDgTR+kZDNZ6awORiWpSvtsaylTPmyLFtgdA/l2TKWYIk
         owLEY0ygQepi6cypk9KNc8AumMffd940L4Dm7tlOilJZV2tHQoj73uD6eEJtaCn9Lsn1
         FiNofajB1pjm5Th3oIH3X/cvZ0HZ6XMSOt9da5cs6r8Bqu4BxZsqaslkjGfD0L73fpM+
         HQsw==
X-Forwarded-Encrypted: i=1; AJvYcCUCbA5rhdigSuuEtAaAHWVIaGsHIgYLhVE1oELV9FEtHYuVwwCC9gSJendaPd31D6G/HMXPc47ab147uLN8pcM=@vger.kernel.org, AJvYcCXwmrz3KPWkJbVPcX4ipaCIxgZZQAz9qsXZdyLU5txZxq7PUqwLWaoxAoMp6Wpet19COhTL7jhDQEE1QjS3@vger.kernel.org
X-Gm-Message-State: AOJu0YwblGUaSuhKtHuTCi6H/D3qLzayTkwUSwC+4A4GiLp13sWJAGll
	hBITUD0wZfuo3E2QQGDnf6f9kxdGPp5OpeeGa3516Im0Avh1vVML
X-Gm-Gg: ASbGnctUF4Ol2O6kCWNbOSu0KqJLc9Nl3qb7uiNK52cM+DNeR1lWR68SZ7aZp9Il2ni
	EiPksjhVOmD2wMqJkuWgQSiiTv/OCBSc39t1SQL7cq7d7vnnIyNWC6e9J+d1Ur2ch3JKYejQ8ja
	ndw/MrEed84E8e563yX1H6Zi3+3O40l8ekCGwN2fopcTN8LftOGYVryVwE/BjB6Tm0lVdtakMy4
	7GoccSp8Y0L3YO5ckP7a6togTWn/o6ucuaKU6mcuVjvA2TcrpaBDDaTYNOb/Np4aPF+EuCVnMUm
	dnCLnzmX
X-Google-Smtp-Source: AGHT+IHpFLvIIxXb0n9Bg8CB+KmS4uzf8XYMyapuCT105lZP2PIoR1zydlK7YYlCc06EdXQmd1mywg==
X-Received: by 2002:a05:6a00:10d0:b0:725:d64c:f122 with SMTP id d2e1a72fcca58-72aa9a1041amr102429342b3a.2.1736039174160;
        Sat, 04 Jan 2025 17:06:14 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fd2bfsm29592494b3a.148.2025.01.04.17.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 17:06:13 -0800 (PST)
Date: Sun, 5 Jan 2025 09:06:09 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Cc: haren@us.ibm.com, ddstreet@ieee.org, herbert@gondor.apana.org.au,
	Markus.Elfring@web.de, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	anupnewsmail@gmail.com
Subject: Re: [PATCH V3] lib: 842: Improve error handling in sw842_compress()
Message-ID: <Z3nbAftm07ekm2Aq@visitorckw-System-Product-Name>
References: <20250104184951.3481-1-tanyaagarwal25699@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104184951.3481-1-tanyaagarwal25699@gmail.com>

On Sun, Jan 05, 2025 at 12:19:54AM +0530, Tanya Agarwal wrote:
> From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> 
> The static code analysis tool "Coverity Scan" pointed the following
> implementation details out for further development considerations:
> CID 1309755: Unused value
> In sw842_compress: A value assigned to a variable is never used. (CWE-563)
> returned_value: Assigning value from add_repeat_template(p, repeat_count)
> to ret here, but that stored value is overwritten before it can be used.
> 
> Conclusion:
> Add error handling for the return value from an add_repeat_template()
> call.
> 
> Fixes: 2da572c959dd ("lib: add software 842 compression/decompression")
> Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>

LGTM. Thanks!

Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Regards,
Kuan-Wei
