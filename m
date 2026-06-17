Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4869E33BBD0
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Jun 2026 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725689; cv=none; b=qLX/XJd8Hc9g2EywpH1DJBSp7BHc9PhMqZX2rduqaEzzd7smGS6O/FpNyCsle9D4ryMrUJq3lOAlAXko35Ayv+L29h6CzcHPvuQdxLi5g34e0/mbrJ5rBQZ49UNxCKf0yMr9ZIDoiHcHQ+i7Kb549Er0Zd3wb6WSYK174M9D7Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725689; c=relaxed/simple;
	bh=y8KRxlDydnlMB4bwe8rA8Q24TwjQ3h3dXz9QHSatshI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tuoMANA3pnTvR/apeGvxxi93/Bfp4lZh6PmHinJj7HQe0o+qRaCZrkE8GuisN69XDrGxKuVOsnu5EI2InpDcWXKTy83dtMkoFhE836TBVD4t81urkIRXcFX2WirI1NBl1xDxrpzmnIysQ/mkmEXvYt0blTy7Zwsej8IO5eR9fo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=xiDvOEcV; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="xiDvOEcV"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30beab3af9eso465257eec.1
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Jun 2026 12:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781725686; x=1782330486; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvTFCUrAoOsfyHTDvUm1jrIbxnzSI3LZ0klwZ9TVDcQ=;
        b=xiDvOEcV+6F840UNP2zKOmtsqTNFTt9unV11MwI/pheJydIgEcypNMebLsObyk4Y6a
         z6FNgI9lSJY/3rBW8Hg4DwKOyR7t9CIsDp7caA9P5i8SENhEEAj38EgUPLg559kMN6sz
         3tphZzQYKa43AixN2KG0pM/1NWKjmwKHu7wnnfRLZtXPgUZ+wXOeuJxdkCcqCNwO3jmG
         OouWs8kEHVBtj10pC/3J+XoqSQEdbCMzCPCyhSdXZNDX7g+y0V9IN3KEJRQNAwoMBanD
         ucLLUs2XhGXFmuWazgw9+uVFX3sDO0/1KLmNEYx//7OZk4J14lCxISDM2XE0nnZzmHoz
         LLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781725686; x=1782330486;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZvTFCUrAoOsfyHTDvUm1jrIbxnzSI3LZ0klwZ9TVDcQ=;
        b=VpsKktR0xcSIHhKjGzf5KxmT91HUjSvFpN+fAnljFD3sE44iS0wrzSUO+0C0qtuTSy
         tqeoJbrKz2QLIXo/7zjSyYuEbjQEYC5/6184uPoptXH5sdm6Z2ZAENLAW4F5dhxxuELi
         ElcyxjNxP9Z/YlQ2VsTPu96kSG/bgo3Ij9wlCCT+k7O7CeqcTuDmJgUpGDsDiOqNMBkP
         JBb9ODF+aIBavQVX4SKMv3hsQF6NK2Blij9WNB5+EfE3seBmPI0rmXYl/v1+TeMoiNi/
         GYrx3bBEzLxGSg7uI/YrHt0gleuXFxgI8h90dgVJVTM6YwA/IMTHV0PRlhD8+jQua3Bx
         3dSw==
X-Forwarded-Encrypted: i=1; AFNElJ9z5OA93L4zS8+faemZY0mfB3q9oXTr+RbcV74kpY5izTTUXcMrpdsTZWBmystoNnPkzBLCVGcq2IfHgcbpvBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO4UCNKHR7M8ujszsl0qcIiNxrAk1WQmDcV8sRvofgdJ0dcAIj
	apL71vSJLWlaWwRfdxR26Rhod3kM3udp0Gyr6i43aogMn8hbNs3DqhtnXA6ULEURU7M=
X-Gm-Gg: AfdE7cmnbx8CU12tfMR2Nd6YnI7ZBefhVmKp3gICQWNNGMRVt2sHVvXEpFFC5ddmW8/
	g1T/uF35zaN2zgHO1UUuAVYbTzSZ2uCM9/180HBPWhvkzzB1W/Ah5X62MVyEmoD0xa1AoB3TkGa
	oIf6Rvx3SZd5dlTjpVEl5B/AEAWpMVyD6vmt6SVIZSKkpgyAjpskqOTaa2uwiF3cPYcybSAtiir
	pEnuP1U/OlXOQuMUXCMkFWTf8AZqa/O390fnivuSy/14gYwdKpyaLbGics+m5lH7YbRVOFoF3ez
	8sq9sRxij6Dt4hHoPbWt+vD9oWW1TlwMrWo/+04jj8sbN/WcyEROU+YKECBrXRFT/ORhhn4jkDJ
	cpnPITVLTmguKfWCgwC76hgYjI/XpDQZ2u6OX8x2uDCK7NKJiIezc2iSeSZl89Ys6a2CM9w==
X-Received: by 2002:a05:693c:2d8d:b0:304:d14b:b706 with SMTP id 5a478bee46e88-30bca08297fmr3459406eec.27.1781725686243;
        Wed, 17 Jun 2026 12:48:06 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::4852])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e4898c0sm24671774eec.3.2026.06.17.12.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 12:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 15:48:03 -0400
Message-Id: <DJBL1JEE322B.28EZ7GUNTJP99@etsalapatis.com>
Cc: "LKML" <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] bpf: Use common error handling code in
 bpf_is_state_visited()
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Markus Elfring" <Markus.Elfring@web.de>, <bpf@vger.kernel.org>, "Alexei
 Starovoitov" <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Jiri Olsa" <jolsa@kernel.org>, "Kumar Kartikeya
 Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <d6622225-c765-4d9f-9501-1021df4687a4@web.de>
In-Reply-To: <d6622225-c765-4d9f-9501-1021df4687a4@web.de>

On Wed Jun 17, 2026 at 3:30 PM EDT, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 17 Jun 2026 21:15:08 +0200
>
> Use an additional label so that a bit of exception handling can be better
> reused at the end of this function implementation.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

Can you resend with [PATCH bpf-next] in the title? Right now it's not
celar which tree this is targeting so Patchwork is treating this as
a netdev patch.

> ---
>  kernel/bpf/states.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/kernel/bpf/states.c b/kernel/bpf/states.c
> index 5945956a7573..09f87e2bb1e6 100644
> --- a/kernel/bpf/states.c
> +++ b/kernel/bpf/states.c
> @@ -1566,21 +1566,16 @@ int bpf_is_state_visited(struct bpf_verifier_env =
*env, int insn_idx)
>  	/* add new state to the head of linked list */
>  	new =3D &new_sl->state;
>  	err =3D bpf_copy_verifier_state(new, cur);
> -	if (err) {
> -		bpf_free_verifier_state(new, false);
> -		kfree(new_sl);
> -		return err;
> -	}
> +	if (err)
> +		goto free_verifier_state;
> +
>  	new->insn_idx =3D insn_idx;
>  	verifier_bug_if(new->branches !=3D 1, env,
>  			"%s:branches_to_explore=3D%d insn %d",
>  			__func__, new->branches, insn_idx);
>  	err =3D maybe_enter_scc(env, new);
> -	if (err) {
> -		bpf_free_verifier_state(new, false);
> -		kfree(new_sl);
> -		return err;
> -	}
> +	if (err)
> +		goto free_verifier_state;
> =20
>  	cur->parent =3D new;
>  	cur->first_insn_idx =3D insn_idx;
> @@ -1588,4 +1583,9 @@ int bpf_is_state_visited(struct bpf_verifier_env *e=
nv, int insn_idx)
>  	bpf_clear_jmp_history(cur);
>  	list_add(&new_sl->node, head);
>  	return 0;
> +
> +free_verifier_state:
> +	bpf_free_verifier_state(new, false);
> +	kfree(new_sl);
> +	return err;
>  }

