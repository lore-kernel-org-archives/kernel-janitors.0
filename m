Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308443;
	b=iHRKmKCaS5VSR1NOM2Wmuh1vmhF+etFL2Xreza6H586pKj8yxzCO4TDcYJAvSaK6/JqL
	 8FPvzZJoPr2xCPlKgWeGRPN8yWHNfMB5o9pXL5fZHPJVkHmcd7yG4El2azL9YqT2M9lj3
	 ZtZbAf8KFDZR/81pZ96d4pG3HKoWslZJ06SVFoWyRsoRqFleWOxuj3gO9znuzYmBX5qd/
	 84ra3zaGFrhNc3D2aEGVmcskNGiBE00Z1gIeT8MNWKPqFXidfHWWtp0pfxMxJAbf9ywnV
	 zysV83IwONncgotVhNfFiUHOiUTVhyOJog53g0xmjI269cNghwtAX0E7QVgLBMIMMtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Wv2p26gpeUqh9YHe7IUFpRTwcMzkjGJ1jZc1lffjWFU=;
	b=Ta0kT6lnWTgKcypr1Koz2E6rH9C4pRqqWSVHxKA8osy78VRz3Q9AjPKOZdHDs7AXd/ER
	 7453iWT8uho/wNpcnAYMUm2ohrNe+Bq47sSyxlClBWhJSMxFfQHYpbsjnomDylHzsZylN
	 KXlDHJ08IJdUCN9fFP/5tgsvvx2MdwCVEzLYjqsfdID2hFDsBux1s7r1iskyP6VTqFd47
	 qqdYE+6IJt6JGjLKRWEMsKfHJqF9K/EmqYxeCRrVDorOKXcrToJkO1TbjpOLupRA34Mrt
	 eFbpfnPNfcyXXA1hzy/HKvzCP+kBPyRkomB+cWJnkKyVZ/S7x40E1gh4sq/dg23GTqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UR+oRQEN;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97FD60A2622
	for <kernel-janitors@vger.kernel.org>; Tue, 10 Nov 2026 11:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A97FD60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UR+oRQEN
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso19017225e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Nov 2026 03:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308441; x=1794913241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wv2p26gpeUqh9YHe7IUFpRTwcMzkjGJ1jZc1lffjWFU=;
        b=UR+oRQENsNTyw3m8WPRxHakPMD/6M89G2GAH08z8luOgAuTYMwATMm40YkQjUmifrM
         0I0lYgItJ8iRTCd2Zi7HSPoiCb9Jfm897ztEJX6ly4PAjZK66S7FQpnPTnp4WfOgil71
         sS6EAeBEnAQXtYBXug/wf3vqUhZlNR/waxaiX4Vbpj2853UP0Pj/t+2kEPD3uzJ4Z75N
         Vj9xgTWOoMaDcdSmCpYtZWf8y5aFClQ9S7OCYqvtOzp0DKEA6vOIZHfTzdUKMwoECdwy
         qdoejJJ5aBD9AYCkstvgOzgJOwMHKNFwgSF/h1BLTJc5BS5UWlvnbo/XPoCHV9iRnUUh
         itTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308441; x=1794913241;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wv2p26gpeUqh9YHe7IUFpRTwcMzkjGJ1jZc1lffjWFU=;
        b=J0YJ58WGIaa+KDLDTCYJviCFL8xBxJZSnuroC9Qsirhb8m0tliLnrO0Nl+RPBvVZlB
         olTurhIqAD/lTZV40zgaBoMwbtWEmEr1DnPn4zXtJKWQ3o14ungRK1Yn7xr9YftPSAMQ
         f4iNIrMa40idZpqw9Y7vRXz2YhDNWqFGOsGCcMCswWnVM9YhHUtMsBg5Ac/aVz/DTxMn
         2ZZPLZCBX74DydBqYCsfRQ4sCHrtpseV6eHNfRRC+MUvi4BvbhXh8BMWYavGllKmSMRZ
         thB7zP92CT/4y6JZKi8Z/IFrm0n1i0YQ/9cq1qASIBwAW0LEh92sZIOGSH8cUMEbGevV
         ifSg==
X-Forwarded-Encrypted: i=1; AL+hErGEKQ5N/kB1PXn95MCocpHJgNmdxjMnR3Me+COtfENPXSFxohrFLHwZxHwXI17jgGfpSp+gGmWrhVTpV8lxj8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z93/qEbA93eDYa5owYobfPWQlUXXjHxKdXIS3we9e3SJNF2KX76
	6RW1hrlWiVctJOgRkYgRt6I1zIGmVPH5JpGgD3ZMIjC+bMgRMe7492PS
X-Gm-Gg: AYBFou1GUvVv+J9au+J5o5m2AUmbcGZ6x0Iy1xdKOnn43+8aJ3Kwr/gkoXB6fow4ZVf
	YUDsgM68ROQabwN/Rrjb13L4brfL9fjXsZlapxQ564slAJyx1k7RYKua/tTNIb7yR+cDOTfWhLP
	OQn0KPw1u9sYYFymqhpGB+o0K0May+UZCwtzj0ZKcsvgSfcCeEIZLMacizl/lI3c/f0Vhs5IfvO
	mBDcOQ3612dfC9SbW00WQiwuZYLq2Nt+JZ4x1h0EsHt9lR7mdAv6Kx6hANE6Sugg0fS+PFGJV2Z
	IZPkd5/h5kKjo1N5o3MfcCEAMqxJLujQlHRiBPXGtPGkopHiTN/1Ve2uMNCrM7t89Yuh9qeTvYD
	RO3DF0UVOTkMrF6IYM4KEgFpWqXw4YkibGYgoGe7DmRaFJXHvSJUy8UU2ZCGGe9nICgneYoPyPE
	Jc/OajhIbrDLEappT9iDQI0R6iwn1cVw3iteJM9wZHXpAKo51pQ5jA0u0TJEXA6hsXt3rpaW7qc
	zTFwkWUBmct/h/CpG4gvVoQ+l7iBO3zbRe4gYKeMtUVYOfGjAV9dC3xYrFRY8I1+tkZ/me9EjR/
	9hpi1vfRj75Io7f2yWbo+aoaTkslaxQZd0xxi0dFlNTrtqE/9ZD1+5hIH8FmyCzUjw==
X-Received: by 2002:a05:600c:6387:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ba02349a18mr35485105e9.20.1794308440720;
        Tue, 10 Nov 2026 03:00:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02381916sm25962625e9.3.2026.11.10.03.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:00:40 -0800 (PST)
Date: Tue, 10 Nov 2026 11:00:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, David Howells
 <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, James Morris
 <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] keys/trusted/tpm2: rename "bool" to "boolean"
Message-ID: <20261110110034.0a46b9f7@pumpkin>
In-Reply-To: <avFcjHwnh9mrOEnz@stanley.mountain>
References: <avFcjHwnh9mrOEnz@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Nov 2026 08:39:24 +0300
Dan Carpenter <error27@gmail.com> wrote:

> In C23, "bool" is a keyword so rename this array from bool[] to boolean[]
> to avoid a conflict.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  security/keys/trusted-keys/trusted_tpm2.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
> index 30188a0ec676..2d6cc53539c8 100644
> --- a/security/keys/trusted-keys/trusted_tpm2.c
> +++ b/security/keys/trusted-keys/trusted_tpm2.c
> @@ -59,13 +59,13 @@ static int tpm2_key_encode(struct trusted_key_payload *payload,
>  			       asn1_oid_len(tpm2key_oid));
>  
>  	if (private->blobauth_len == 0) {
> -		unsigned char bool[3], *w = bool;
> +		unsigned char boolean[3], *w = boolean;
>  		/* tag 0 is emptyAuth */
> -		w = asn1_encode_boolean(w, w + sizeof(bool), true);
> +		w = asn1_encode_boolean(w, w + sizeof(boolean), true);
>  		if (WARN(IS_ERR(w), "BUG: Boolean failed to encode"))
>  			return PTR_ERR(w);

Hmmm... how can that fail?
bool[] is just "\1\1\1".
I bet asn1_encode_bool() isn't inlined - where the compiler would optimise
most of it away.

It is a horrid variable name, asn1_bool_true[] would be better.

David 

>  
> -		work = asn1_encode_tag(work, end_work, 0, bool, w - bool);
> +		work = asn1_encode_tag(work, end_work, 0, boolean, w - boolean);
>  	}
>  
>  	/*

