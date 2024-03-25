Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF5F128826
	for <kernel-janitors@vger.kernel.org>; Mon, 25 Mar 2024 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711356478; cv=none; b=XfrbYEc+pl3lqCIM4bH0BDoG88FX7E2CM3dDmI+/K6lylaQ+/tMij+M1MsShDBVoKg9TUX0sE0XPROaCsb5zh2LdBGmkh+RIgLmmyMvAcqfH2u2V1oJf2vYfzW/mlzRfvNPakT1vkC2LorNOudeYOviNBstUGAxLxz95T7x0qnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711356478; c=relaxed/simple;
	bh=oSJ//K8ol+P+P3Zji9tpLkFEeZi6qEgFOq9Ft7w2m3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdX8vZayKtMiNtj2XHAObdra+ZcWpnS/FEZsOcpRheuhIuf8CUaXPxOT90078WPK4ssJYvliz4VlvyHNEEFBkUHx7mZvapdTqx9OhTpSjtqZaLNiF3MTQuHGIEJNw9ZyzZk8wEoPqZp49WKtxdRj4k5XBrZR+KjqOnn8FIONMwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=Q/c+0jDa; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="Q/c+0jDa"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7d0262036afso153997339f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Mar 2024 01:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1711356476; x=1711961276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ms4jkXPSE9adqqhEBzf7IdCmvUVjO/xSfy0M32pByFw=;
        b=Q/c+0jDaGgQYCMEOJaTdZoj++p3BlqBXR11KnFZ0rESNwTqD5gRxO0dnbBMOzKIB+F
         nqTMiUY24noqpvp77sa5QBpo+fzo0ROtsUO6mc7vHwY27+L7PCsLVNgWDgL6ElI5Q87G
         oi2PfBuXcUGRJEzpspjlbTBgjXDeVqqPl5FRiJEDxmUxwSBpzfqAPTi1b6kLDcMBnXon
         kk5aKPiszi6EDTZtaT449yERNirSjYdh3HD8pGgfhIKXRC4SYZdJOF8r4PPfUtUsKpDR
         /UZXbqq3tv0HpoZVaNrfFMuQZ9d78lZ9HP6LRAWR5nhzvhjsclkkr2jSXHxhSjbQ/zru
         cNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711356476; x=1711961276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ms4jkXPSE9adqqhEBzf7IdCmvUVjO/xSfy0M32pByFw=;
        b=U/QcWZjlI+W4K3z2Jdg8+3wZbIK0C40w5urPjH+DwmRtckcN9CRl8ArpJiN5a83kRD
         6UWZUuWcIMZ+LmMVoSUbMRm61bnKJP8tEDBkSuu/Wp+bKiDjuGTIb/X7E+kkKlHMzQBZ
         6eP7hc9cwSOph2HYlueUoE2C0jQR9TJQELiB86qAL0brTLcXR4+vFsZrnKtbEgeQZ/2p
         sF6jk0Sp3vNGaCz7nqM4nsUK5wqd5iZdFqFtF5AWfUFrammEOzvCfV3x8OQeXzPhT6OO
         nviMsGzP/MxQdqDeeqdS+OxWFLX2rw5+0oYYHLQ5E7WYkmRbbqBh7OxL0sJHo0JYsQ0B
         ySbA==
X-Forwarded-Encrypted: i=1; AJvYcCWGDZO1Fk7cohGb5cY23/9X/gpmOPjXqp9IrEE78cqBo1onBHf/NlBZiOzLrToHmQkWe2sBu+eRHoq9yVCRSFClBVRpI0EfQ97gVcjqT61b
X-Gm-Message-State: AOJu0Ywupx8pqOfmkXqk3yVhG1BuL03XIs0LSYDJ53mVQVLTAzNd4WUZ
	4Z2NFK4ziGvUfKIr/62dz5RLU7w0ptzbrWlBwhT9+5Uj9bkJ31jJSFJTOWHG0TPaV5OiKkh9Au2
	pzWXXyQpJdJY1JxFM8B8/lJXW0FVoHov9BSM2Yj+0IM3okFTnfSs=
X-Google-Smtp-Source: AGHT+IGSCwvEljJGbfYn9wLE/b5/75aeMuRrUiY3C9t/Q3AwACOXzG/3thuOXyzf1ItEA8Vd59vdH4gk5NwdYae+Ems=
X-Received: by 2002:a92:d744:0:b0:366:ab6f:f63 with SMTP id
 e4-20020a92d744000000b00366ab6f0f63mr6709994ilq.3.1711356475818; Mon, 25 Mar
 2024 01:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315092914.2431214-1-colin.i.king@gmail.com>
In-Reply-To: <20240315092914.2431214-1-colin.i.king@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2024 14:17:44 +0530
Message-ID: <CAAhSdy2b1nUO5u0cM2uMcow931UX0Q=o_OY_YLQ5+oK499PX+w@mail.gmail.com>
Subject: Re: [PATCH][next] RISC-V: KVM: Remove second semicolon
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 2:59=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a statement with two semicolons. Remove the second one, it
> is redundant.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Queued this patch for Linux-6.9 fixes.

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_onereg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f4a6124d25c9..994adc26db4b 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -986,7 +986,7 @@ static int copy_isa_ext_reg_indices(const struct kvm_=
vcpu *vcpu,
>
>  static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu=
)
>  {
> -       return copy_isa_ext_reg_indices(vcpu, NULL);;
> +       return copy_isa_ext_reg_indices(vcpu, NULL);
>  }
>
>  static int copy_sbi_ext_reg_indices(struct kvm_vcpu *vcpu, u64 __user *u=
indices)
> --
> 2.39.2
>
