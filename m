Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698426;
	b=zaCcSTNH4NCWXh8f7gUMM0pgYZc2CavI7yve4znxF7c9fOXLmVK3kLoojgR7NDP9K6nr
	 sSg5FnwTod3ikWPCIgDiGmxn7DKPhZ6Rp2qyGG448mmxWVp4BgQ8WlJ1UIRbtizpEJeUN
	 a9eXEL2T9xPrn7eNf7YQy4MzunIHhhPbU0aNKyh8zFPxg4w4hRmvZmuA6QryGMPivotyF
	 NymxcCrjp7AdFVlQaGIeM29GvTw37Pc8mVNYOp0+2MUThbdyot7gG2qwXC1mwR9UwgKBL
	 zEd1FM8gADLrTwFTXGd7A7J9E+FH2yRRlLV+AEO2Y2AZstL66vN64nggFQyY9+Bz5mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=W203lu3CpfzgbyGH8OhcQmIar1AuF/mp2AeZJuFgT6U=;
	b=ngXgf7Z58EdexSLHYDMtAESIdslUOU5OXyJ2m+eRlH7kc+RVhJxQmydW8xipHMWdK5bw
	 V/PyunePQMKbpV0iQLMRDcjDXrntbt9IZhszHuiva0bg/YmStVHupYYk6BnD5S1HWstOy
	 psUfn0juq29Ny4BqOXfYb5BZXpZRvYVOUxOQ6Fzt+NwOss0zjNgRnOuHs9I9ZEImaoFHu
	 YwViDIo1/HCLM+LscHqBzQldgvy1zCd0gb1z7q67URSw1ZaE8bScxC1TRCeCp/ZT37NDo
	 T2l/olDeN9god2tbCMseP8pLVDj2MfJs4kZdaCZIuqh+IyauAOx5j4CJ3ZR5MOZd5kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YnOF5gQr;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA495606A326
	for <kernel-janitors@vger.kernel.org>; Tue,  3 Nov 2026 09:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA495606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YnOF5gQr
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26483285e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Nov 2026 01:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793698424; x=1794303224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W203lu3CpfzgbyGH8OhcQmIar1AuF/mp2AeZJuFgT6U=;
        b=YnOF5gQr8IEIkW6HWm20AuyPACLS1OptSJKmzC+7y88SO8N31+NVbPs4JcqFkm7HoE
         gWfEs7JEUNGGE8CCHmw+8v34umJM0oBTRoPEW3rHBjm/LcKoFUEvBhdTYiM7CSqQQQPC
         irEh5Aguvm51tcn+pqCn6FsodUqOXc1YoSRX/DeDs1Pt3NQhvY4LThC50Oma2Ukdx5NV
         xRGd+QWnnCYFKqBiLiIbnSwSmnKZcXIGPk7tNJELq1ekU3m3yOy1IxGC0J7f/AbvvR8y
         BfU7HY4zIsVKAhWaHKlQ/bcPN0/vcdjr/omLstUTAnFPa4W5qB0fvdLA4RwNpUN4BNao
         UU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698424; x=1794303224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W203lu3CpfzgbyGH8OhcQmIar1AuF/mp2AeZJuFgT6U=;
        b=mCP/RcqKrS4EwBXgPgJwyQwK3T/RUQw6XTqu99hpHggyClxgg7EKN8uOv4Us85QoVp
         UQkuVdM8Ddcy+S+sxWoSXJCCjVPcLUqoZ/gaFad9xHrPTClRzMYStaUNvWCJvxB/fW7u
         BkwCaik3TNalw2HYMtrgOAMsQ6hw99Y9HJpNLEGCiLg74WtjQx6ljiJs8sCGfF+2bxQr
         ICFg0mYI4/xqXuDo7B6SXtWUPU+6pZQCh6A0ejfZSqjik/7GH1gSL5wJ2rA5ruEL70Kx
         bzmIm3zS3yDcCG3AVuTvy2vW+WFCYERyWmu6opksytJguPXkfiUgUcKL8+AFFpt1gBYm
         pSuw==
X-Gm-Message-State: APuU4Z8ON6TRkQmqblwCvIaov7T4YdRqjGIa8q7+ftTwgKr+LrqeKfAk
	VF5c8Eyz+NcxzFISQLavy5/Ib4g1fuERXkdkfrNtHlcd4GMPrm0qp+3uWTBjweooWaJM2J7flJa
	itvtqH0k=
X-Gm-Gg: AYBFou1ExoZdLLR0276vHZSkQ5F4noiNdCHqkoEGb+ECWhK4/X9GKmjM7PxPzcbZDSG
	gy+wOrJZftiYANCMABhtPlEnXSxOPt6A/0/gHb9Mo2DriKIswBXIeEfhrJQQlkHtC3jLcWYjwjo
	p8XsnKktV1dQRqJzX8PAPjQQaMUxz+YPs4Zcbd8y1kcIxTGuHToUkO7XBbzPfdjOWvWRb+8s6UR
	xoIssEMWVaA27ZfQyjYcPhS+sGBOOkwWn09o547QdntflHBpqyqPu1cme2VPoiVOJYfmv8Ljk7I
	aA07iBc0jxYB1yJy0YoHjEfE7NhriR1cHFCKr50vKQIqxEBqDuru6oFnrmRw3LqA/cHcOe1HeD7
	M4c99jjB5gqi30UfhKZlVWYTNbqccFO8O+Ar1+n3QGKrhlcLWO1BxeAygWT5WvH3o2gFfgpwAjS
	DNQpNH1AofmV/7/8aN9hYGAyWKTUlDsngoKC/Ya5ptj/mN/tix/1CmbV634WXt6uoZ0xpHv2TXp
	UzfXNWpdUPooNeyVkYToZlPLWwlAQPZTGUZn1CcTnUW9XkjwseeeseHRfWVx0uHEhx8K4bqZPO9
	YdsyJiFitH5llTfZ1+wxpJIZEJOl9XpI
X-Received: by 2002:a05:600c:1d07:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ac18c735b3mr286221315e9.25.1793698424122;
        Tue, 03 Nov 2026 01:33:44 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80333sm25836221f8f.32.2026.11.03.01.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:33:43 -0800 (PST)
Message-ID: <5d15b4aa-dfd6-4d01-86db-df748d84aa74@linaro.org>
Date: Tue, 3 Nov 2026 09:33:42 +0000
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] perf cs-etm: Fix spelling mistake "should't" ->
 "shouldn't"
To: Ian Rogers <irogers@google.com>, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Garry <john.garry@linux.dev>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org
References: <20261028183137.537812-1-colin.i.king@gmail.com>
 <71e154fe-0810-4292-a955-f0cbab2b7e96@linaro.org>
 <CAP-5=fVqUNoSQ72Hh5Zam3tyqooxpQ0+puAtTvr6omzmW3HZaQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fVqUNoSQ72Hh5Zam3tyqooxpQ0+puAtTvr6omzmW3HZaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 02/11/2026 18:01, Ian Rogers wrote:
> On Mon, Nov 2, 2026 at 2:52 AM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 28/10/2026 18:31, Colin Ian King wrote:
>>> There is a spelling mistake in a pr_err error message. Fix it.
>>>
>>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>>> ---
>>>    tools/perf/util/cs-etm.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
>>> index bdcf94813129..65bce2450549 100644
>>> --- a/tools/perf/util/cs-etm.c
>>> +++ b/tools/perf/util/cs-etm.c
>>> @@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
>>>                        continue;
>>>
>>>                if (!intlist__empty(etmq->traceid_list)) {
>>> -                     pr_err("CS_ETM: Unformatted queue should't have trace ID\n");
>>> +                     pr_err("CS_ETM: Unformatted queue shouldn't have trace ID\n");
>>>                        return -EINVAL;
>>>                }
>>>
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>>
> 
> I was curious how this passed Sashiko's review. Did Sashiko flag the
> spelling mistake but the fix was missed, or did Sashiko not flag it at
> all?
> 
> Thanks!
> Ian

It reviewed it, but it didn't flag it. What kind of typos is it supposed 
to look for? I haven't seen it flag one before.

I have a spellchecker in my IDE which didn't catch it either because 
should is correct and t is only 1 letter. Maybe there is a setting I can 
tweak.


