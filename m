Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9FE191494
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Jan 2025 06:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736749126; cv=none; b=UOcTf7aAv9vDH3JH6BHSzXA/KXj1lBLzZRI3pgfHBpwRC0U/EILzzGddc1lSpICNp9UKlF5x2bXjlxgbFtBaDiCrbBtOlJd7vmdGC17N1c0n/PRDC0O0al4LCca//roIir+uxTDELDpC35guKliwWKluYPslQLKBcwt/F9Yb5zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736749126; c=relaxed/simple;
	bh=LUrrlU4BNkR/ay/fSfOJeTi1DTX6YT5sJQ7H0bsPWk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g/ugAEmt8+vF/nGsGoQuyGg8wjNjUilVGQyhliSuRyp7gp3ZNOd/Quhut0J9kzN/fNpZU/ZCr7zlAIKFC7Uk2Wqfx2O9P4cUio2Yl7VuJ8atfboa5SjOXrvh9axdYJKJqVNg7HFzSyOAmhZ2P3OT2I0M3dnWy2dHjEC10EduPE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mr/cOPQh; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mr/cOPQh"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso7573606a12.3
        for <kernel-janitors@vger.kernel.org>; Sun, 12 Jan 2025 22:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736749123; x=1737353923; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6S+t9FaG2NoF2nwQgSa+JvhqmiyhhbiLGkuYyDyovfo=;
        b=mr/cOPQhgnEwP9P4rcQmeR2eP6cfh2iLhzQvXZBMr7rB2iXcRM12k73s9jnS1Bo/Ry
         u+hXS6sGlkDrk5miIYorX/3xDOfZBm9e5TZxuYkhnbQlmucNGHTTyI9uywbgEl9Pgaqc
         U6NNGCRA2vUmJbKCussoS3SCbTdwP3foSRIUXtBD+wrgl1VzS20Fm2g9aFX+7dr787sM
         xBHFQPAvCQ1J8qr/NU8i44D2hFA3NqA12H5zvV7K1MQjuTfUaVsEuT4RH1XlCNticw0W
         MW+TqN6EfpvCfigoys+InJLhe19/M8QoFzrNzW53kB+7CfgFYoRQboDBbj3uqfSiYsb2
         iJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736749123; x=1737353923;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6S+t9FaG2NoF2nwQgSa+JvhqmiyhhbiLGkuYyDyovfo=;
        b=dNO+sngCElnC5cbaA3glPbkzab+quccq3NgouZnxDcl+OyV6irp2zC/5oYszXuCGtp
         ybFQQwvueEi5mFQM5wHd2ARGyo0eRpxBWJkpCvrJ7efl/Q8DggrSuEhyMThMxl+LSGcA
         HW5KzA1qRxrVcsii53hLnLSEjbfDfOl7O0ksINm5fzW88ysi5qz7WGlSfBo5zpQwmkvT
         a7u3uHNdefIvA9GS7hrFoBkAsUYjlOwMFFAl7Q1odU9Agwk8kPlAd8vCAMxgAVtiFfC/
         xt9k2HATA05Dpv8UnwrfY4ayL8HeHSksctRYHUuTNpdcXKbGoCrLROJFSl1p96r9uOti
         Mirw==
X-Forwarded-Encrypted: i=1; AJvYcCXq4FHvgwHNcm7tRY8Y6LUMjv8V8qCJSchE+RnNLEt1+dn0pchFB0S+nrW8m66Cfn5DP2VSZ5218usrTKBLnw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTP/SuMqeVG/S5kl2RmN80XESi2sRxAku2zw2iZIDK2K8lwrty
	+j6usv0Kqgq31aFDc4Uq0tLXMzZQdwQoJpYB0oRBTUyDc0m0lX4Hu/S/NXln2dU=
X-Gm-Gg: ASbGnctSjOKAVVIBpan1tdfW/Ar6mMVZfP0/gIKWLRpgQz2n0HEL5cNmSoF8fzWJP6N
	EtRxFL4rH6SNg1NYcpQTXeZppPIiYae3lk2dGKFV7r0jKIpAXEfzmTUL45LUf3JXT4WoQljfZy/
	A5XTokhIOGoXWYc2E331HMk/NWncwiYY5ebxAYjIFUr0F/aph3QP7SK33Uk8VRnJONFlpe4SipO
	/xIGPIvp9LL4sWGZv0JrsFR7dcE1Vpsk6mSnyrBmNWEF8MDQXdZ4FvkrCdjeA==
X-Google-Smtp-Source: AGHT+IEF+9I/nmlTuNhL+jsv7WcG7fafEtH/1G6wbIJb2hKurpya4UqUE3HWDQiZJqimw76RM48otA==
X-Received: by 2002:a05:6402:34d2:b0:5d1:1f2:1143 with SMTP id 4fb4d7f45d1cf-5d972e1a602mr17851264a12.18.1736749123084;
        Sun, 12 Jan 2025 22:18:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c366sm4523124a12.17.2025.01.12.22.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 22:18:42 -0800 (PST)
Date: Mon, 13 Jan 2025 09:18:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Louis Peens <louis.peens@corigine.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Quentin Monnet <qmo@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] nfp: bpf: prevent integer overflow in
 nfp_bpf_event_output()
Message-ID: <6074805b-e78d-4b8a-bf05-e929b5377c28@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "sizeof(struct cmsg_bpf_event) + pkt_size + data_size" math could
potentially have an integer wrapping bug on 32bit systems.  Check for
this and return an error.

Fixes: 9816dd35ecec ("nfp: bpf: perf event output helpers support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/netronome/nfp/bpf/offload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/netronome/nfp/bpf/offload.c b/drivers/net/ethernet/netronome/nfp/bpf/offload.c
index 9d97cd281f18..c03558adda91 100644
--- a/drivers/net/ethernet/netronome/nfp/bpf/offload.c
+++ b/drivers/net/ethernet/netronome/nfp/bpf/offload.c
@@ -458,7 +458,8 @@ int nfp_bpf_event_output(struct nfp_app_bpf *bpf, const void *data,
 	map_id_full = be64_to_cpu(cbe->map_ptr);
 	map_id = map_id_full;
 
-	if (len < sizeof(struct cmsg_bpf_event) + pkt_size + data_size)
+	if (size_add(pkt_size, data_size) > INT_MAX ||
+	    len < sizeof(struct cmsg_bpf_event) + pkt_size + data_size)
 		return -EINVAL;
 	if (cbe->hdr.ver != NFP_CCM_ABI_VERSION)
 		return -EINVAL;
-- 
2.45.2

