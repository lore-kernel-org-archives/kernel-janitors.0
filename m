Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF5316C692
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Apr 2024 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713453698; cv=none; b=REfmjRb5nBll32myaGU9a48KBhb+uBZf0QUD/Rw4SL8T5dNMNjPix98+k3KLOfbA1AmYdsjvxUnn4v+Y1EbE7AEQODxYnWJJT519niilryvaxWiEO6FbVnDVaEhECFz9nmEHFPlfnnd2zt/xK9wFox+ZGDagEhHLPhgddcSCxdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713453698; c=relaxed/simple;
	bh=CQohQLqvPc/tHvgWJq7mh9PQ9WJ3XLzzwtQN4cmxGqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNzV8OM/oTk+ZZRaS2tcdkAd8YCyxZ2VVRk4mD62k45y6fDI66fbuUF7scN3ptQXKfapGHNSSPZ1M9+X5WubbTNE+pBbDoDlFVab0xvb+TU9SL3v8M8wseP90W+4TQCf2LbV3eKRSWIVUXGHLODyLRhWYQyevtQc7rc8cuikR28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TUCv9OEb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TUCv9OEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713453696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQohQLqvPc/tHvgWJq7mh9PQ9WJ3XLzzwtQN4cmxGqc=;
	b=TUCv9OEbc/VwiFRchQLCoHUsxqu1pjymec/cKtmFJC1LSm9VtDI5Fz5ZbbJAPIgrWbOJe7
	VdXFYGrfXDut4UY84b0u5EwiOdlCXjyyw56ffkoEc1mLmTpq0EFU/lYGb/OOZNr7AfrTYi
	xsOKT3CxOAbgiK1mAXgJGGbtvJThanI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-ocwa94ssO1ykLQLaW5Ubrg-1; Thu, 18 Apr 2024 11:21:34 -0400
X-MC-Unique: ocwa94ssO1ykLQLaW5Ubrg-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-434eb00e185so13498551cf.1
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Apr 2024 08:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713453694; x=1714058494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQohQLqvPc/tHvgWJq7mh9PQ9WJ3XLzzwtQN4cmxGqc=;
        b=MglG4azh6DN9bcBJnNretUtRj8X3GVoWjUiMuXmqKYeheaocWtvKgOetjwWNgZm1My
         SY1soVQvi5AX7VVHmH5+VY5coPQ1W4Jv46r3J297RZHnOZtrzeVZgXPgT/NVYInbwSFO
         PyLCAcw1MiAKHTtC92XXqKaUuUY5Yy+1kSwpIbtwmGxeuRHRY0kRpInCXjcknivLzzGM
         cl+8RzV+kmtnzyI5HCFuuxsYHqn/aYU27mDEOjpVufE6/BCu5M5eOIeNr4gD2ErJvDap
         FlDZlJ/R9/0RE4NfmqZf/UO1THW9l/XgWy8NZMJGSJC2Bpbkvb3yQ6uyd7tMkL5jERsp
         GfDw==
X-Forwarded-Encrypted: i=1; AJvYcCWtFcJ/ABqJ7Y3TGJhmCWz/1auMD73l/aZSVS7TSkWiWA3xzY/QMzyHvOY8xcZzSCtm7qT42lTSpEw7+WCRv9TacY+nTagPpBGSgbD0FS3Z
X-Gm-Message-State: AOJu0Yzdz2/ay/Nzlekz/U+GcinZ6bwyAYoikqWs4UYBx3rwRlznkJ4p
	VKKAnoz/sJTwRIhf0i5l6CCbOTHzz4Ph7W7kTA82T5RuE2SiPMLDrVLYE6u7WgFRjljTy36M9aY
	pIjXBF6MMVskBri0gqovucGO6tT4GIaBdPxgoCv5LIvqi2eMrWiZCONsR9Otkj1znShyE1nDrio
	WEsuca/KhwPwJbXXAFSgzq+wafoQSbmM1yXl7okNLB
X-Received: by 2002:a05:622a:164e:b0:434:68ad:bc6d with SMTP id y14-20020a05622a164e00b0043468adbc6dmr3752453qtj.52.1713453694202;
        Thu, 18 Apr 2024 08:21:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYZwCA+06wOvVVCIasxw9xTrMHDeFH+2lLqLF9z2iIkb9Ub+iZ6WZb5a1fMomaWqQomkeAzQiYpEptyX8KM74=
X-Received: by 2002:a05:622a:164e:b0:434:68ad:bc6d with SMTP id
 y14-20020a05622a164e00b0043468adbc6dmr3752430qtj.52.1713453693884; Thu, 18
 Apr 2024 08:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418131754.58217-2-wander@redhat.com> <b96697ff-3177-4559-a410-104ca3a1110f@web.de>
In-Reply-To: <b96697ff-3177-4559-a410-104ca3a1110f@web.de>
From: Wander Lairson Costa <wander@redhat.com>
Date: Thu, 18 Apr 2024 12:21:22 -0300
Message-ID: <CAAq0SU=HJ8nysYWBj6_FGbRv5QyetdV0xJJKpn2oy6Hub7-6QQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kunit: unregister the device on error
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 12:06=E2=80=AFPM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> > kunit_init_device() should unregister the device on bus register error.
>


> * Would another imperative wording be desirable also for this change desc=
ription?

It makes sense, I will change the comment description.

>
> * Will the tag =E2=80=9CFixes=E2=80=9D become relevant here?

I often forget this tag. I will add it.

>
> Regards,
> Markus
>

