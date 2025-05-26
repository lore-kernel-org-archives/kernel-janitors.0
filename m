Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341E61DE3AA
	for <kernel-janitors@vger.kernel.org>; Mon, 26 May 2025 06:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748241841; cv=none; b=BgPsATLZVPYvDfO/n2enHFMS4+7V02PzqruqLz0gplsZEMz5tu1bW7SmEJnw4XpdZ+AjBv9AaKux4sCRv7e1wRONbfzPYfvOsHqkKIh/1mHUObpV7Hy93mv+EACKQmrFFro3F3WpQx+nCpUxQwEm9ZryJRcLKuCRm48Br/fCzgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748241841; c=relaxed/simple;
	bh=xyo6z2s9z29qBh3/0vJgNqZ48TqZcUvdJ2iSpzGPjGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uJu+8oxlOHfFIzhwQTjh6HLQxDKRTHVvlNo3ONqxP8cDwiTr7IFINYDeISmz+8XJdSeCfVaicYuN/clseU4pVGZGDfy33lyhPelkROk0Hxvnvas5G7VyMTmvoLKxLefM3U2UA0Ho7NpPpB0/5nWHbCZprp/7yBO2t7JVEePzPXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xZQ59nuV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xZQ59nuV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so28208345e9.3
        for <kernel-janitors@vger.kernel.org>; Sun, 25 May 2025 23:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748241837; x=1748846637; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVLU9IZhu43RkRDrNWRdjUoA9l1SqU/dYoVdEx2w2ko=;
        b=xZQ59nuVcxpIyT3NHEogJ0ram0b33SN5v6EjfiL0ToQF2MRyB8p0o2XS4K9b7LgGd0
         lvCI3EsZuwJjeU7vxzZj+QnXxtqJS/B7JHieNK67U5UdzvibkrC4u5e3rQjpqYIiW1s2
         Mp8YFqlo+G9WBLpTn8pfodHVkexlMVuTeGNBPedj/D5RaRevX17YRVUyjS/i3Zs/BN0t
         Yl9PQ8MeGxTsG4PBWzpRc/WlG6Q25hSEpFHd+qIbkG/NtufPLIEHxaVUj7RKVoxRIJL5
         17mUdWrvQAeEBrW7LIdyUWMvotj0e+uECZkP1pg6T6gFVfndnpsu6lP+i6tB8YY29jKK
         c6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748241837; x=1748846637;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVLU9IZhu43RkRDrNWRdjUoA9l1SqU/dYoVdEx2w2ko=;
        b=W7fsZ3PzKA83jD4axtCSeOQFkyN5zBoGowv2JLGURXbvjfVErY3IREfSlkM1jMgh/+
         lPy+n6pNSij0Nwo5gOi9ofrQYd7dvIBG6708erdLjfgkTVbmpSMeNmQw+Mr80bsF4Ohl
         ecsPxfwELl4q+JPlT2L+2m1lfyvMZCvDS5vOmFCqI576AzwWZf8e9G/ic5Eoy8fT6Ol1
         KMIBwO6mCY+0vDm68Q1fhwvnOuFCrZRGjykE9c8tKVYssLd4iUl+j9RfbQbPhruOdnvu
         VCF4FAN1V0RtcKSwtQeiBKsZufYw3n+XbShNhqpIrbKurZIOtSSs37E2nc+iJ1/9U/Xk
         IUrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYOS7x/wywD0CRJx+ZsR1fKovO2IqQmQ7hXPvx9pwLXtYKVQl693VTlfBftPg8B+M2J6YowD9v4ExfGXQmBWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEShX1N6wTlXJPGDiUMCPzKHZmPFeqT5bPABIcxFSGAVJC4y14
	e7Dcyym3RvFTKWYPgcZBEn884mhnjlxU8v2s7VwJd8epIsNYX7e9PjvZCPXEhdaqpBE0vrt7Sbj
	AfSC0
X-Gm-Gg: ASbGncsOqQo4cGjs/q+stPcwZ6tq6I/prnCSNlkdOritsJ/azWIg71JKWjhbEw7O9GW
	Vz8N9OMMS6VKS9EZVD6F1QiD/Kq+o+k2Rn2INSbRjyoGst0LpM84cBhzfhsVjn8tbNgwVNoT9cQ
	KLbADeMb3pw3xK8My9eiGPwYvUxoWrEx1/oUDmHriZgphO481RG4heRTNlTVqMrch9x9fXv94Zt
	ZcOhHUrZr3cgRSwO2QK/gl+RtqC6tj/wqyn70qwFIGcgGaL1F9heup+537n9l2gdfY3Wb8glD2r
	UCNdUhprO4nUUUGLpV4gyHcpKNMgxKp9iFYAFCnPzXupNs9dZhd9tbeW
X-Google-Smtp-Source: AGHT+IH45ycu7DvJrmGkEzEf/NQJeUI/e5TO+//QIWLfQP/S4MZN6JGNJds9x2u2/v3QaYJAd/nXag==
X-Received: by 2002:a05:600c:5396:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-44c91607264mr57363625e9.1.1748241837396;
        Sun, 25 May 2025 23:43:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44ab793a7d5sm137885655e9.1.2025.05.25.23.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 23:43:56 -0700 (PDT)
Date: Mon, 26 May 2025 09:43:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [bug report] rxrpc: Allow CHALLENGEs to the passed to the app for a
 RESPONSE
Message-ID: <aDQNqZLqdNWfZLeq@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello David Howells,

Commit 5800b1cf3fd8 ("rxrpc: Allow CHALLENGEs to the passed to the
app for a RESPONSE") from Apr 11, 2025 (linux-next), leads to the
following Smatch static checker warning:

	net/rxrpc/insecure.c:48 none_validate_challenge()
	warn: '(-71)' is not bool

net/rxrpc/insecure.c
    45 static bool none_validate_challenge(struct rxrpc_connection *conn,
    46                                     struct sk_buff *skb)
    47 {
--> 48         return rxrpc_abort_conn(conn, skb, RX_PROTOCOL_ERROR, -EPROTO,
    49                                 rxrpc_eproto_rxnull_challenge);

rxrpc_abort_conn() always returns -EPROTO.  Could we change this to
something like?

	rxrpc_abort_conn(conn, skb, RX_PROTOCOL_ERROR, -EPROTO,
			 rxrpc_eproto_rxnull_challenge);
	return true;

    50 }

regards,
dan carpenter
