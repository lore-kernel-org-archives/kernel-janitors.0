Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OW6fy6XU"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D99B136
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 02:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701080737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZA1nFhs0OclwFV+JNDde8LIxfs9r7hNs3Xy7sP4jpzY=;
	b=OW6fy6XU5XZmWBACSaGO8coFRLpuIElkHHcAJYDgFyu9e9hONfuO3B3ephh7efOTeTMWEW
	tCNq8Q7VxBlRyBf4UcQiOOlckZN1B1opTn57AppR7DNThO4wKjwd41GLixMCRWhcJsW7+w
	sbtmdVFGIRszkEijhONQ9u2Ikh5uW4Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642--m1rsuCiOnifyNIufxO2zg-1; Mon, 27 Nov 2023 05:25:33 -0500
X-MC-Unique: -m1rsuCiOnifyNIufxO2zg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9fe081ac4b8so83341066b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 02:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080732; x=1701685532;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZA1nFhs0OclwFV+JNDde8LIxfs9r7hNs3Xy7sP4jpzY=;
        b=upZCUn9k/eYTpvflsVr++LI1H7k2HT1cZ2ia5Qb3V+S01bnne8tUh9Laq8LSdtcFEE
         DI807i3HKwmkJxx3U/8NR0zE0Yk6EQnLtNeA98WUwjlzyjm0ts9OHJzkcZjG1u+yW4PE
         mr3lp+feXgrseJ48UDBhInd6pQV1bIrwcoenCh1OFDLHgCiJpGszoNXgXBMDRrhNYA3w
         M4+6knbX33t56EHpSsFWHkpbfEbXbB8e6j+YAvcokc54duWfHN+lMuZfVK2Gk6z0H9GL
         OckTNZKn+T1zlu9gj/djyMi7HmI44tpKYiDHfhQ3GquMNIeU/One4/YeaolYhC5YdnbN
         MnuQ==
X-Gm-Message-State: AOJu0YwYAdWon/cwoyXzRS6SpeIo8YwNnwYRL+KuOpiqrV081PFHUnia
	QHUa+LZ1fEIxvAetYscLI97PzgxJ6rGOPDwbxQpf5Fyu8FubBN876BkjqDc7foteVTdY27CTPvr
	niFB7zII8OR22aMhcF4fVb5DoXukn
X-Received: by 2002:a17:906:5a8f:b0:a00:1acf:6fd2 with SMTP id l15-20020a1709065a8f00b00a001acf6fd2mr6782653ejq.6.1701080732574;
        Mon, 27 Nov 2023 02:25:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeKcndtCLYR26j5o6+zmpQ6DyJAi6+l0R/Qa4rCze0PYyzY5W87VbdL2kbGHS3jOSujk9NTQ==
X-Received: by 2002:a17:906:5a8f:b0:a00:1acf:6fd2 with SMTP id l15-20020a1709065a8f00b00a001acf6fd2mr6782643ejq.6.1701080732204;
        Mon, 27 Nov 2023 02:25:32 -0800 (PST)
Received: from gerbillo.redhat.com (host-87-11-7-253.retail.telecomitalia.it. [87.11.7.253])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b009c3828fec06sm5430486eje.81.2023.11.27.02.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:25:31 -0800 (PST)
Message-ID: <f5a633a8fb4fa0d4375d90e7c3797b016f494711.camel@redhat.com>
Subject: Re: [PATCH] net: make config lines follow common pattern
From: Paolo Abeni <pabeni@redhat.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Simon Horman <horms@verge.net.au>, Julian Anastasov
 <ja@ssi.bg>,  Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik
 <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, 
 netdev@vger.kernel.org, lvs-devel@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Nov 2023 11:25:30 +0100
In-Reply-To: <20231123111256.10757-1-lukas.bulwahn@gmail.com>
References: <20231123111256.10757-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2023-11-23 at 12:12 +0100, Lukas Bulwahn wrote:
> The Kconfig parser is quite relaxed when parsing config definition lines.
> However, there are just a few config definition lines that do not follow
> the common regular expression 'config [0-9A-Z]', i.e., there are only a f=
ew
> cases where config is not followed by exactly one whitespace.
>=20
> To simplify life for kernel developers that use basic regular expressions
> to find and extract kernel configs, make all config lines follow this
> common pattern.
>=20
> No functional change, just helpful stylistic clean-up.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

IMHO this is a bit too much noise for a small gain: simple REs can
match all the existing patterns with 100% accuracy.

I think this should be dropped.

Cheers,

Paolo

