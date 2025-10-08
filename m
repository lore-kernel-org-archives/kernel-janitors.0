Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C38293C4E
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Oct 2025 17:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759943980; cv=none; b=PP0Eafmpbyim4PpiT22KDTIUdu9k1v8raGxJJ9VATR1rN5A4ZCSpm8I1+5u52DU8xg0vx5XPoewZvZx3Ksbw/bJbsTO//d6Hh9qVxkKcXyz9MiffzDyGqkyz0NnF9o4M80iUfvzyadz8WjBaaVicjLw7oA7Aa4IulIF6jvScIFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759943980; c=relaxed/simple;
	bh=SjTTUUPBnlmnWR5xPYR0CfI/lFRVIEQr/hjyFEOR+zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5MQLHk5iGuj55Lu7EOqDLjdzNaxc2FtUZB6EMjVmlN6GV7iSW/CSlb/291DgTOz0ElpT/Ky2D882AtNq4UOMMgnHD+X1ZMrTHhJ6OljVLqm660gt9dD5jMtLgTyLX/+Yx1rWrLztjdScM/fQOf8t1VM+nZCG5xLJsv9igqh5tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HVPH0jon; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HVPH0jon"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so126646f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Oct 2025 10:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759943977; x=1760548777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7pyuxM1qJujrcTe93h+cZ4UxFH6Em2UfoKr73Xc2DaU=;
        b=HVPH0jonUlnlICW/SdtoHwAeMjO9OD5X6D+NKQgsV9A5pzaVRJ6zFb2H6fkI9URidW
         3tOUzVdlvPIvHtTLts59JWZvTFgC0URj3tlguxbMjFtbOXwNl0kAdTfWijGIz2i49SFw
         cpOaCwO8XRCakH7i5fKtECAMVseHSUwJV9QlRxmeSEhMfWhBKL5zoRrln1vtTrndydCd
         i1wPLWJ4xBm6wMi/5qvFSojnBU+3S6XhVUQpHcLKuTF7yhvXjNmSJvsYigfJIKs+nSLB
         XZmPQMQCwiRDs0xc0bMmCoZ8o5+RTdhuNRCAunHUwmCX3ye6JdhUd2TOHkc9tvBQ2BdM
         Y3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759943977; x=1760548777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7pyuxM1qJujrcTe93h+cZ4UxFH6Em2UfoKr73Xc2DaU=;
        b=e+Pwt7hA+hPI/RQt1b1Gqd8/56ytfx9B3jsPs7OMk6kLl7aSb6g/QdwRoUxgeTKIlg
         mi0MN/OdAR0YU0GkI5ZEFNisTX5RHX8l5CJxQsWKTW+R9OXaqdJb6FwdEfFYYKmTYk9N
         JblXzeXPyAoxwmcAZmMA5nrDLj2QOKeuU6FAW1Zf5j+NlxJdUhtCvEQUYM+K+WZsu+DS
         QZYS5qyCdgG6DiQy9tARauX156YPD00reI7OjgKRoDKIHOLS5DQo9Ky6ErIgps4QqSbP
         ocgq21hKrO+WzCgSYKQzC5GZFnglg+X6ezue21M7EZ0/BsO1TQbLUDStt6TsmeCEiyPL
         Friw==
X-Forwarded-Encrypted: i=1; AJvYcCW0bBpHslUEcNub0FyGGBe1CpskKEU5L0n7KduzHbgcZsnrv6O2GHQBn3Ci5Vi7ctfvBat2aM1czOGp+zajkZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YySOkFkWrKUbKIR37D7yLbk09Om4YL95Cblo6Uv5MI21/6xeCfk
	AreMo8OukUrtT71s5mW21z+cXtt5DRc/jFh787Mpe9V+tn93nDILPH4sb+RMdUrKZmM=
X-Gm-Gg: ASbGnctBkKpLQbx2XPWnxfDglZf90+F25CI3AXPh01i2UwhCbhaJsznypBTk4GeN7bB
	8EpWTmOnoXFMZOOqdY6wLzUaRIRd5kfYwx2zEzcBXDLo7vfhd/JMuWQIzBizoJAAc24Lm4tyd+W
	bA8xYBYVnEqKXgr5e1dk4aaM539TAyNzkKmEwYoa4y2zVUkB1/JFRTiI4ijPjr+5fd7DTglLkqc
	5yl+1bG2TrUyWwjIBwrxWWvepHVSJEWruAEJ6IbaCTDWl8tewy0GFU9fN/kVG1m4/k5QYgSoqBt
	Jqw3WaEtCK++BNb5iXL5CxGk2SdreS9R5iMc7V39KowyfoiHQlf2eZMu8KacubPj5QbqbGC2Fcw
	XUHtrWddryULeIH9DjvowBryi7+keywdUeolNlvVvCInTkURc3gkFB65plY8I2to/n+Mdb7dST9
	AOMyUgto2+dZ6lc6sMyK1FbnyppI+UPjrsirGFuA==
X-Google-Smtp-Source: AGHT+IGwV2IWGY48tJXj7XfE/oEPofnleR/8SAfmD8lIPiCmMhG9ARmAgggLfTSsGqYs0jA4TvwNxg==
X-Received: by 2002:a05:6000:40ca:b0:3f1:2671:6d9e with SMTP id ffacd0b85a97d-42666ac61a1mr2539280f8f.1.1759943976607;
        Wed, 08 Oct 2025 10:19:36 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bc01:231a:9f96:9bda:3734:ea43? ([2804:7f0:bc01:231a:9f96:9bda:3734:ea43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cc8bsm2913235ad.38.2025.10.08.10.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 10:19:36 -0700 (PDT)
Message-ID: <5bd37df6-1743-4b9c-a83a-a811e221489b@suse.com>
Date: Wed, 8 Oct 2025 14:17:24 -0300
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb: client: Move an error code assignment in
 smb3_init_transform_rq()
To: Markus Elfring <Markus.Elfring@web.de>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Bharath SM <bharathsm@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, Pavel Shilovsky <pshilov@microsoft.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Steve French <sfrench@samba.org>,
 Tom Talpey <tom@talpey.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <02627021-da2f-41f8-9ea7-fd2da96e0503@web.de>
Content-Language: en-US
From: Henrique Carvalho <henrique.carvalho@suse.com>
In-Reply-To: <02627021-da2f-41f8-9ea7-fd2da96e0503@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Markus,

On 10/8/25 2:04 PM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 8 Oct 2025 18:48:28 +0200
> 
> Convert an initialisation for the variable “rc” into an error code
> assignment at the end of this function implementation.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/smb2ops.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 7c3e96260fd4..2513270ac596 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -4596,7 +4596,7 @@ smb3_init_transform_rq(struct TCP_Server_Info *server, int num_rqst,
>  {
>  	struct smb2_transform_hdr *tr_hdr = new_rq[0].rq_iov[0].iov_base;
>  	unsigned int orig_len = 0;
> -	int rc = -ENOMEM;
> +	int rc;
>  
>  	for (int i = 1; i < num_rqst; i++) {
>  		struct smb_rqst *old = &old_rq[i - 1];
> @@ -4611,7 +4611,7 @@ smb3_init_transform_rq(struct TCP_Server_Info *server, int num_rqst,
>  		if (size > 0) {
>  			buffer = cifs_alloc_folioq_buffer(size);
>  			if (!buffer)
> -				goto err_free;
> +				goto e_nomem;
>  
>  			new->rq_buffer = buffer;
>  			iov_iter_folio_queue(&new->rq_iter, ITER_SOURCE,
> @@ -4634,6 +4634,8 @@ smb3_init_transform_rq(struct TCP_Server_Info *server, int num_rqst,
>  
>  	return rc;
>  
> +e_nomem:
> +	rc = -ENOMEM;
>  err_free:
>  	smb3_free_compound_rqst(num_rqst - 1, &new_rq[1]);
>  	return rc;

I don't think this change improves readability.

I understand that making the assignment explicit is good, but why not
simply set rc to -ENOMEM if !buffer and then goto err_free?

Also, I think its a bit confusing having inconsistent naming styles `e_`
`err_`...

-- 
Henrique
SUSE Labs
