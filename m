Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B551F37757A
	for <kernel-janitors@vger.kernel.org>; Thu,  1 Oct 2026 23:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790896287; cv=pass; b=A5Ekf3zGKab+pT/EUKqpmjuavVQTfPICZ45hTESyga59MIe5G2p5+vfAmxc6ZK2X3qnPaMIFDQGNy/kKWvFEFSr5mvAltJ0g7IXIsV7XALnLH/fdmth3Ou4dJz+SbNMzQ0AMiixkI9GzLClDUJA+uin0HLfmKU8l92mGaOmbIss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790896287; c=relaxed/simple;
	bh=4Nb1L9U4YfwNkyfWFRjbEZ8/q2Pq0SGn9d6+3u74spM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h157JecpXDQ63wTgihYDzoVeym540Y3sX/mmH59Dgc2uy4lDNAp/gtspVBuyMdGyhzOUiNWWq9u1/RRjOQ8wPkeq63b8YVlwMP/ej6Mxta4nGXEqgJvyeF8cOyRJ+LT7oSqKnduvt8bvHN2DLBWItawy/XhcQFRrRDrdzctI10Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xt1B567I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wa2MUxmo; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xt1B567I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wa2MUxmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790896282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Nb1L9U4YfwNkyfWFRjbEZ8/q2Pq0SGn9d6+3u74spM=;
	b=Xt1B567Ij8yNv3xYfWogjK+OHHVGH6fIgBx2dISAgzVbyN/lsOEwxS0H8DdlaqfWLJT1Ga
	V7wChZEM01wjON1FkeXLnY/C6QGkLmi7+sgUOOkYY7rOFU7+pX/LvU+Q7MGsqYyogU2H26
	k0MGrEmuc3MiePZczGd1cLDi72mfFXc=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-aov31RpNOy6OoQXTeKYUMg-1; Thu, 01 Oct 2026 19:11:21 -0400
X-MC-Unique: aov31RpNOy6OoQXTeKYUMg-1
X-Mimecast-MFC-AGG-ID: aov31RpNOy6OoQXTeKYUMg_1790896280
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3a781d434f0so10907101fa.3
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Oct 2026 16:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790896280; cv=none;
        d=google.com; s=arc-20260327;
        b=YIhnlRVq70i5d1UZm4/h1dgNMJUbBdawYx1Eddh2FnqizcMRsZ9Lf+PDtze0+dFvQe
         D7/a+qdcyDyO3tFdbRm4gboKO1t6RL6yso9k1CdZAfX/mirb38OUoZzC2hxe+FX9TjBJ
         dJhLUX4qTkN/iZPOslTR+1TXJH6gIzlwp2RNceoy4sLXlLnfhWGcoz8Ugok7ZJ8yZNMz
         6BL0+cDiYKLDBlCw6Bzuh03Q2Sk9N7qKA5i3xe5u4zW/qEuO6VaiQr5f1IQM3l417zgE
         ZqJs7JJGVoDmwPbpFNqiRZ8okn+e4ok6U2Z4sEzubaIxEQp3Kku9vEVi6rwQSezKObxA
         z6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Nb1L9U4YfwNkyfWFRjbEZ8/q2Pq0SGn9d6+3u74spM=;
        fh=zj4zzVAu0XazpXdYr9/dnUMqgFGomxvEThvwzTZJ7U4=;
        b=OgjXcBwXdvovkwT+vdg3b1lo3ZrIlLRv2df039lCMJfvB0OjMhN8Xr6yu4TQlfoCu2
         jnpjH2W3SP0SdxyQZnMD47OOdcpnGCODB1VeQ8fxOKI7GQbwb3IjlepH1mJgWFfVOJDQ
         SL6BW4fC1deLTuCrdayyaYH1dEPgcrjt4r5YxWWUnWSpIvBAJG3IuHnPspKHlDo0VO69
         w8ifPabH/VRXZl4Vwho8SVgCZ6TxPLTAWkzYXnmH0RM+jDSepHljZA5gPxMr2NO0IZZ4
         vP6Ngt+lMW8orzdo7rp/DtnNjny4R1aJfLM3BDwcb7XT902cpkJJx1PUt/S6rnE7If0u
         R8eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790896280; x=1791501080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Nb1L9U4YfwNkyfWFRjbEZ8/q2Pq0SGn9d6+3u74spM=;
        b=Wa2MUxmoHqQeaWkqEaIG76ImK0a0iitDkUWU0gydq36wiDqpkTTFyOwCZRceRrMCz5
         fEy+h5SnoZ0O4NWU7ipO9KLrc8Fc5gRDuncBQOL1Rl3xP3oz8AZm6ogzO0CosR0lkguJ
         C6z+JkID/M3jn9KIcwbG44B+gmqdE/pGlsv85IxT7S3ZPip4XibEBtYmrBOuuytUaLqx
         9/c1MObiTIONuOyvkv7Q5FT8SzgTU3zmdPivAgi5xwwxZ3K7fjFrOwcXRH6lGzbG51ev
         DmAiJnNxlHGXDPPh9pdu5ma2033IAGOGEvxRfTVgd7Tvo50nPnSScZcbYDNm6oaQLcGt
         XjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790896280; x=1791501080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Nb1L9U4YfwNkyfWFRjbEZ8/q2Pq0SGn9d6+3u74spM=;
        b=GxNPAujv6kuBTjWIGwWLLVv172v/LaN+aVEbYGV8pS6qr8ZyEREeBfBEvAdIaDrNdf
         lCr5Cylli7y8cQaISCW/ld1zfyQ/b0CjMwuTO+1xIQkCOve5daVzBT/iQBtgCzU1aucD
         i5LfzVzVMWjUzxZreR77VB438DOWh+A7NMDhCL+HwLtJtU1buIXdng2udV0ONeFKwHQ6
         8e0NeiStzkyLmeuejBfBcCZylL4RAQG5f6fTM7BIkrrbRytzQVd0go7GklcmOq+xF7vJ
         2yMQeMZeXB/bCYKHiRt9ZxPMU/KUslx6GRwqDl6/GcnigO8WDIaoshPYrCkNgvZVZDcR
         DOHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx21y589RluAe9PoFY2fcX+RXUZRmsOMynRu1vIDygqqcmnn3AGHTCUxi/iHF6Z+qppLynjtIG4kif2uiLWF28=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8WJ17U8ArpxE6g10LCZhRu3oVbi1B2QeV6Q6ox3nBaDvy3FfE
	5d/x28yIMcdtdQgs5qsAV9oJOq3BBd/2hTXlkmTogBOJUMFCfKrrMIBbhF7Tm+H2wL4lNJ76Dqs
	r1kINEaXvW+ko5g9V4a4WycgBE6TtePG0Vgk7AOlfzkwQfFS6vlU93UidiWSJg0DdkBNHA6UsRt
	wPSDVuwtu8yHTUGA13gW6BijhME8MxOvFf74cujrQB0XZ3
X-Gm-Gg: AYBFou0phYd3hxCG7C7o+LLuqWZPsKsynNO397E2G0kmUJh/KkAOIuF4bDXly1MKYlL
	tGGj07gZ3zEhsLh0+cR1n3rLChXOXQce7n6F8EXvfl5KP6bJBBZ0BmLV85HEhEVS9dtFO1X5JfY
	cJxIwA5uVzfnCwBK+VCbgfqArGTlSZJ7kwuBahpzzoCCGjmwUqxLGSI4h+
X-Received: by 2002:a2e:8a9c:0:b0:3a7:8294:caac with SMTP id 38308e7fff4ca-3a8828d995fmr1606181fa.3.1790896279769;
        Thu, 01 Oct 2026 16:11:19 -0700 (PDT)
X-Received: by 2002:a2e:8a9c:0:b0:3a7:8294:caac with SMTP id
 38308e7fff4ca-3a8828d995fmr1606171fa.3.1790896279429; Thu, 01 Oct 2026
 16:11:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar4BZ26gjQEjZgIa@stanley.mountain>
In-Reply-To: <ar4BZ26gjQEjZgIa@stanley.mountain>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 1 Oct 2026 19:11:08 -0400
X-Gm-Features: AclHuK_ZIZU9AoOcMzsszikhvoplml_bm1WdOkYBM7Pkh36bT-GWQFKoCy-TOGc
Message-ID: <CAK-6q+is-tnpfGqiNCj-SyHYAKfe4ZYQH15=c_rqOy7pkgCoTw@mail.gmail.com>
Subject: Re: [PATCH] dlm: clean up a type in waiters_read()
To: Dan Carpenter <error27@gmail.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 1, 2026 at 2:45=E2=80=AFAM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> This doesn't affect runtime but "rv" stores error codes and so
> declare it as ssize_t instead of size_t.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Alexander Aring <aahringo@redhat.com>

- Alex

