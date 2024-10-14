Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950CC1A7ADE
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 12:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728910426; cv=none; b=rDokeBgwvq8xS6uOcjNpfGgxW5qFXEQHPBAMzrDZwEKF1Fy6/sjD89TKDUAwg6c8xm7gHJnE/dyrSAD2jmzEpLmGvjHW80jJZXIrvS0wNaL2LNGzRhzzO2ISSqIUdGj2lvPoKobyDZTmOa8KGddJMvYa8osHMpgk8V0ZCeFZSg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728910426; c=relaxed/simple;
	bh=+pcu92eMqg+NHXSehZfy3gPTkISBMTAQR/PVez1N+qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFWZ43UdC6dDQMT2V40qkIyA+6AehzuY26asacsnb8uGHredm1LnbkLy+D+J8Y1LJPRQ7yTkIYejo4Kut0aetnlRm3ITQwIPntlE87XFtVgMAuAN1YaT9PsSHSgNnl4fC3eu/cUSk8U0veuG2Eg1rzdEOHl47U3DeHPAW46j4xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U7avgCd2; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7avgCd2"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a994ecf79e7so668263466b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 05:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728910423; x=1729515223; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SyCHsuV/E8d70gfcK9ip53tgwN234YxCxe5zH8xLMPY=;
        b=U7avgCd2Kq1XxkEYlk4PupuY4CHxpsGoPm4vKOF28tPALoNUKrgikVf5GGJ+wx5Nef
         QtEA7ezPL+11HILyzfSu04/bPDphbjGhGLO6sBINBPdulB5rxnC9/Lt5xX3TDAIr/G3R
         3b0iYAfgibyIYxkfJHDz21fztzlUeniDmMkTY8VOw6LYxRmAw2BcGMTFGtIFaSyW80TX
         dqmg9VM/kliZkHjzW7mVfzpbsr9DVNDS5flwgBNMGrkgxlTCnjZxe7FJ+GmO5W0ynO3n
         Kt1UmcV6GzF/zgslKdCfTpf5+0wzHlLcYlcKTCWZu7XOHIEwqIKnMqQbHyA2qTRb58cO
         RWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728910423; x=1729515223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyCHsuV/E8d70gfcK9ip53tgwN234YxCxe5zH8xLMPY=;
        b=GgWTKn+3KowmkpRrYklb/agpd0ADi6hgRCK61p0oQLBNZxv6ih2dOR1TbG5n0FP+27
         0OYQVnHJkriDr6TIkTe+eEuzHTBMR8fR+RBa3vi6Zj4H0zYPC1EQH0jImUHNfNuibr97
         mteR5iBnLs+wMWiU8hH91lnZo5+YD1tEWxDycMDat82UzW4bkbYwD7n0RHhcLORXRcb2
         WIjQP1ax4eVlzn4X7246Po1OojPHRdyDz0hzG7kJFzUNyQ1pJcuRrt8WS+noF6w8krSb
         EAET6Frgt4KZVbAxLqe6FoqBtgKDIqLCSQGWmltFAseRW+v86oaqcv8Jp96EKrxuLVgN
         Lnbg==
X-Forwarded-Encrypted: i=1; AJvYcCUCtCYOlgR4ApLu5CLulOyzbWk1HPfZNre72ucUpGaXndkv71OR7UYGFLMeklS1J9/gGs8Fx+9/ht1MkUbYUlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ6mBa78mUcD8brAvvtKU0y0TZBLNWSm71ihcP4bJSZ0JE1vCR
	vm33gTFsyOSybzYgmc6SqBR37yEO/IfxJJrdyqnNAVYxNafpWKlLyUIFZxAogu0=
X-Google-Smtp-Source: AGHT+IHqHcsA+FZtp+v7kI5pgeIQE8uQgQTumNO5wX6KZkk6/bkHGwus6vrXYrx9c73EQIuXhgDQGA==
X-Received: by 2002:a17:906:c14c:b0:a99:6163:d4f8 with SMTP id a640c23a62f3a-a99b966b148mr1069583166b.58.1728910422787;
        Mon, 14 Oct 2024 05:53:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f375db53sm303654866b.113.2024.10.14.05.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 05:53:42 -0700 (PDT)
Date: Mon, 14 Oct 2024 15:53:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: sfrench@samba.org, pc@manguebit.com, ronniesahlberg@gmail.com,
	sprasad@microsoft.com, stfrench@microsoft.com, tom@talpey.com,
	bharathsm@microsoft.com, nathan@kernel.org, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] smb: client: fix possible double free in smb2_set_ea()
Message-ID: <8bd0fae3-82fe-41c4-a4e8-3c28aa2b1826@stanley.mountain>
References: <20241014113416.2280986-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241014113416.2280986-1-suhui@nfschina.com>

On Mon, Oct 14, 2024 at 07:34:17PM +0800, Su Hui wrote:
> Clang static checker(scan-build) warning：
> fs/smb/client/smb2ops.c:1304:2: Attempt to free released memory.
>  1304 |         kfree(ea);
>       |         ^~~~~~~~~
> 
> There is a double free in such case:
> 'ea is initialized to NULL' -> 'first successful memory allocation for
> ea' -> 'something failed, goto sea_exit' -> 'first memory release for ea'
> -> 'goto replay_again' -> 'second goto sea_exit before allocate memory
> for ea' -> 'second memory release for ea resulted in double free'.
> 
> Assign NULL value to 'ea' after 'kfree(ea)', it can fix this double free
> problem.
> 
> Fixes: 4f1fffa23769 ("cifs: commands that are retried should have replay flag set")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  fs/smb/client/smb2ops.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 6b385fce3f2a..5b42b352b703 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -1302,6 +1302,7 @@ smb2_set_ea(const unsigned int xid, struct cifs_tcon *tcon,
>  
>   sea_exit:
>  	kfree(ea);
> +	ea = NULL;

That's very clever.  But I think that it would be better to do the "ea = NULL"
near to the replay_again label.  There are some lines where we re-initialize
resp_buftype[], utf16_path and vars etc.

	ea = NULL;
	resp_buftype[0] = resp_buftype[1] = resp_buftype[2] = CIFS_NO_BUFFER;

regards,
dan carpenter

