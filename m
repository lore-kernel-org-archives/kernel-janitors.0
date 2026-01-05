Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A89519E839
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Jan 2026 13:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767618157; cv=none; b=cOGS6GYDbvf/JC15TjXW8MzrxsUDqNmjCvSeoc8vsSxMtE7mtiSK7nsaupvHLcCs6p8eeMskkf/6jHupCTuKwJIQAEArUQDJdznEkzs6RKUaq9KBWbKc8Q48Qax3stx9r0lcMQDgjdTf0+mDfV7gxmlJZCBa5uc7+4JabQX8g7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767618157; c=relaxed/simple;
	bh=zPIn+Tn5kz4z2SuMtugXJxRMVePJH7to7FateEIe7+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvfEgi7Km30ohLSA4A1iFI5Qs7LxqX6KQMljdNYXS76XPSFO/yImNIEIDtkFmeSczYz0Hse0B0BkQ5hNmiIP3gs0NGp+DXXs/eciALieC5LfyvHKhq1EsdIF4NpB6ItamBIDpqVHuk3iOVJQHEumRWQ8wJFMZp+Na/dN8FiyucI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WOYpKWyl; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WOYpKWyl"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-3e80c483a13so9369920fac.2
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Jan 2026 05:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767618154; x=1768222954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7LgAIEr8YY2wy2aAQMBCTti2X4ob2jrv84eqDNVh4g=;
        b=WOYpKWylinv/cOm5N3rp60xUcxIdBT6Dcji4EaqhmVqOvUp0UAEMlcZ9j9CzbzVvZB
         jc0xdTcqvKg0vIDEotcqGwq845wnXNpX7doHT0/6O18mJjg9CmUEqrbEZYxWZqvfxQH6
         8/4p8qtOv9V71LCQjhSCuHKx5lD4D5eqhD2vEVmwFHBvIBqPqJCxvat8HBV3PU3uZOkU
         EDlIYwkED4GFp/4uhtVHKrK/GxXg0gqjEr2g6hj/3PZj11+KGSIcOyVwffn51xs+hc8G
         CsKdvD19aLd+rUYeHXParrvoKz1iErEN4re86Ho1G3UzvrAvdIdogw2aJ8Vk9QbI3QDu
         pi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767618154; x=1768222954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D7LgAIEr8YY2wy2aAQMBCTti2X4ob2jrv84eqDNVh4g=;
        b=ocO+euV7Oy7LLpKjpFo8OFhIzePVkEhVACiUANABvQgYHZ/VKDT9MNp7thWD6dizxx
         CgpYruQDhc15+nyxD9s5t0PBHoKQoZ/wkdcZ2h0k3l1u4brfnk2r+2Tvki34eFzIoH5K
         VxVnqyXTk0tnRhBrDUeoIXu/Rkq385sdUsrD+ho/5W3NHcA0qGZiiiKhY+PW34s8w5di
         JxSntI1ebn9TXB3PLgf4U/mOqOkajPdXi86a9gSNdgeaSHw4qCKI25a2U0PFRvhUa3Q8
         X158CnVkctxucxjjb4iOchZWT68YLQGjDnN2w56QEO6hFpthg3BoUJaMdmt9IilXlYQO
         j2sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi9gMbcylqkz9OXBSEtsXF+HWKF4VUSsMyLiWerUwtakaZqXAKOdoc3z+pbUSQQSKzLeEalsUyVwhwB51jTu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQfta3KESyUgSXk92cqvH54OlokNV4GN0xbuUB9lpSW7NF4ByO
	sXTIb39XwZmEImKyEzhuEHfT2pjsrxoNhbSsYKQ6gC4u+ZsYPjNUdlceEJwFrcTs6Rkcx36nGYS
	x0E5XejqKo8hSIy6uH+5v8/UYbTwqqtalIve1DxaH/m5mpbjqH9fwzIY=
X-Gm-Gg: AY/fxX4Sk7mRumfG21SxAmmrJlVFhMhEd422M/9WSLnHVZnMgBaTLtLF95T3ytzP/E5
	smkHdPk3/vlqElCgKtWgr97oC8mThG7vD5AvhgvwGcONU1LKWR/26ncjC3ihFqFZQzN8/xmCpRx
	2598qz/rPE84KDPex9+YF4iydPElkKwftP01FrnRkD4BPHDuuPz/MAphq5/5y+xWUhfPXGu5Z9K
	bJiPnKV+6SnZN1ThbN9pyQWesSk9+GNOFAGfKvvCIpFaMouN7FyhRTE/uXFSqrwrzsDPU4byNrZ
	D88j5cngXYj4L2OMf9mw8eHSOQ==
X-Google-Smtp-Source: AGHT+IGSdC8qsdAKu5ru6Aqg3TzzWVkfF+sr9jAmlpE4HPxf5+amN/kO6shS2uyDYWvG1XvnJ5TmpGLBv7uaxQYhnOs=
X-Received: by 2002:a4a:b28b:0:b0:65d:6ed:e05c with SMTP id
 006d021491bc7-65d0eaf0753mr15500862eaf.64.1767618154208; Mon, 05 Jan 2026
 05:02:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104170119.291968-1-Julia.Lawall@inria.fr> <aVtLiJBGovTFhjcc@sumit-xelite>
In-Reply-To: <aVtLiJBGovTFhjcc@sumit-xelite>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 Jan 2026 14:02:22 +0100
X-Gm-Features: AQt7F2qR-cBchafQDBWcJWzZf_cNqYuIg9WzkjXjE-TKI_7xtVDxWGu15riHjhg
Message-ID: <CAHUa44FVWUJefkA_xmNzX1ibFxgtinSgPqUx_p+HfuKPGQv-5A@mail.gmail.com>
Subject: Re: [PATCH] optee: update outdated comment
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, kernel-janitors@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 6:26=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Sun, Jan 04, 2026 at 06:01:19PM +0100, Julia Lawall wrote:
> > The function cmd_alloc_suppl() was renamed as
> > optee_rpc_cmd_alloc_suppl() in commit c51a564a5b48
> > ("optee: isolate smc abi").  Update the comment
> > accordingly.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> >
> > ---
> >  drivers/tee/optee/rpc.c |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

I'm picking up this.

Thanks,
Jens
