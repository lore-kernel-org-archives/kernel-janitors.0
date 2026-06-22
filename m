Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C2A15E5DC
	for <kernel-janitors@vger.kernel.org>; Mon, 22 Jun 2026 01:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782090378; cv=pass; b=fJ4TlNixiBWuC413n43HxT6lAF2Q3VYrzr+5ZR9GAjkKEBgBSvfMv4h+ONGk7fD7S9mlWdHnz8dkFPS26riiTSqGC1Q7IJE7r1GOKtsodlM7C98Txknet60t6aM1QjBWhkLBAz45jdG9ItT2khGBtcrnEtzsDO9OtcY2yIdYtEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782090378; c=relaxed/simple;
	bh=fa78JVsUMI/xMlejN1x+mciKuyDJGoN/339ipw+N1ZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbhHUkwjkcW7V9nQImWduiLLMiY4jWY06PPtogKqUevXMZIs74tJqPtH+gbh0Yj1xZcYVBamcClolzhiYzTibI0kCH+E8RmFRtBbGN1wyJV4r7CqM3gaTpliBeZbK4qu3DruEEiBFGQIRDYULK90RoP91JKt2CwmbVnTa2muD0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wz6pmMC1; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wz6pmMC1"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c892935bcdeso1436273a12.3
        for <kernel-janitors@vger.kernel.org>; Sun, 21 Jun 2026 18:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782090376; cv=none;
        d=google.com; s=arc-20240605;
        b=UpDwKZzg5elDy9WuL/mZOsMZND0xZP7sKyRIs+5IaeY6llvG7d8/5lRoaN5Pvg0ukx
         yqBOuPlYEmuCmmfYDek5EUBLfA61ICKBRye3cP41XyojoAB9U1rlZipBnJv9neEpEFKl
         fUUdxFNNDPm4YAdlXeXNeFc6fKMricjkZKwoWxl6ws9YBqjFGPyJsvEibCDHxe+8f9Zu
         K+NKpPz9yjgGoX67oiPKG+fvP9f6RgAmFGUWFpSpk+SOsKCmvssGx0LdXGWG5g5lAyS5
         2nxXfFsNmr3GAbAvMnkBO5QWpEBJFMMyA7S6Zant/uJ4dGjF+aKWetibAG3I1BtM8Mv1
         VInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UxkCtHGSizaetEhdwRDWvcIIrU2C1fVFPinUW6ftVtE=;
        fh=VYHJYzyxStU7PKxZ+0Lo0c3ErcJ+KRBgJJ48UZK00js=;
        b=luSFlekJvLkLoTZTQra5h9x+A1cFJt6UIbnp9qglO7DTomdtsOFnKFYwJoC9XL2Suj
         /0/M04KarymjF8sD0ZI7hqzzuHIU9Qbdo6/oFeXrR8p4nP8JLIGkgdy4OJO1tzq7c+ZS
         3xfLGgynehbGPnOy8Izgf2xDRzSCpU3oToF1ZLXvww36F/Nc93EgK7nVK96S/+pliLsm
         /6o14JyqDTTB9klZoIuhJUuEuR6Kb2Zkcycte81P7k9FgRb2a7MzgrqO/NEmRQH5u4A7
         B1Apt364sNa79VSQQOzFXbVBJi7xM0UGmBotqcLI4c8gsHgskpBGxK7izHLTyrNVcgAw
         9ZnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782090376; x=1782695176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxkCtHGSizaetEhdwRDWvcIIrU2C1fVFPinUW6ftVtE=;
        b=Wz6pmMC1wBXmWW7rBhhJ4GmHEQpBQ0u0+Hc4ba5StjkrThkvwSIggdVhhIggywLIy6
         GZgRMV2XBTY9YkIhJ8sfjmaz+i1Od56U+2Hq/PnCMQhND0NHd9UBJy6j3jzJhh83Wgks
         56mhZKwKsMg4Lt861XmqGCJ1tpYSyvvhxMN5Y/rsKnIf7HUbyTs4WZ8F58YvP2+5OAFr
         1rpeFOTGykWjZ2o9/NJrC59kkvFpqNrViHnKkbtJdLEVnawVDS2jKYI+/eWVdpkIOqY0
         NsirLSd6Fx9NMmx4usLJJH/A95Ya9qF0JPlRgoIQMR0rIna+RlMgOyQBAKR0u9FFYE4A
         JgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782090376; x=1782695176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxkCtHGSizaetEhdwRDWvcIIrU2C1fVFPinUW6ftVtE=;
        b=F/PQV6Ofp5wyB179uV5gQf7xbdnCSyvN0URs4fPcJkhewPatrgBWAGIagYqeArDi6/
         qf8k3pPrmwWDv3FxK/gCmqWyZatVH/LJ7k6vjcvejtur8tAt1J4d2cLBOzDQkE2PjxJH
         c7w1axkRTs6d9RZrAOXNghlMeJxhMz5mx4I7G8TPUP6Gv+HrZ8ks7i6MjLwgMfHQLHq+
         geANhTwUD4CFow/sW6EQ75KbVtTcAcTuqgygfkX8B6OgatppuWP6L79BBZoaMeqGhzwH
         tiIwBkvG1N6WOunKOQh1rQHfizJSrTA1U+mKn90Wj1qF/RNffdgjyQ9urjK0IsC19FJH
         yrDw==
X-Forwarded-Encrypted: i=1; AFNElJ9y1n8IaYUhYrPBGJF1BFuq+mLIGu3zfkqbQR37JAoJOrD5X2Q1WoJxlRt22mJ0L66kkXrfCvwVl8kLe2j1Kik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkzXw2yFB/IcDl/9EmKl3zZUwfgEypcrEb48c/g1bMq+Zz9rHB
	HZQjJOyE6wgFSzJkwfVkYQXC1zypjjBoBsHQP0y3+LyisUFeZp9k8ffGyM8Jhl2Vfn8xdUkBaeI
	0L1EWORX8DHV4AqwZzDGT9p1Il3ew0OQ=
X-Gm-Gg: AfdE7ckkz7iHQPHCWQCq1+2QjGZAOn4pdHJ2QrdqBueSYywvw1x5eAQ9X6XBGtR3kF+
	YLagTrZieHArk9lTnyLsFgK5pcirSD8QE/td8zz75T2FYvvNCDfzE3JXQ5cXHiGNO0jYMrzamc9
	CJ/klzMNoPFraAj8jDrnB21/+QuRWHBVbBZzOntfP3BhM48uF5hpHyxQNCzM202cgb/cdPbWqzK
	XwRIzNcZpq79SfqU+93N8AsZRgmIPGwcCorlOXgUuUQZXZykjw6xl0pTqkwHTYdKR1VyaX9PwoJ
	8o84qO2Tmae4D7uelzgGPoych+XpVds3fEhExdX1w6b1tRYCe7LHx0xLHVwzUzF6cTssP164aI4
	o/n+3l6gRFhPgPQ==
X-Received: by 2002:a05:6a21:3418:b0:3b3:be1f:c89b with SMTP id
 adf61e73a8af0-3bb3506226amr14656757637.22.1782090376108; Sun, 21 Jun 2026
 18:06:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d6622225-c765-4d9f-9501-1021df4687a4@web.de> <DJBL1JEE322B.28EZ7GUNTJP99@etsalapatis.com>
 <451a504c-d7c5-4cbd-9184-25156f2fc581@web.de>
In-Reply-To: <451a504c-d7c5-4cbd-9184-25156f2fc581@web.de>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 21 Jun 2026 18:06:02 -0700
X-Gm-Features: AVVi8Cd-8AdTmn982XzsO0dW10ZgSbyAUBqwwZ3qatqgAJZM5UtAYhTCqXHQ1Ow
Message-ID: <CAADnVQL060PFApJ++juj5S6H8OQGFUHCepavrRrizh0ciBtiqw@mail.gmail.com>
Subject: Re: [PATCH RESEND bpf-next] bpf: Use common error handling code in bpf_is_state_visited()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Eduard Zingerman <eddyz87@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 12:55=E2=80=AFPM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 17 Jun 2026 21:15:08 +0200
>
> Use an additional label so that a bit of exception handling can be better
> reused at the end of this function implementation.
>
> This issue was detected by using the Coccinelle software.
>
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
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
>         /* add new state to the head of linked list */
>         new =3D &new_sl->state;
>         err =3D bpf_copy_verifier_state(new, cur);
> -       if (err) {
> -               bpf_free_verifier_state(new, false);
> -               kfree(new_sl);
> -               return err;
> -       }
> +       if (err)
> +               goto free_verifier_state;
> +
>         new->insn_idx =3D insn_idx;
>         verifier_bug_if(new->branches !=3D 1, env,
>                         "%s:branches_to_explore=3D%d insn %d",
>                         __func__, new->branches, insn_idx);
>         err =3D maybe_enter_scc(env, new);
> -       if (err) {
> -               bpf_free_verifier_state(new, false);
> -               kfree(new_sl);
> -               return err;
> -       }
> +       if (err)
> +               goto free_verifier_state;
>
>         cur->parent =3D new;
>         cur->first_insn_idx =3D insn_idx;
> @@ -1588,4 +1583,9 @@ int bpf_is_state_visited(struct bpf_verifier_env *e=
nv, int insn_idx)
>         bpf_clear_jmp_history(cur);
>         list_add(&new_sl->node, head);
>         return 0;
> +
> +free_verifier_state:
> +       bpf_free_verifier_state(new, false);
> +       kfree(new_sl);
> +       return err;

This function is full of 'goto's already.
I prefer to keep the code as-is.
