Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F97D18A6CE
	for <kernel-janitors@vger.kernel.org>; Tue, 20 Aug 2024 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724143390; cv=none; b=rJyNwix6Pwieooic6zVkx3jfp13Pwbkt617cQUurmUJBAgAMA1PKWmxeG5BsmeNfqCBBWtYPj0ThXgQSIx4n0y77UCfAgnroFQx8Dz2vndtRfwZmFtMS0feyv69CxtNaq57HggryQFDS4Ozo77lMBKEbvZ6bDSge1LxgIIeLRYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724143390; c=relaxed/simple;
	bh=Zvvn+iKUT6sMUHLftR4tkJxnA0DPg1sw3MP3e4kC9t8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jnePgCPjtLq8dilboyDa7GdS2zlyTO6ofl+8OvALMk5rwZ1j65OJkoGANe299x58+6qjQSC4ZZz0c/PeGWuK9QzCFQrCyVKOBU3XdiodtzfoAabLAqQfOo3xyJ6g+oOd1FV88bgum2/dYZqPRAhXLnUvU6DY7uyli3ic5aDp9gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1a7sLYQ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1a7sLYQ"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f189a2a841so50184251fa.3
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Aug 2024 01:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724143387; x=1724748187; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EuUvPg+DuKjD6R5GL/S/KX4yyLuv13bbNa/SlKPYtTU=;
        b=k1a7sLYQL/TpdCgtEAXQe1b+k2u2Cp9FUy2WiKYKWy9tZnbcAl1FqM5ueA+G+vQZvR
         C0ymG+YKp/fOIRwI1LZTnZwiBnY3gD2sSNj9gHFODdNl45GzOIQjLe2tVy4Eov8lnUl6
         1C+8c0eyWhfJB1JZ7bM+Zi+jOq5acYTvRbqUh1HoY0PZWhmN0mHEoRV3JNhw0rwYhWlQ
         adFZuXz0LSS36rdfBrH2Rt2jkz6u8lFXa5+xuVL9AC1vq6+jE3nRrD3SWhcpfhNsiY4u
         ohCwbs6L5VcB9FWs1vnWIEoT+tEuGUkCZt3pDl84k2w0yCt/JdHR4nGdvk+P5PdrzsQb
         4/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724143387; x=1724748187;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EuUvPg+DuKjD6R5GL/S/KX4yyLuv13bbNa/SlKPYtTU=;
        b=Y6fp+7kv1nvy5wxGCG7ppKCPZqhWD4EeoGsu9cDO7rVQIoGjZTKq4jsTOiSebjZWCH
         mfQgGAH8PqOoi0k3kS2VS8Yq8j4WJHYoWdFXXLbvZhIKN4f1+KaeYKhV2HOfOloHG5L0
         IEADU1PaC5XVsnQ6rcCBzltmmQAVcS4JGLDnQV2+L7KXZFcBm4Yfc/8PFbYlDo2WJ+XT
         X1W2wwVXlphPzNkkyiEztx/p5FxpFDz0bhC2i1+doLVQm7MMMcTsWZKwyvbaiyyuQWBx
         1XNmzcUNmjP5VWtxUvUbQQu98jqrZSxrF7amBUV6/xPWslDp06JOD0tHoH3l++j2apNg
         SjXQ==
X-Gm-Message-State: AOJu0YyjCKQ6PpXsRft+/pnoj6XtcyHWt6C8spRP9gW5jMiyzRFu/yWg
	E/JgD6VqWnnqp+qS6/pZ5h0hvxBLsJicwZ+t2rCWYeOSWQxvCIVOd48xZ+mcZZEX0Fy5CswJBB8
	YhJ8=
X-Google-Smtp-Source: AGHT+IGvcOtlzjGAJa+9kx18S78ap9EBpA6mzX5JJJiZHDyWx1jcmgjOLrRSmvNbSiXCK2BSaEs1dQ==
X-Received: by 2002:a2e:851:0:b0:2f3:cbc8:aada with SMTP id 38308e7fff4ca-2f3cbc8ab42mr50809221fa.29.1724143386921;
        Tue, 20 Aug 2024 01:43:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbbe5a74sm6500963a12.16.2024.08.20.01.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 01:43:06 -0700 (PDT)
Date: Tue, 20 Aug 2024 11:43:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tejun Heo <tj@kernel.org>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] sched_ext: Add a central scheduler which makes all
 scheduling decisions on one CPU
Message-ID: <955e1c3c-ace2-4a1d-b246-15b8196038a3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Tejun Heo,

Commit 037df2a314a0 ("sched_ext: Add a central scheduler which makes
all scheduling decisions on one CPU") from Jun 18, 2024 (linux-next),
leads to the following Smatch static checker warning:

	./tools/sched_ext/scx_central.bpf.c:205 ____central_dispatch()
	error: we previously assumed 'gimme' could be null (see line 201)

./tools/sched_ext/scx_central.bpf.c
    195 
    196                         if (!scx_bpf_dispatch_nr_slots())
    197                                 break;
    198 
    199                         /* central's gimme is never set */
    200                         gimme = ARRAY_ELEM_PTR(cpu_gimme_task, cpu, nr_cpu_ids);
    201                         if (gimme && !*gimme)
                                    ^^^^^
If gimme is NULL

    202                                 continue;
    203 
    204                         if (dispatch_to_cpu(cpu))
--> 205                                 *gimme = false;
                                        ^^^^^^
then this could be an issue?

    206                 }
    207 
    208                 /*
    209                  * Retry if we ran out of dispatch buffer slots as we might have
    210                  * skipped some CPUs and also need to dispatch for self. The ext
    211                  * core automatically retries if the local dsq is empty but we
    212                  * can't rely on that as we're dispatching for other CPUs too.
    213                  * Kick self explicitly to retry.
    214                  */
    215                 if (!scx_bpf_dispatch_nr_slots()) {

regards,
dan carpenter
