Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCFB363C43
	for <kernel-janitors@vger.kernel.org>; Sat, 15 Aug 2026 06:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786774588; cv=none; b=dDxpY3fDKhVh8ImLPq1Pnz5NWIBYelYiC6PwX578cXHop3J3J0dAt9sJ2wFRt9uxysdf+8hlKe1s0gVy8ZgtVcB6vtiJro0IOcR+HFZDVWwJPOp8R+M3odg+mGobS95w4rbu7l+WfO8wpA22OMVVY0PEjPYr4Str6ymhbQrejTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786774588; c=relaxed/simple;
	bh=BGHkJWTyQmv0GnaSQsR6y+wwA2JB5brkk5DYlmBy+0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=up161lsk7TGuGwx6yEAkKq+pG9+fO3RfSlKodEIpCVAxPBjvo2PEEBLZ99QPYM0jU7fqy5PlHbHpW9AJfvEl4n5rK0Uj5/1oQlCa9NGHzdT2A0ukHQ2E34umEhtVYf4E9AX6FkIQM/J0tGDmJFHMGSkksi0sE/rawpSNL6VkX2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPyjVRwd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPyjVRwd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-472326ca506so1165911f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Aug 2026 23:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786774584; x=1787379384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HMbsrn4gJN/XmhuApQca7zXrmJcqKKIj95PmT0TacoM=;
        b=aPyjVRwdWlH1Cv/VQMAr7RZMp6ZXwruI+C2WHMbfWf7rQ9WBNexeD5YbetbWNWSFiU
         pKISB8LmRB9Y8UyuHBloYmmBg5Y6Ho1CJ/noFZf4kWctjH24UqQAiOz+rs1nScolyDDS
         zo0OPXw1gAWYZ3ZznpcGN5UQASumIJgZFfP6hmg0GtulztbiBZJtYij0NbyKop5b2N0l
         Z3M66zOj/B8VZhbgF7xOYkchcceS0d8SzKVgB9T6v35nUZ/JnYO8EnfPftm/vsSKgRhP
         9LTEpC0qH04xQxWpl87TExNqskGbHq0QX3ccH1m0VqwLUyC22Eu3arvZ2gnmmPd+X7k9
         SvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786774584; x=1787379384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMbsrn4gJN/XmhuApQca7zXrmJcqKKIj95PmT0TacoM=;
        b=AwYN/ZhesifvdYIj3PC1JFW41MZhGqIGfI4R9kkRHtVEkskQKhubO8R7pZUlJEY2vM
         539KuNG8Y5Pw8o39XpcDfOdwn8OZgpv1nb91ByebdCSOhOkwEJTugLrUQjmWeVOJsxR1
         jvK+fsX3+5I4YxRp3EDgWevIR1GKlVSKaDv58Xwa64WN5ghT+zXthrYG0k0mwnriaT4m
         BgwV7r31I8xHWOK20zRVgHyEcza1i4iB/M/ga5hd0MZwnUDj0qbTq4GUGtLJHJ0WazOK
         hn19YhrMcOtCjpYseEBChfMqsrANmZmyyhWrIG+eEBad5E2NsUJmxl/mAR6z0nqA+cHi
         s7cQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpo9BpcK+DxDxm+71A4hxWmiwjDJWUyVQpas1pNX3j8JgNs09qG2bIFhWdP3+mIS7VF6NlFq4auIaUI/dzuWTs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6DktwWwDA1+PVjgtIWsI3kN+mwbca1PqLbMBmRsSF9qw5Wl5v
	O3WmQtDWHRnLx0u1/vS8xobP5+7RsHsXsUcRiM0Gmb1ExyO4miytn7rk
X-Gm-Gg: AR+sD1328HVks3j8eNwOq+hqcyM0+fipy1YFOEt+WK/tnJqhASawzkc3fV78Kml6+pG
	26LxlScvFAtZv8w4pgdmhLKoTX0ddw91emD/u2JNzu5Lmu3m3rtzefMsaKTXhajFQgDxUHE6H3v
	FKeIvK4QaC9XJtmYOVPNY/f40ONDcy0krwfEu4+D9+hy/TvRz2G5yVndFmXUxr9eqY0irUGYSUt
	2aNS0nob2S2C8oC6sjd46q5foaZB1dF+UgnDqnIOP99ulrcVjdgL3TVdjeRELUMg1aUE03v5IKI
	LXNi+zCUxQZBDiuXQiUxkGtpDfKjcfhUkY9O7O78l+Xi43RKrvh47aQl1YB+XAv54EchS0yyO/e
	WbTAfmLXGS5Ph/8qzh+IlEObsEi9O7yxKYjvpXP661KrTozpb18JypJ4c2Y5jf33d5CJfiq/SH6
	cAaJGz6CXqAs2VzNr7XZsWCaGajnrQVPCwTI6mfZ1IFTnYjr0gRJrzGAPRotMk1DQShwJCRsRh9
	YIWdWTFANjgBkM8thaHRu/LuyqrU34uFOZDiKFMNYY=
X-Received: by 2002:a05:6000:491e:b0:47f:9404:5185 with SMTP id ffacd0b85a97d-4816078827emr16850466f8f.24.1786774583939;
        Fri, 14 Aug 2026 23:16:23 -0700 (PDT)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2ccc00sm13646333f8f.35.2026.08.14.23.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 23:16:22 -0700 (PDT)
Date: Sat, 15 Aug 2026 07:16:21 +0100
From: Stafford Horne <shorne@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Jonas Bonn <jonas@southpole.se>, kernel-janitors@vger.kernel.org,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] openrisc: drop unneeded semicolon
Message-ID: <aoAENVPTu7xW8LL5@antec>
References: <20260801191002.1383835-4-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801191002.1383835-4-Julia.Lawall@inria.fr>

On Sat, Aug 01, 2026 at 09:09:50PM +0200, Julia Lawall wrote:
> When a function-like macro expands to an expression, that expression
> doesn't need a semicolon after it.  All uses have been verified to
> have their own semicolons.
> 
> This was found using the following Coccinelle semantic patch:
> 
> @r@
> identifier i : script:ocaml() { String.lowercase_ascii i = i };
> expression e;
> @@
> 
> *#define i(...) e;
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Thank you, this looks fine to me.  I have queued it, sorry for delay I have been
away.

> ---
>  arch/openrisc/mm/tlb.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/openrisc/mm/tlb.c b/arch/openrisc/mm/tlb.c
> index 3115f2e4f..2ee00bf30 100644
> --- a/arch/openrisc/mm/tlb.c
> +++ b/arch/openrisc/mm/tlb.c
> @@ -74,11 +74,11 @@ void local_flush_tlb_all(void)
>  
>  #define flush_dtlb_page_eir(addr) mtspr(SPR_DTLBEIR, addr)
>  #define flush_dtlb_page_no_eir(addr) \
> -	mtspr_off(SPR_DTLBMR_BASE(0), DTLB_OFFSET(addr), 0);
> +	mtspr_off(SPR_DTLBMR_BASE(0), DTLB_OFFSET(addr), 0)
>  
>  #define flush_itlb_page_eir(addr) mtspr(SPR_ITLBEIR, addr)
>  #define flush_itlb_page_no_eir(addr) \
> -	mtspr_off(SPR_ITLBMR_BASE(0), ITLB_OFFSET(addr), 0);
> +	mtspr_off(SPR_ITLBMR_BASE(0), ITLB_OFFSET(addr), 0)
>  
>  void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
>  {
> 
