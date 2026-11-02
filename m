Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616768;
	b=xscomRDXNSdQ0Cxd/ENKnF6aea6Grcm7yb3cx5Y+La6kQGr7QYw9JM5fsHE7/utEVcG7
	 Ig3ocaYY6js/xpnYWU1NVfsKLxGzJpu1aQNpucZfmvfuMADFjcPTAlwdIgyHQ0u+q1Dd6
	 mZaQ+KcGCC5TkWwlWEmz+UgKQ/arr9HPFjwUn8BahYh6OKw9TQKjg5Qzg/du7fp3VX5w6
	 Xp400X+CINx3PI5sI0IE3hKes9Q5FE23BedzLBdYrHs9Ku+xEDo2Xvn8XixB4cJilago5
	 EU9W7HljfdXzXBToBdYTIq8qYLLaVUDA8V7MuDRZqVOftstg8tiQnkm2fBvnunkd4+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aCuf2/0TwlruUJtCBmDukdp2i6RsScdYK46g4uR5+0k=;
	b=ZooHVQjwwkh+hU96mqXoNqExl35D2TQctueMh2+r5Tppqt1FqaMNad4ataocuSgcXKhS
	 2IiufebFLYbSHBFW6wBxzJMwLKzVj2nb9K1lU5sFo/GxV3OVQ18lauT+PZ3BHEvvPDWU8
	 sUgPdHi3WAhBZP96PiLwdfW4M+y0ik78LZdiHNKn3h8OJmsiqEW47wqkSiYkWstKBLW32
	 KIWsXgbnczy549+54WdVeP70i02rFR/3Hc+PVs+jQsHrbkHsFLdOHyMS/wDgdT5ATSLw1
	 nDJXnbL61AUWbQO8SMifo+HtEsFflv8McYpdBQFnUsGnVHIIMnzACOCx72k3SVD8mNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ahKvGQaL;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B5A606A33E
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Nov 2026 10:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B5A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ahKvGQaL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so24356925e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Nov 2026 02:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793616766; x=1794221566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCuf2/0TwlruUJtCBmDukdp2i6RsScdYK46g4uR5+0k=;
        b=ahKvGQaLhep8VQSyrCBqupdIr4zq4e+un2GbyZ4qyD2MJmMeM8b0ULI40LG05a1nPp
         a83IHDs9C5WuYLafz70HqiFP5VZYaEmtUCXuyNmhIwumBDCtjvisnlgwYwrY1KW+Ew7F
         GQTkCPM00Y54VRg8/mwK1r/wacU1cf91cpqOqFy3gKfL2oZBWBYfNr9m4KOP1TM9upTD
         gI4PfE8Pv1XAtQRz72KQNxJWIlAtyxszvpwuSBsQVT69Btp4ESpLj0rCsutZO/xrhqRJ
         mt8Vkjq80CaM20po7sHpU1XCPqhIv2EkTItHqOvAYjdg+4UXQJ/yaZN+mTIqEa2d/4g6
         yRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616766; x=1794221566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCuf2/0TwlruUJtCBmDukdp2i6RsScdYK46g4uR5+0k=;
        b=L5SUc2sMR/hFGMqj2xMqF3i9k/FvoNZlh7QjcK7UBpHNbEDbRTFKQGkoBwFku2iAZ3
         zs3wcgzASTwqou93EWPRVVI3sI0eWBKftZ/aRmdHUpSZ24SKiDN80R4ZX5NE8PxOSRv+
         gd715y6ICnRIvxmYQ+ZIbdcrkjqaO8TSfjygeAdO0LoIYLioIwoJDVkjlGZhWuMx+QBw
         wCdw52i3sCjDL2kqzgG9RI0Z3wKblznUpU6wHYAIEAUjXT/6ZgC0Apk1X8eIxNNbA5Wh
         SCB2AOxwMFVFtyFwahAI1omx9qWes7UzBoi6mTOOedgX5vjzxwcgiq3FBhAShDB4NmNp
         /b5Q==
X-Gm-Message-State: AFq9FYIDjI2uEON1HCmtF8ujcpfMS4DWeMVKkAzS1hlEy3QSrBalfj0A
	idmpogFerJ9Qtld0Q6iDuRYJPdyWHLP0lrKCO6+xbfqD2QPPxrdScXvtSmWH3e15HYc=
X-Gm-Gg: AYBFou1PJU0L3P3+GOjmiQNUj+Qt8e1Qa7vdbNgyQxspudbhOSiAH5Q3PJ12H6tGcEN
	EbJFFrkWmVc4O6GdUlOHlbED6WogDoBlVgsJ8DsIFFtQPzWsGPOsk9KI+L1FJriXnkxyM4kV3M3
	JX98vKHiP7cWpSquv9v5Naic4ANMjHXRY6p3MNL9Rq8VOOOUh9E5Rp6cSuTHrDW4cyUptOinWlk
	0cYoKMltUlYAQcFMWT2ZWYarcpBfuwaleAZ3KLrfLUwvkuXOhLr0CfZ2wx3OUW7VH8f778soWNU
	neGuSDh252xNI2aUdLm+zOTo5YAt7iHBHCAHETBBA7exEp2IGFhrDkSS8MAlEc+u6UOAJ5Xlvcz
	1KgHvXfk9TDkJNvLEEq8yUW/qVE9Z/rH+KSa1BJ1wq7sj5pyTIm4g5kfCF54dMiAgX1MyqeVxx9
	huv479Dcm/8ecEWHA+nVh6oBR+Wm5NasbtIHdSfGNmrMRZgpMPleXFzSQXOzqF88I5I6e0YxzdU
	ciFEyIkbBqTmZHYSVxMX4EGSX2niDFzZQKsMAmki9NWIMxJajyxPf7YbMz6QaRrWxMWdntBO6oI
	o1hwYlrEL64ebWL6J0yISpdfNA2VuVNnKLCuT7QVjKGZuVaFJE7EZQ==
X-Received: by 2002:a05:600c:a103:b0:4ae:63e9:36a9 with SMTP id 5b1f17b1804b1-4ae63e93a86mr89899655e9.14.1793616766051;
        Mon, 02 Nov 2026 02:52:46 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm309082755e9.12.2026.11.02.02.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:52:45 -0800 (PST)
Message-ID: <71e154fe-0810-4292-a955-f0cbab2b7e96@linaro.org>
Date: Mon, 2 Nov 2026 10:52:44 +0000
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
To: Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Garry <john.garry@linux.dev>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org
References: <20261028183137.537812-1-colin.i.king@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261028183137.537812-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/10/2026 18:31, Colin Ian King wrote:
> There is a spelling mistake in a pr_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   tools/perf/util/cs-etm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index bdcf94813129..65bce2450549 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
>   			continue;
>   
>   		if (!intlist__empty(etmq->traceid_list)) {
> -			pr_err("CS_ETM: Unformatted queue should't have trace ID\n");
> +			pr_err("CS_ETM: Unformatted queue shouldn't have trace ID\n");
>   			return -EINVAL;
>   		}
>   

Reviewed-by: James Clark <james.clark@linaro.org>

