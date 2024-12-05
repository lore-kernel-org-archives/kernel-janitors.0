Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E27A47
	for <kernel-janitors@vger.kernel.org>; Thu,  5 Dec 2024 01:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733361645; cv=none; b=euY0+08p9HAxVxdIxnXhqOfhVP8fRweumtzBascXaY7ymwCE1Qz/yKuM2aw9Xc03iIH2v/oDJQuiHVRkk8Ee1zsL6ug2YidnoZ4Y64OUYwWHYeDfW4YJDXArHL+4A2sHbHqFcFIJ/DfCeuaq44HpLKqKuPziM3HqQb94meO/Qpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733361645; c=relaxed/simple;
	bh=SgowjTQrYekcXyiahCj20togqQfF2xU1QX6ftSI5N/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9ka2rFo9/CnYZrjWD7ZulLMEQ+G99vW7Go+Ebf2vpOWRThM9c/ajwuTZC/b1oK1tL8CuVkYlkM2Dg36YduHwDoDnX7qo7d0ROjsgEh9SUNLxNPiqMwgyVjc4m18hOaLWhrHHkbKbEaL57H6UVqkOmV/4ERdDfX5mKpq3uRVFy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=elES94BW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="elES94BW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733361643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/4YbcbUu4DyS3JwmAn34bQrphZB0KAFMZkW6h21FvT0=;
	b=elES94BWc7nHiZKpbEILQ6z1QnwlGYX2wFzDBxH1SwZ2Ln5oBL602RqCj8JIk6RAR4DiJC
	eYn8CevrI2M4rYP2FUn5kizyUvZomHrjhUg2HNqKKhRTDBL0H88O9FWBj3OJEhC+EEGmRL
	NJGfvCyksG0yeS/m+GZVzlLq4L0vvpg=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-WBX6CuUAPEOJ91r25Uqw6g-1; Wed, 04 Dec 2024 20:20:41 -0500
X-MC-Unique: WBX6CuUAPEOJ91r25Uqw6g-1
X-Mimecast-MFC-AGG-ID: WBX6CuUAPEOJ91r25Uqw6g
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4afbf607173so7635137.3
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Dec 2024 17:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733361641; x=1733966441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4YbcbUu4DyS3JwmAn34bQrphZB0KAFMZkW6h21FvT0=;
        b=qBKwVLWIYPhU8I3HJYYSjWL75pUwfH0nCE56wffM+QmLtp5asyRGqq8uXEgvQhOXej
         jBJYckQJDyAyZwkuQBk0pfE+YDsO0wLhyV6hPCOOHTS9sRa9swsxqPfoQzx+nZ/2pQ7D
         aFLf6S5ihf0xo44i7ej2Nb/AZtMaW8Vgn9BkEfRrYpxOvPAhopL2FKvbE9ayBZxeCPrg
         pF2FSZnPYuYZ7AXJj0MQaYOU4FarktF6RLei8UE5ypl757ZE5tHfjQci3iW0KCqn/K90
         4r/HDCRKaGUIWagyooyjITB5qgtCVg7feiH30E1vkv98ntGGSFqv0FYyTfdmkxxlmqzD
         rGFw==
X-Forwarded-Encrypted: i=1; AJvYcCVSAl4+U77n8uFC21wRJefzvUMaYm3TQJNETTSZSD/SLwWL9FIgk5l0Otp89TfdrCIwDSEm9Keu0A405L0SA8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV7mTgJ5vqsSWcAOapJB9QRjS97bVuRGlX0SrUinqYNfm9G2c+
	JfD9xqjCOOCTJqpNJNfNVJkvamNuaRyiKr0OIBblWRRRBH0q+gWC3k0JMMM3vZQN+g/lKXmJEiH
	gGSDGk98Y2cLBwJDdukBTswbzFU5jpi0UEpT2lMs6NRz0IKgeM43LMcwcHtX5dinMSBbAg36O9k
	BXkXSGM/lGTQoFor4ceuNV5jTS5s7Eikyw5PzeaWlO
X-Gm-Gg: ASbGncvwxV1EIHuwJYoLT46KodpP1GO8lyjVLt+B45nFxlgCgTYagtIqzt5ckr7f/yX
	qUDzieSy2/xnR3tqvzA2ikVutlN3qYhUD
X-Received: by 2002:a05:6102:32ca:b0:4af:5568:8f66 with SMTP id ada2fe7eead31-4af973c0ab2mr12081990137.27.1733361641280;
        Wed, 04 Dec 2024 17:20:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiegenlyEQWaMXSs4vqDqiWlLCU9rLscDG3ExVwTbd0zYuJWToUuNU/bX8vEGXFSmoVDfn4McVLiu08cmJjkM=
X-Received: by 2002:a05:6102:32ca:b0:4af:5568:8f66 with SMTP id
 ada2fe7eead31-4af973c0ab2mr12081985137.27.1733361641045; Wed, 04 Dec 2024
 17:20:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204150450.399005-1-colin.i.king@gmail.com>
In-Reply-To: <20241204150450.399005-1-colin.i.king@gmail.com>
From: Ming Lei <ming.lei@redhat.com>
Date: Thu, 5 Dec 2024 09:20:30 +0800
Message-ID: <CAFj5m9JLC9+ao1Bhp0HfdS=7K+iKuAnkrURCd+ajDbqaZ7MYHQ@mail.gmail.com>
Subject: Re: [PATCH][next] blktrace: remove redundant return at end of function
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 11:05=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> A recent change added return 0 before an existing return statement
> at the end of function blk_trace_setup. The final return is now
> redundant, so remove it.
>
> Fixes: 64d124798244 ("blktrace: move copy_[to|from]_user() out of ->debug=
fs_lock")
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  kernel/trace/blktrace.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
> index 18c81e6aa496..3679a6d18934 100644
> --- a/kernel/trace/blktrace.c
> +++ b/kernel/trace/blktrace.c
> @@ -639,8 +639,6 @@ int blk_trace_setup(struct request_queue *q, char *na=
me, dev_t dev,
>                 return -EFAULT;
>         }
>         return 0;
> -
> -       return ret;
>  }
>  EXPORT_SYMBOL_GPL(blk_trace_setup);

Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thanks,

