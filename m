Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793642523;
	b=3kjV+BSunHYJz8PQqEiG2ap+xvGmit5iwHAqWpB0gXjPQmPcpOLwrgzeD2GK9RhOj8Ri
	 z+VvLJz2Al1KV/XLlJkSakeyUI8NAKRonp9V17/uWk+Z4z3PrJMWqQ7W5T2LBf2hJPe4E
	 zwx+LhLpC5s9PYHs7jjAf+w8b4PFu94NFn7O1QtvliWyw6Qc9o6+yKvA6ToV/tcdOeTvE
	 O0LXRC9cKj+46Dd2UWeeiaqovYwInc+o9zWdgryzLZawBtoUjGLBKsksqUWxetxH0NcE7
	 OCh+72geJxtYgzGtJakK61OWW/ccnhw2i1F5ZG1LypjbjjPTH+EZInDf6T2GkvLeRUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=zQVpUc6t5sX3lie5+dJjcoUcVnf4IiRYmAm/BtKdX/U=;
	b=C9Bschqo86vSr783vE+kC7+NT0Oo3+BSkmUfN1Tx7ErPKNWbJiexxIlYyBf6BBl0zyET
	 QjC7o5n+1v2JgoBk1CFbsK11LfOnkAeJTogosUvqGuz015JXNw9Sy64cmLyG/vu/NU8/s
	 3PWeoKbaFxi5sCzKI3r5Nbtn/Bm+FaiMwwei+GWCgUIVApmwS2x2S6P/37zWTywhRDVF3
	 f5b5RX640VXbORvMosI5JLaJo2zB8Mz4EOHvCM4SEuKWHpT7QLBtbobnILjJO0YORWi+x
	 d1td6aoIXhbOWXWmZZu1zt9R/KDzPig4mP56NOeD+VS2OaTDNMbI3Q0iWRwfSz6ODdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QvbmQj0z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7796F606A59C
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Nov 2026 18:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7796F606A59C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QvbmQj0z
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-533202fe429so582691cf.0
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Nov 2026 10:02:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793642522; cv=none;
        d=google.com; s=arc-20260327;
        b=CWfEWK3K9CUMFzHl+AcmhkWshqwVcDlpP4VvnItsMYJtQ7oRmX0Wo0P0xsNQ9GBGH1
         GyXSL8HkBEzQBYaeVvdHHZxlPw8jXPweZV3VHzRfQdHjBwNB0Q2MFpY6jfMDPiXZ9uR/
         UZITtqnxYsPuPrVkuBik9YkCmOYLHrFhsbhTg7ZxmvVfaQMz0iu9HjtVSjFuPKjw1afI
         Fd3mdhhkRHYuYUXvPXequJnAzGqP/fCJKFf35Ij+qqES6buM0xFLsN//smU3xraUnZm2
         vcPvXybdY8aMHWvZxPf/FQmowbkH8d3GJ3Cr2urBf/SN7+aNyiyPii3lkvzqHT3lT3pu
         v1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQVpUc6t5sX3lie5+dJjcoUcVnf4IiRYmAm/BtKdX/U=;
        fh=Th3vOWNrAaQmHfUDGQfakqQe2RFBlBRJV9UNxm0DkMM=;
        b=hvaNKQVzyZ1cVc5Kkw7lqudgE3pPFxHeGTrpOSv0g8/5vUR3q46/tj50kzStYFrNG1
         MwmULuLKAi117e86dNsGpJ3C1UXeo5DXVwcg8bmTtWjAJiUj70PiXp8jrfhocGJ+PBE8
         mAEuYwDlsnFsKIvZJGZtVId5Iu8c2D24UDUFeVDMwu66ucdNDee/xq8HeFOFhJyZDuE/
         q/JCD9GFHrZaeOjSowFfgtWrysKYAmYGkVKIaB0cKkWLQrj8K6qC5cylpatzNDvEZlmL
         z0biL/Jx9pjOI25R0mBRkT/uNKjeq5D0xq1P7nZ/ARd5Va0+GQxrwhbYLudBuDT+r/9W
         2aTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793642522; x=1794247322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQVpUc6t5sX3lie5+dJjcoUcVnf4IiRYmAm/BtKdX/U=;
        b=QvbmQj0z6L1le+6Qvx/RqdIAXnfDLesNwtVoiSJ/7LXE9J1zq5B0RrEcArAB3oflBl
         hOU4rI/TumzEAloN1odCQbBRzrLS2T7y7fwGH4KtKsrIORJtAdLka3UQiCaIFNLcb4d6
         peGRJppUCgMsNT04e95I1uapVS11JDS7irhCp1ccRQimWEAZcCzPMJlu+NhDTypMzxfn
         TGAHY9zwAbEOQIYJ5uHCsOneTyWF7i4eJxtrvQKQTKBGt7kjbatlEfX4oCq6+JowjrAR
         NnbBVUOa9O2yUec50autxECa/imz9+UD6nFnV8fjIJmmb+06tr3eGnDiO0TZfeWxwCbm
         W+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642522; x=1794247322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQVpUc6t5sX3lie5+dJjcoUcVnf4IiRYmAm/BtKdX/U=;
        b=UzhXhBHZSqzl/Ho2VT5FluT2mr6fMsrbSTbcaCfTxhjIQ2eAkKrwTAtL9ScPPdAvxJ
         22VMZSak99tkN4JVoJNpz0AW/tG1KLul9GE38cCoDt3es2NH/81IiuVK7NjCYS0GWe1r
         oi9U08mjrd0X6DnMAawB0rDdzaS6Q9J2cXKKw/FYgFyXS8FZ9BI3gACRvUWVZI/+Vqag
         L3az7zyEqiNPRqKlmhKCRsEXLJFYRfiO1R3haF3wZ+VD4Lf6m/lN007qCQV5arRgu2pu
         tgbZaXfnDUnVAgC5zsJlQe16pWbQJ16Z3w6MOfy85cFzB+J/1+kchL8NB8zSCboSZ+vo
         h54w==
X-Gm-Message-State: APuU4Z8jSwVYb0aoSUBKiZSQ3KXPuqJ9aRQOIzZTPb7rYHL7fYi/wjIq
	Vx1n64Mb3LVJrC+i1iupUFYgVXqkkpaet6Pw8vqno2NCbQxy4ud3c2zXaG/VRGsIyq5zFiv8J4+
	E+iZa/v9hjl3DZmmkjqZA7Up0Ghd8cpMUbwzUTyrr
X-Gm-Gg: AYBFou0QLp8rUxsQLkMMU4mKWvdX1j1122POx1jdmUuTaoFggolIdHvc4B7Xf3JWZBv
	uTl0r/s4xOfUY/SDEaRRxEwuDD2s6Y6qV7aPeypnxBEp2/xDUwrwjplkCZlcKBFS7W0C2yTjMGd
	MaEu1D+nO5eUvIvV4QyZ6/nc9hZegX+PynjrnVxDUaGvXusMVoIo30018JDkzoVtFONyiWJybpe
	RnVBRYPqFYWQy/atWq4F4bryTMVxcRVh13+GXIl7bUx4dwtBbikdVcFzQbwi8iw39TvhN3OIe43
	d3P6s8bJOieg2bxi4b2fx1uR80tWXEb0DXU5nFEfRXnLbGEme9oBc2JUXkK09R3qXV38RwZbY6a
	Cm9E5oyvhjKbu271LuS1bO7sMR8c44zgnhL3BEQ==
X-Received: by 2002:a05:622a:4a8e:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-5412cc33acamr89708631cf.4.1793642521680; Mon, 02 Nov 2026
 10:02:01 -0800 (PST)
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028183137.537812-1-colin.i.king@gmail.com> <71e154fe-0810-4292-a955-f0cbab2b7e96@linaro.org>
In-Reply-To: <71e154fe-0810-4292-a955-f0cbab2b7e96@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 2 Nov 2026 10:01:50 -0800
X-Gm-Features: AclHuK_6VTP6biNXJIrrQGQQoebrT5vhbNV4kO_dw17paAXmuHsQGGvuUXwy-oE
Message-ID: <CAP-5=fVqUNoSQ72Hh5Zam3tyqooxpQ0+puAtTvr6omzmW3HZaQ@mail.gmail.com>
Subject: Re: [PATCH][next] perf cs-etm: Fix spelling mistake "should't" -> "shouldn't"
To: James Clark <james.clark@linaro.org>, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	John Garry <john.garry@linux.dev>, Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>, 
	Leo Yan <leo.yan@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-arm-kernel@lists.infradead.org, 
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:52=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
>
>
> On 28/10/2026 18:31, Colin Ian King wrote:
> > There is a spelling mistake in a pr_err error message. Fix it.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >   tools/perf/util/cs-etm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> > index bdcf94813129..65bce2450549 100644
> > --- a/tools/perf/util/cs-etm.c
> > +++ b/tools/perf/util/cs-etm.c
> > @@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct=
 cs_etm_auxtrace *etm)
> >                       continue;
> >
> >               if (!intlist__empty(etmq->traceid_list)) {
> > -                     pr_err("CS_ETM: Unformatted queue should't have t=
race ID\n");
> > +                     pr_err("CS_ETM: Unformatted queue shouldn't have =
trace ID\n");
> >                       return -EINVAL;
> >               }
> >
>
> Reviewed-by: James Clark <james.clark@linaro.org>
>

I was curious how this passed Sashiko's review. Did Sashiko flag the
spelling mistake but the fix was missed, or did Sashiko not flag it at
all?

Thanks!
Ian
