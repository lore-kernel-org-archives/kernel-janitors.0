Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F73E146000
	for <kernel-janitors@vger.kernel.org>; Tue, 27 Feb 2024 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709048565; cv=none; b=YqpX6a0XDU1KYKhacXPmjfU43wo4Mr9ztL/NceYM9bwiURdw/LSyk+CDud1SwKqpLbbOwTjDEyJoSwSoJhfbd19RB5pLa2hrCfTl3p/NInr7XZ2E+Hvo1N1olk56LDoK9wNEw2nD8A5buQlb0e04yTalMtb7fk3IUdjyrSiDqKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709048565; c=relaxed/simple;
	bh=qFVX7ym+8pOLQrofDsYET1wFA9cE78XMpoBIE1UuzvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMKOSryZdoTcTlq0elvn1E2NDoGHQihuXbTeYG72fDMYEY4u7ffHk+qmeDOhNdoamk66BGxV+0Ua0zYZGsb25vr/C1dwnUmz6yAUQEyz7KTTF3K8iMJGBzdfZDuq3maKl5KkelqvnUy/kQ0QRbM2Ppn38RuyNQ3ngRziNiUmRkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=kc0AXjOM; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="kc0AXjOM"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso69345701fa.2
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Feb 2024 07:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1709048562; x=1709653362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qFVX7ym+8pOLQrofDsYET1wFA9cE78XMpoBIE1UuzvQ=;
        b=kc0AXjOMhTIIjpR/zSVlShOiv70JeqMzv3MAz7GrKymHhSSYePl4CEcCSvlQyhEce9
         A46OQxNiq+/vLubE8h8MsR+rgnlwhqu94Sl1vQ3gCq/+gCP60U9yXpdhHrV/c5RE2IM0
         82JtZ4GQojirptZkyAwROsTKb78J5A1jw7G6da7GKVURmZg4sBnv7L6knSjMN8Q3g9vD
         nEQYb6OH55WH2pdQYuezhKTEuUOvR63NMFEUhbZUo+s8eWir9DdbFMrBLB4ST0yxa1ve
         T2j1KAOUQTNnDtfxW7lFOo0wxLKeBZviQQ307DGoRkDEEAS3y2UmYYFAvTrZn1QujB2A
         yRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709048562; x=1709653362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFVX7ym+8pOLQrofDsYET1wFA9cE78XMpoBIE1UuzvQ=;
        b=Vp77oS3TrHCCZJetUIriRXD3XQBNPJ5h7y3on81zkKU8wsVVq3U2kJv0q1juxfLrvG
         GwuHLj4re1OgnChWHARjeOrvPGnfqLCk2CNCAnRpyJziRDrsLOec8udL/MypN+uFh4pB
         3hKSE0oZ92DkzkmQghgGxv0UBTfSyk8q96zxONnVKvQIhqhMaTe9kIdqaxy+emiO6PwH
         RKhOS7/I1ukqjN5+UKmGrgJpvUMRoxnqZosQLH1TvkUZXoP35YoIAI1q6BURnMxMbuiv
         Cypb8S0N8O49b57Q3BgroobyoyDhVh1rvhV9QHrpCbyEGnVmiGtjoZjYpgZSeAKWjAPR
         nzpA==
X-Forwarded-Encrypted: i=1; AJvYcCXT8MgZ8iykai6xGqI2AQV3Dv7kRtxHuiIwM5UROeSFHu+wFPtHAfziUHwqOUkkURot+KtT3v53nR+p/2LYVW5UOJEGnbDOtFDWleAlKtp1
X-Gm-Message-State: AOJu0Yz7v2lHW9zEKXcN0J1q0A6CpRpnfFrxo7MuBhQa8Tol25g8xLqk
	/59D6W90pFYbtT4Q/7Cac0V50tZa/qhNiEkQlPYuBaQzn0dyvSa5UMpaFP44qJ2LyaFEmoV0rui
	u
X-Google-Smtp-Source: AGHT+IGftc1nRxlo3NEGi5ysAyh+KdodU1OSoGzfpLdwuYTGiDo6VZbLKgDDSZW/zITdmPT8UNKDIA==
X-Received: by 2002:a2e:9215:0:b0:2d2:91d1:a72c with SMTP id k21-20020a2e9215000000b002d291d1a72cmr2858451ljg.6.1709048561867;
        Tue, 27 Feb 2024 07:42:41 -0800 (PST)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600c451100b00412a2060d5esm8635353wmo.23.2024.02.27.07.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 07:42:41 -0800 (PST)
Date: Tue, 27 Feb 2024 16:42:38 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Anderson <sean.anderson@seco.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: fman: Use common error handling code in dtsec_init()
Message-ID: <Zd4C7kztg-eBqIQV@nanopsycho>
References: <9b879c8d-4c28-4748-acf6-18dc69d8ebdf@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b879c8d-4c28-4748-acf6-18dc69d8ebdf@web.de>

Tue, Feb 27, 2024 at 02:14:52PM CET, Markus.Elfring@web.de wrote:
>From: Markus Elfring <elfring@users.sourceforge.net>
>Date: Tue, 27 Feb 2024 14:05:25 +0100
>
>Adjust jump targets so that a bit of exception handling can be better
>reused at the end of this function implementation.
>
>Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>

Nit, next time please indicate the target tree in the patch subject
prefix: [patch net-next] xxx
