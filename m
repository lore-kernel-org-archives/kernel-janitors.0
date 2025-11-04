Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C483064B5
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Nov 2025 10:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251158; cv=none; b=NvtotlWX+eglCZt2pRQneg/D8c/AW5uSMPwNH0bSDKYeQo3QX0iK1nK9kFlIi8LOfbgyKKWjx1nBMsRfIk/H67wGul8rfBM1c+AUGqfLTROrL8ipegUEMJVCAOzWBs5qW36cGz6717pQP8UvfmkW2iPIHipTW4g7NNBgasrAF40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251158; c=relaxed/simple;
	bh=PrK6pB5BJHP7W+BBYZEXkvRbs58hUfFJ0Y6ZF9KTrus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwRVVbH89bi/jtbbNk3yAUn0VwSMXdPeMr+vN4+vENmfMQcOiqk/hQZUzVw0DUnWB6y9thlo+VF704yRkqT9lF1VJgLzpCsDtl14R6xGRrohYbmnq9pzgftFSlaROiPAJ+ppm3EFatlsyL0zBogzLHJaJGKcyUnjOMT6lN7BQbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b6d2f5c0e8eso1055851266b.3
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Nov 2025 02:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762251155; x=1762855955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNh9dqNPl/MWMN2lVTbAD5Fn1iEQRgYG4Mm2+Idpemg=;
        b=SJT+IL1ZuLLISdIYpo42KsjN7LykksUFVDZ2X7ahp6Ki4CmOt6vllxdqQx8DFmqvFP
         kHsa/mgDhnWILZvjEh5UHvTF1kPnVQW25qEnTP/mCtJSbShuogZpgSKICc3iueyRtCRQ
         /kK3qpeE1qclYXdBUN6mhoqzqZbw0ETPwV09YD1iA6GMX4QIUERrUEwVtdlLVpsGUhXp
         gqUFugO9q2cZF/z9But3WEneKxdEwfwyl1qSc/gOLi05hdQGtUTbLSthXMxgzSXRCmkp
         BjZV/c/Sd61so0FVUvJXbOi7mt3OM8EmfD4IhCAHK6Qz6J+P6PFOOt8+HQsoDWrRzicC
         L+8g==
X-Forwarded-Encrypted: i=1; AJvYcCWHIlpnO2kzohmu/bTDUSMiaM4YBbSf5N5g2d5rtyQy/ScvciRgBaEJwLbJCNKUqOcp88+E4fPSd/44mivkgN4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygiy1+HOx2v5gA8h6XqLzwp1L75eGZwGnu8NR02BJ4OBgetfLG
	DN9NKPBbX0z3jJ9mCZ6pKA0UJqynRUmiPq/ARKfC/Hhs+81rSykV9/uV
X-Gm-Gg: ASbGncuzVmFLFAluE6MYvM5ARFs8BerMGrfOoIxU6EdUAdff/5B+J+XItN6R9bVxdKB
	a9ImahDlcEp6vMTEFp2Onr7uJKeKn24vDe0FjQa0z0LWAoSUbMRFrnXOGaQ9Gy/oWKZoLxdqJ0x
	5Wx/29oT/trSwAtU/zGhFwb3wWbht+7EFr/jc++BZjZyNKV2Nh2jJS4uJf09h/+E0LD/eK4LH2l
	hPxZ4UBufattG+s2zy1uIFa9H4GuockVXRmcMy27i7mNi4RYk4rIDgz7LaTnlmTwdjtYVAUEVT9
	kueW8ZnfYSY2W47fFLY0SZnZM1adMElCzYZYW7MmuTa7O+1NuBDYcw6/EZ5fsigUMLlRnG7fywy
	P0zgn+r4ea8drK27ADVB0n6q0q7S7NWD5xGgI6zPC9KaWyntuOfa0hqrqmSNMEHuynbk=
X-Google-Smtp-Source: AGHT+IGQIiLUL2jCplWGWCxon/2S5vXopmyY0ct5xQv5tkc3QvWJLRcXGwfVs2NKteJjsf3xyzDfbA==
X-Received: by 2002:a17:907:2d0e:b0:b71:5064:be0d with SMTP id a640c23a62f3a-b715064c16emr535111366b.41.1762251154719;
        Tue, 04 Nov 2025 02:12:34 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:49::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72406568a2sm170855966b.73.2025.11.04.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:12:34 -0800 (PST)
Date: Tue, 4 Nov 2025 02:12:32 -0800
From: Breno Leitao <leitao@debian.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: a.hindborg@kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] configfs: Constify ct_group_ops in struct
 config_item_type
Message-ID: <apftq3nt33ma7citvlrub772eysehqvtb2mbywqlfm56grhnhf@vvnix52rixzz>
References: <cover.1761390472.git.christophe.jaillet@wanadoo.fr>
 <6b720cf407e8a6d30f35beb72e031b2553d1ab7e.1761390472.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b720cf407e8a6d30f35beb72e031b2553d1ab7e.1761390472.git.christophe.jaillet@wanadoo.fr>

On Sat, Oct 25, 2025 at 01:15:37PM +0200, Christophe JAILLET wrote:
> Make 'ct_group_ops' const in struct config_item_type.
> This allows constification of many structures which hold some function
> pointers.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Breno Leitao <leitao@debian.org>
