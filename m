Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73207241E6
	for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709106716; cv=none; b=gZFlLN928MKs5Pzpbuvx3eLDcLO4DGHDMwnjIhwZhy0TIspvIE+/2pWcYsbRNTGm0gyEjU/geXaz8oVjcC7Vm110YJfiaKr4Lb8JaXBw4HjIO+z7+E2fToX93B0M/KTKQSwt7Sk4D7jUNT5Gv+ioBBKDKn4lWscuYQ9z4yNqsZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709106716; c=relaxed/simple;
	bh=EFyY82Ys/yVpN4kZpBD/0yBYrBRn8veUJKTesIAzz48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBFFiuPnkws24vSqbwAtVLVNkPeLiBYO50ZciZR9F2XSHMAK8JXOHcFPopkG5ajHNFsKMjVDdjY2Fasie6k5R+Uzmrc7eWPcKV/FKsPenAaOvsmYeRta0MfzmOivQHfY6XEtmOraTBAFHS8V5JFd7dxjMoF9v90iY0n1whBstC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=G0dwp5Y7; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="G0dwp5Y7"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3e552eff09so567041266b.3
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Feb 2024 23:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1709106713; x=1709711513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AAtlA/kS/1yjrODzNnvXMEbo1KoT3kbP7fHuE5JKJgo=;
        b=G0dwp5Y7c+u9/TN92qiM2+1+8Q1TePfcGV9zp8DCqzBr9BYyyoEZRlVRClIkdZMlCa
         qSxxw64rzKEyFiNbvimPNoAycenmFtgmia+bUt2OA+gIAUiO562EooSllpECATqJaSi4
         zOKlovygxMBpSutMlotxIzvBQBCzLbB41kpIt6hcz9S6JSiVoJg4xP0gXPcBtA2XyTqp
         gMOuaFeSpWVaY8cPTe5tA0ovww5QfzLIgNCCYbyZjPf1o+UijxUAi6Z+lLfAEHabjtNt
         INGKTt5z95fKLVCd/nN9+gRhXk3ob7JQyfFPk5d90sSkpHadazCEdV1wLypSW6pgCFx1
         ZKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709106713; x=1709711513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAtlA/kS/1yjrODzNnvXMEbo1KoT3kbP7fHuE5JKJgo=;
        b=Lu2rdzjtJOlCLuyXS8Gym15D30jmkTkPF/zq8KACs+va4OSmRMxPHkwATOUt3+pQNH
         ff225g6Xh2stJlG4IRFJvfsLtcge0XwNv9/psUJI766jSzFoHw37Cgyiukezm9hEWC2f
         ZCZ0gjM4yIpeQZe+KRulzvzdOe7Z7CFXmtGNCduYad261rWrE5AtH/VhLLZxipZjeiXP
         iBxO1Sr+PJm/K4agFY9NET2ibQSq8z8oR7rxJrs5WkufVKvcLhuojLFg6buBEMXvbHyl
         E998zc5JotQQqWq2GlPWWiQZDSVD04l2QbbaxXvSPdZ1ALSEME1u/WQU5DxIwaiZA+IQ
         Zi8w==
X-Forwarded-Encrypted: i=1; AJvYcCXDYeGyYXX8KhEGnxixV6uxKVwbkp+78/0ybdE+euvyT3+OqyFq/0eDLZkaw6BJBwIH9Qk7ZnVu1pXQKodagfVg10sD+AnFml57mfgerw+z
X-Gm-Message-State: AOJu0Ywe1DGK1RJ4hNmiTqIi9sUgtbSb37lUhpVttHIj7PR0P/9J7A6x
	5AauRIr9uePVS1WPiUqWrKaYtx7hY/FyUGc83m/rO5YLH+TkSko8+DvCml8CeTs=
X-Google-Smtp-Source: AGHT+IFPr9ON0KIGYx74JKHiaaPAdKvkyKEZ4Fvnv37Yq5h537XaLhV/FJbYDW6gI/BWNQjThNmyaA==
X-Received: by 2002:a17:906:1949:b0:a43:3b2:bcf6 with SMTP id b9-20020a170906194900b00a4303b2bcf6mr7467544eje.14.1709106712780;
        Tue, 27 Feb 2024 23:51:52 -0800 (PST)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id i1-20020a1709061cc100b00a3efce660c2sm1561860ejh.198.2024.02.27.23.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 23:51:52 -0800 (PST)
Date: Wed, 28 Feb 2024 08:51:49 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Anderson <sean.anderson@seco.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: fman: Use common error handling code in dtsec_init()
Message-ID: <Zd7mFe3-kbqjGpxh@nanopsycho>
References: <9b879c8d-4c28-4748-acf6-18dc69d8ebdf@web.de>
 <20240227184657.76ec4e82@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227184657.76ec4e82@kernel.org>

Wed, Feb 28, 2024 at 03:46:57AM CET, kuba@kernel.org wrote:
>On Tue, 27 Feb 2024 14:14:52 +0100 Markus Elfring wrote:
>> Adjust jump targets so that a bit of exception handling can be better
>> reused at the end of this function implementation.
>
>Okay, but..
>
>>  .../net/ethernet/freescale/fman/fman_dtsec.c  | 19 +++++++++++--------
>>  1 file changed, 11 insertions(+), 8 deletions(-)
>
>..you've added more lines than you've removed so what's the point.

To have cleaner error path? Not always lines of code is the correct
indicator of patch quality :)


>-- 
>pw-bot: reject
>
