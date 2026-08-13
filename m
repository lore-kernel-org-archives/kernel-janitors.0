Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425A53BCD02
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 22:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658814; cv=pass; b=SoMBZ+YTBF6TjuanyFSLK5BmzMvFQM2mFbSJMxfZl/V/xSQ5I8v2mJ56nNHOowNWlFO7WajeOIwbG1qO80PBff+RHlwalTMGm5tDZ5RNwxXhyYwQeIZx33ZJJ/t0/LDWTa/yTimJxymhl/Dg4Dyu8QjC+wIs1cRNEFN8sHfNG1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658814; c=relaxed/simple;
	bh=qRmz8k6sXK/ER/gcHUFE4e0+JlpkSGRojfQ+9B7tXcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIfgPx5C7het86L/ENZ44xt7n0DT8+ULdZoIFHT35XTt1YHQuRn8Lr3xO3Gqo7eXbssGQvPx9ckAoykzyPP/m6gsRAOUpARVPiXMiHzeM8E3nbcFzFI3WP8DAyCf3uau8GQm128kessMxCareQSUMwA2VQYGXVQaVtZpU5sfAS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLAW/GGo; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLAW/GGo"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a386a34603so620357a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 15:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786658811; cv=none;
        d=google.com; s=arc-20260327;
        b=itDp3cdNBc2S++z0V7dKU6Te2ssvZkwqKc0K00b+g57uYgmUIIfp8/chj9gvxK4yGn
         sV3WGdzStGXCVgryRr5/g6mRCzg6bA92Xg9qcz18fAEIpnlCokfUUuV3QhTkPgdkIV6A
         ojZxXBEiNRdqRVMYx0JNoFgG9ewE30WdZ37qm6hZjrevdutf4fDxKsPTWfHl0+U7AdI+
         4EvM19JOjT6H0rVFbIzFjAMiSI/WABHJ+Ey5M0rO5dHo4lOYLn297wvARcDkdQopDCOa
         L32/E69DAdcVkPV+R5JgRC96VuXO6hoc3VtoTzMKFubb+rvYjZXtirYUpkaaju3V+n87
         euBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qRmz8k6sXK/ER/gcHUFE4e0+JlpkSGRojfQ+9B7tXcE=;
        fh=H1JQS+SNDrDadkuYzOTepcQf9EALgAb/EWaUR7TOjoc=;
        b=WWEsRnGUsaOWWHP69US7tT3oCq+DahlpLmzc9El9EFX9n25OdnxgNlsLNbVaLlYn8k
         /kmokSZurt8ygx2DBE2ynveCAe2KNaE6G05bNa0N0VIdUqWkQUEd1J6XRiSEkPZrl7hu
         NjIeWLL861PXAtB8bECeLpNgSfc7WR6aqu4fz4x1qOtg0T8T+FKQxKk5uw0pOoiJwYrP
         OsmTwVWEpNHJ8x7DtIpMQ6vNYj2Xx5nD+6BkMRMSOSa6kuO0EAynYf3kRxGYQWkNtWNH
         TxeG5rhrRPgGdgy7R/N1L48w9axp9DfNFwHO/bG+zqcsLQAKugEZlPvqdRQkm30GHSfU
         mdbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786658811; x=1787263611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qRmz8k6sXK/ER/gcHUFE4e0+JlpkSGRojfQ+9B7tXcE=;
        b=mLAW/GGoB/ceQU9/ZpdHyhMxHy0B9FdpzFlIR2AHC/0Fjt4/j8bGWnxmLoExP1oVNR
         6eVy0tmYcjEdU7D/kVrtwFgvRjcX/n21uGaY+i4QsH89sfN5cuGtolZFUo1oGWMNqgdx
         Q/SIjrgXcTGxUhxovDhZKK4y2//mXHQIYe4hayWI9fBHEYVWf/Fjrs0UdqofE+BybvPy
         JD4c0Dkd7FN5reqT8yNrtEZQyE+RtVeE20A19qN9hTlZuLHcWnzcrfc9BjyRUsKt4fCW
         AfBmFfI8rpBZts9rHN3QI0yAizO/ptvAvps2NQOT4S/BCbiaxDYqfHqbiBm3SLUAXjhZ
         Sziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786658811; x=1787263611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRmz8k6sXK/ER/gcHUFE4e0+JlpkSGRojfQ+9B7tXcE=;
        b=ev6U/+4401OL2da4QzQAsc+IkeUDL5QVBafXVsBbnDzTb05jXDRKTV2FCWcADDEe+9
         uwhXJzLiJ+pGd2O1n9q1qljY4AWnmbCwjoLiUZv+5xpqjCh8+c5QgKBN6kynuvVOLHTt
         XM3tzgGOEVvGs2ZkQplcdwAEgcEVM1uZ73hISPuzr4Wbj76kjXDqXfPiMqlXYeTSLwO6
         Ykj0JDw0gSpeQyKlBnoI3sMuUZ27MjGRutCS7pvcBuUM6hKjsH0CE4EgSFIsUM7+b+Px
         ReqUwwYHdP2JbnN43eRQXumL5GG+QWNEwh9850XwZujH/JHvQSS1a0HpEEAsloyePXX9
         DnEg==
X-Forwarded-Encrypted: i=1; AHgh+RqMchI+YnADnK5C3BmtyhEJYpRFIgTVCN8jGxE+55pVJqGbvSIVm+/1Kfpuzq0UeQeuixquIn1auza7MlZAAJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNNYTFj6B1eak9GV5KrkBcWNJumGwHy8P5z6YLJ2gfRFxqF/eA
	m5SxNY87qsOrYFMgMMko/pRvRZOJaNZXk5wVcmRtjYvD5pWYZrqR0uv/JcUPQzjBfeQgcnHBuMN
	DRCk3wNv5U637XE9FlqW6CMHKURt8Yu3+mQ==
X-Gm-Gg: AR+sD10mVjVnwxA7B0qtiSBgMQysdHNlRnoemj4RFyT2/Ztwa7Yu7jpnBCtiS4xS8vT
	+rItEhDjIDhmK9rlvsJNhSGUoDqCoV4OqFe3DQ0LRKkfXV/HADV1KpFqKNlkiCIWReRYKcpMjmW
	MtlTuPssk+woe/pKqN34VlFVIyZh7lOQLDqcMPBGzU+HOEFFVD0xCkG4xL1iz87GRdUhHlVY0Jb
	3Gv72jsE7Qnkl3STtsM0XbNnEzR2CpMK7NmzdjkDl4fK7uHMJR4UUUF2Fak58XnAZNCBiYMAIHO
	X/4YuHK6EhTH/q1A4Jh1wcvGcYbXoXec7KJkkTZzstYdLKYwxA+K6A5Ox7thjXMmuJL0F7gsZ0x
	4d/T1gRAEvlbdw8d481YdjnyPhM/l5QXZEthxLvzqxkNCtNJfSAwbr8uavi2TVUo1BuDQnCEtGv
	PVwv/Xou+XoxC9jwuFPwu//UuIyB0MTklyVktJj7PrsxUQWo6++wPQ2f7Qj/gokXCAgw==
X-Received: by 2002:a05:6402:5415:b0:6a0:de1e:c4c4 with SMTP id
 4fb4d7f45d1cf-6a38af28b64mr579658a12.10.1786658811142; Thu, 13 Aug 2026
 15:06:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304041602.7539-1-rosenp@gmail.com> <e46362c2-085d-4083-96a3-3e289553d1e2@web.de>
In-Reply-To: <e46362c2-085d-4083-96a3-3e289553d1e2@web.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 13 Aug 2026 15:06:39 -0700
X-Gm-Features: AUfX_mxxbLVhx8tsxha-zvWQSeZmObFIhjixo3B6Lj81UBPnX02Dtw-Ochv0CiU
Message-ID: <CAKxU2N8t5cEuEPUwVTU3Z3rpT9VufjUzenVxdNerVxgBoa_nsA@mail.gmail.com>
Subject: Re: [PATCH] phy: uniphier-usb3: no devm for nvmem_cell_get
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 2:44=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > There is absolutely no reason to extend the lifetime of nvmem_cell_get
> > to after removal of the driver. Use and free right after use.
>
> How do you think about to increase the application of scope-based resourc=
e management?
I don't really like it.
>
> Regards,
> Markus
