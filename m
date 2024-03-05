Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC9C1EB33
	for <kernel-janitors@vger.kernel.org>; Tue,  5 Mar 2024 22:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709677885; cv=none; b=YqguRzkGl0B7ChsZiBo8RN2EyWVMEZnZM1sCuPfziLuLfFIFzr/GIuOcPRP2oa7oPHrCeDSZYzEDZzcIFq6XD5HaxrIIAWQ3/eeX7hPyHC0vLKa2qvu+6KKTCaqoqvUsniQaPLRLY/jzXSBYBhgI1ynPo3znSKagjWAvleLN0lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709677885; c=relaxed/simple;
	bh=8VOncNDoPnogsQjT7QBH2fN2TMxTfohYSvJOvw4csSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGFiUj+CVfmVYwgnK7INVCiU0Bj9uzU3ZTwK7PXxCkyrPy7V24eRD1fcuUY2GHKJv1iCmX+Kb7nCvqxDl8SNmudlsl61V3jnq00imif46mBUwGYUtjbzdEqbcbhLXwleE0aBP1q6hGW2QU9VZFgcBGEzMVYvF2DvyloX/bLmba8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rZwb5PNu; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rZwb5PNu"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso387902276.0
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Mar 2024 14:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709677882; x=1710282682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VOncNDoPnogsQjT7QBH2fN2TMxTfohYSvJOvw4csSc=;
        b=rZwb5PNu6PJmhJ/AaZq+G4o5E0PrdgREBeu+aN0x7PgyVkJips8Y47CXKtjsn5hTCc
         fMDvzMGKZxwOH5t5OQa2/7ZHVkgq9IrjmOls/XjlZhKSw7x5peBfPfukaEK8BZ2bIxzv
         R3SzR25rRLj693Vm6VgOF2+qO8zapgWnfPi32SXKnten1i7nd7cIfpwUAkL2egptYzFc
         p/k8ckfFbWvp5NOjhOBxMuGYpjTBG1K4/vptNiepbLWfcgXGKqh+XfLE+bL4WweAHo36
         Pr+9EYOSJW8VGPdBVh1VjEnGdwXyUSBvVk5PYULSc6ymRAQC65g6LMBxcX5hCxh+Jpsq
         Rhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709677882; x=1710282682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VOncNDoPnogsQjT7QBH2fN2TMxTfohYSvJOvw4csSc=;
        b=gvIBRfiWGzMcxgTdJ62Pp7+gHOflHA45Y5maykWAKM5zYe5iUCTXZTBIch6Knan6oU
         xV0J5/z6GB30U66VPzlr4jlGgf3uPkrKc1xeyVm5UUjHQ1rIv3ZqQ6dSNQ6ql+9N40kW
         avN4zmYzuUHWIolh59Ui9uZ6y0TyZrypL2fAannYMrB0wrUws+WcBeiRkUrW+28SM1+r
         I3q+VUOryDNQpgTVQCN3G6HQFH/5cMd0BDUCy5KPKSGlbQTAoXderidTrNcBsJL1bWRI
         KKYbogQCAXtJW3YjPZkhSwZCYF56HejWQ9YgAx2L+pmbcRt5YRRLiUnt1xgLxbpZLxsQ
         HnUg==
X-Forwarded-Encrypted: i=1; AJvYcCWmGCevA/hPtYuT/R5rc/YBsNnv4rbdOzqJvODdu8Ibd+FOFE+c+5ghFdNAZQpcZa4L6gvykHs1gm3Vg4UL+ryBPoR8/rj3FRyrDQIg0QdD
X-Gm-Message-State: AOJu0YxXgLWhe8RPvZ5bTtxdBHnKOfBYEaA/Ybvovwa/C6onqnXFh6cX
	qefJCN1GRZUo0CXpfRO7RfMxFoDYrKZo8IR9nmECxbz5b42VTQSh85CoBt8LaOOU87B+IXMJzYS
	1CLWlmyIV0jxvrUKmBEdbh3SKW9xpAjtHzoIHDg==
X-Google-Smtp-Source: AGHT+IF9dXriRrb9Lh3vYkfxQ5LtET+YT0dRcnAx1IvHbPH1UtOmbcKtw01CNNan7lkkJNr0071ozDuqrzF8FlUzn7Y=
X-Received: by 2002:a25:ad5a:0:b0:dcb:fb49:cb93 with SMTP id
 l26-20020a25ad5a000000b00dcbfb49cb93mr9732877ybe.45.1709677882455; Tue, 05
 Mar 2024 14:31:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <533a7a10-c6eb-4ebe-adf1-f8dc95ae8d33@moroto.mountain>
In-Reply-To: <533a7a10-c6eb-4ebe-adf1-f8dc95ae8d33@moroto.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Mar 2024 23:31:11 +0100
Message-ID: <CACRpkdb5dnk29FkwP3TF-frN2V6xXXm9tq6_Xo4sTzSQ2NsV4w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: core: comment that pinctrl_add_gpio_range() is deprecated
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 8:05=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:

> The pinctrl_add_gpio_range() function is deprecated add a comment so
> people don't accidentally use it in new code.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks Dan,
patch applied!

Yours,
Linus Walleij
