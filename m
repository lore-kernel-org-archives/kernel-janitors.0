Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A48C1459F6
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Jan 2025 08:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736237351; cv=none; b=Z7H4b4qK6XXaBoSv3VJcZlaNILNPgrmfpqQkHBO5w1gSKkkXMfgndhdFWB+2ZIjVQKl6AjzId6ypTII5BdTiVPZ2+1UlWdXsdDV8zM9tSZbCxHqynp/05FQRR1d27OpN1Q1qx1olesf4Tq4afPbtdgkuoei0WHjXyQVcLkc/iqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736237351; c=relaxed/simple;
	bh=ZH97IDHpNAx4jci27cm/F+Pns8CYOUaop8R67kRHEgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED68wv1+/UEkB2JI4RnsHGXJwo2GIqdGIpWmOIh9SM3YbdqkOQ9M3BppLaC02Czcprz4Yv3oooAxqPpRho5FwOtsssZVTYYm6fOm5iWTFnB8qpWY4+1dE5qllvumtamQH4FIoHSADPEI5cbC/Pkl5cz2B5RpoiXJq5J3uJw5LAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E6AcyD++; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E6AcyD++"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361c705434so109681655e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Jan 2025 00:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736237348; x=1736842148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=61s00L4+Bh0BENUBO/u8PhKZ1my5KDTfGobviInVbCU=;
        b=E6AcyD++7p1Jy0CxXLrnXQw1IGanmbKUGCObOht6x6lM/VnvrCuIMlNE6ndXgjgsai
         qwG3qPKpmAyKVjc8BFMBtjPi3VoQ0nlpXVK1RYvRyjr+D3R9x0sJ9BcwH1VOrqEc8lEs
         N70e9k16FNWgWJDG6JiAu6uRQ9fU9NC9Ol21tfr86gl+hfWu//0974d1pxFxkVYcZFHm
         q3KRAHkLaUN+8MFvdzMzOXBX3Vsi7sNqtwxfoNoaXBDz/ZY4bpUfHvuXXn8E0oHok6f7
         VC3y/2pC4DthpJrRHdZXZZ3Xu9fMgzEAflT3mGO5C2yGRMh2DdN2M81mzOIY9k5lUuOU
         Zohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736237348; x=1736842148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61s00L4+Bh0BENUBO/u8PhKZ1my5KDTfGobviInVbCU=;
        b=vmGy98mHZaU7qfCpP8LWD90VyypqOVkxzEn+UWf96c7VSS0XqEZaFz10M9wxt0xxKX
         QgGEdcaIQYmSaL/g9q7CKRbqwGpq4scC4wkahVFWxfofJdF27OKvoIKnDgP2EhJlWvnZ
         EG7r08Ilz0DkyhtrszoJcfebplG2KmO+vdq5D76rgDNaiWSe3AmDNtJXr31UcMQzfO4t
         qTrMVYODVH4REgj5sxNVMvR2/WgnwzN2fkxiR1gWhpFT4NR8TuFcCvj73x454Nai4trK
         NZy5Wph5jxy+Zto8alMdnxvSyHQ2QOHxTN1Nhotd7vpwxx1YyuZmMAw6HTU0ddofZezj
         NvaA==
X-Forwarded-Encrypted: i=1; AJvYcCVeoVvVT5JwUFOYv4ItsyGA5jz5EhjLf7vU5E6SyPHsrqGzGlKUFiqJLEzquYWvKwt3LIXEjKRW7HxViOnxpQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3bZ4wiuK/2TKopqAZEsAmQLDCoUD4tCMhaLAB27jWvh4A4Cro
	4+76oxM0CfoVcQAL0s69ssjWLt2pEisEOposEoaP+NZSjGCDCqsLerm2lKgMzH4=
X-Gm-Gg: ASbGncsYVV3uN9FukaGyCHgLOem/11AVdpjVJBKmZ69SRTrDvYCSgVIXtQ0snw04qrh
	H/JnExabUIBHPlTl/rbxl16RgX/H00wQouwVljEZUC4uo6u+Akc2HQrH2zstHtKtih0BW7wjsY1
	F3KceiHMoG/Em9GN4jS86C+iKcettaUvSd4AqqDaCAIMleENQ9IdKoXSwv2aFte5g0ZApsVPpmi
	R1gjlbnXaCwMyCLrxWpVF1SKMMfIvMfuEI8f3D+jcTNbszGsHZB+yPFblp6BA==
X-Google-Smtp-Source: AGHT+IEsenbu2rKsRcIBHE7Ai++Ok2RotzvlANX0bu6oTbxzog2vVSczWxsWNk3+PKcJrVkx3AvWJQ==
X-Received: by 2002:a05:600c:510f:b0:436:1b08:4c78 with SMTP id 5b1f17b1804b1-43668b7a284mr555015735e9.31.1736237347868;
        Tue, 07 Jan 2025 00:09:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a71sm586050185e9.26.2025.01.07.00.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:09:07 -0800 (PST)
Date: Tue, 7 Jan 2025 11:09:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Alex Tomas <alex@clusterfs.com>, Eric Sandeen <sandeen@redhat.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Andreas Dilger <adilger@clusterfs.com>, linux-ext4@vger.kernel.org
Subject: Re: [PATCH 1/3] ext4: Fix an error handling path in
 ext4_mb_init_cache()
Message-ID: <da3377fb-96f2-4ec2-942a-8a9d2741f261@stanley.mountain>
References: <3921e725586edaca611fd3de388f917e959dc85d.1735912719.git.christophe.jaillet@wanadoo.fr>
 <9383bdd6-ac04-4a14-aec1-bb65b67ace75@stanley.mountain>
 <2824a50f-33f8-4db0-a7c2-edc5d6ca12af@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2824a50f-33f8-4db0-a7c2-edc5d6ca12af@wanadoo.fr>

Ah.  Sorry, I misunderstood the issue.  I can't say for sure whether the
bug is possible but it seems like a reasonable concern.

regards,
dan carpenter

