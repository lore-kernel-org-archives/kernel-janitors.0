Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBE4314B90
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 21:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860491; cv=none; b=cT1mfDvBD3YE3/e7I0ngP50Ic+v7pS+r+EvMTYVLZUkw5yeFmnSouAikksILSh5FV4naa1lHRGv5TbtGdFavDplPLtEN6INZL3x6ag+/2JSe2mbOxqcJ5VH2dxE5kscEbOIB0HAVFgHOvnG3RBp8UoKlBxlpY5i/ZgJeNIeFAeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860491; c=relaxed/simple;
	bh=5AQCSF/N5fYZh1DKG8zQeN+QbCB3F/STERKQmGHnv+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BQlkILCMT3XDUxNFGdHhbAeZvMUWvBicOQqlDxLJnCxEAa2Tc5ipFnZST1lYGf9TzF3fSW2Kt0sLtmBCAYzGy0yWCViwEWt1YmA1DWLODp0rTtYXuAcgMKQ0XL6tz2p7CrQkSqSAiysRgLR7PqH3F5Sf1uKD26F1cuif6FvIg64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkBrdBPj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkBrdBPj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-475db4ad7e4so6386205e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 14:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860487; x=1762465287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XBvCSEn0ZeigCB7NPjyaiTdYT+8OHxru1xjOb5u250=;
        b=jkBrdBPjhFq4qnHNWQDqOoUR62ROVRh6gLbxo71ZpSnE4/Tj5++SnjHBSyHiC7o1IS
         44Sfc4pH34i0RrLOpyjrw0BMz3yCbWFIY7AWuEYKN7Y74zU+3UCcw38jKqMi/E05vxSS
         yI5MZ3kngDwAu/OL97fV/sHQqa5k+tagY/TJy2w+gykm7qFktbByFzLbdCUDAShXZjv9
         ig8fOdaE4eI11TOBaozVZyzlKrt+1Dp1VARSiROdsALCmz9lh0OpnUx1L4XR33+0/Rl7
         cje58JxoepufmmemzCZLrYZJAe8A4/sRJ6658DvMwqo7UDIjsQnFXx2/azvj/iF0epm3
         W6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860487; x=1762465287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XBvCSEn0ZeigCB7NPjyaiTdYT+8OHxru1xjOb5u250=;
        b=T91jgh81zp2rJye0Rq9AAW+t+4I0FcWs9am2veyVSqK4im8Gv0FNLSRn5Je4/PvPk7
         nDt+HHzBJ7I2l+0+taqcRTpXBsaij65OjCYRMQYTtCfobpaE3Z7yF4WdVC7hQr+/0+lc
         oAbBxsJ79/zA7DQoi3Ft5aKFE+tnyvJzNdrGOUjiyeATEQh4iFNKjMtbfgTkAEwBVjKK
         EqH41dPXAPZQ5ilE+Cr77Mox5/UpLGykx8ACn7aIGJx3VtvsKkv9ImBUOS9hdET5SeI4
         EK8YeqELv/0gTpN+E6ShILHPo6wcPADw/GAYVjYrRLKlBsZ5K5nCCZsqgp6lNG/oJAX3
         GI9A==
X-Forwarded-Encrypted: i=1; AJvYcCXv+8J7PjtpTCSMIsi7BGBoc1lZVqFsomj8G8zF0FPmLG4uPJY8Ss1qN/qNtlDErLTSG5tFZfmEFM806n8+Goc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA0Mh3lqmhvYDa6B9RZ9id8WGLf7o6HLm57TKtE6Af5E3Wm587
	v1xd2RgROaHS8lF+0/dbQgBPQPeWhpzEajipGXoH7YfVAq6EGASmsgMqvWGjLQ==
X-Gm-Gg: ASbGncvd0VgH6+Oi+Fu3Dtsde3UJMZFaxdGW5j/+0IpO+jr3nVsWCvmVajZ8eNn5pRD
	49iOOpD0cSFcTXHfknTCqY95j+Q/UVSjEH/IRF/o8X4rhroYs/usyLjSqoB8PES/LGNxowts288
	ICnmea2SWdgD6MXHh9y32YOl6+bo4Vno5pEF/BNmx1hXNOJHu3xbyogT/VSxXiW80dfB4XudK0M
	AKGM9f1jFwPtD608ObdsNP7Em2ELamIydqqMVXPKgorThvx9ZqvsDFmtkiCC+PN86JuSbizf+xv
	baQtb4qEXIIK+kqDLLGRfTZg58IOJYkHMwtVgp8cz4nmuwJg5WKv/Op5tjQeUuXv6H3L8jXT3A8
	fS+8SqX0fYLfnkFZ72cO2gxCOjfNgFzBqacUuaV/t+gw0n+bjE7uHNoM8lKkgeq62TWpuyhBRlv
	dpYF5ghgKKZxSE2hyKYBZHwf2EaaZ/fkwgY86CNC66OA==
X-Google-Smtp-Source: AGHT+IF2+gC67dgVdnAW7HO5oobqLFRQy+U6kHEZPTDvGE8zU4sHMYcN9fuccg5Lwqg5j25NgQTe4w==
X-Received: by 2002:a05:600c:6215:b0:477:f1f:5c65 with SMTP id 5b1f17b1804b1-477308abf3dmr11142745e9.23.1761860486746;
        Thu, 30 Oct 2025 14:41:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b79cbsm34210623f8f.4.2025.10.30.14.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:41:26 -0700 (PDT)
Date: Thu, 30 Oct 2025 21:41:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Alexander Graf
 <agraf@suse.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Use pointer from memcpy() call for assignment
 in kvmppc_kvm_pv()
Message-ID: <20251030214125.33379ed2@pumpkin>
In-Reply-To: <ad42871b-22a6-4819-b5db-835e7044b3f1@web.de>
References: <ad42871b-22a6-4819-b5db-835e7044b3f1@web.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Oct 2025 21:51:00 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 30 Oct 2025 21:43:20 +0100
> Subject: [PATCH] KVM: PPC: Use pointer from memcpy() call for assignment in kvmppc_kvm_pv()
> 
> A pointer was assigned to a variable. The same pointer was used for
> the destination parameter of a memcpy() call.
> This function is documented in the way that the same value is returned.
> Thus convert two separate statements into a direct variable assignment for
> the return value from a memory copy action.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/powerpc/kvm/powerpc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 2ba057171ebe..ae28447b3e04 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -216,8 +216,7 @@ int kvmppc_kvm_pv(struct kvm_vcpu *vcpu)
>  
>  			shared &= PAGE_MASK;
>  			shared |= vcpu->arch.magic_page_pa & 0xf000;
> -			new_shared = (void*)shared;
> -			memcpy(new_shared, old_shared, 0x1000);
> +			new_shared = memcpy(shared, old_shared, 0x1000);

Did you even try to compile this??

>  			vcpu->arch.shared = new_shared;
>  		}
>  #endif

