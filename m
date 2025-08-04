Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5898B1E9B2F
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Aug 2025 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754303724; cv=none; b=Kp+C4wufjrL3vSRlpcUwaPCZYe2y3CHUkeWarbRIp7E3FE2upnMIWZ91obnO02DfD/CJNKtEorjciIWFfeApvVRR1vLckEEofdFQKQYYo1wur5TTjwTFVN8XKcbCiYe8aWxL07dcepvDMs10xYeH1swFYNGiDjErIn9l1aubplo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754303724; c=relaxed/simple;
	bh=pe954wgmmEumejGnwBHivOYRG/9KnkTNzBgkDVd/euQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mServtWS++pcYo463rN5kysNHDw1j0ZhM28LIuGSvhcpxVP04zFe8W/ucIGfZqIcC5oZrOrdMiiQvDVOErs0qR/zx50/I8QD/K71zpWHj7xJSfvgvCgvPY0KkU4QUKsuzI3Cj1yQze24bE1g/O3g57RQTdBmh/7MohCqZArBa+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g4hWao9q; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g4hWao9q"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b790dbb112so2287197f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Aug 2025 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754303721; x=1754908521; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVsZnKEppNL82Tx2ebT8ir6qzuWebnepuASOH0OHUpg=;
        b=g4hWao9qdifWhoIOEf49FFbDYg9Hx2tkcT5zZx3GFLRDx7nPAKten8/SESE+WOJZCQ
         ld3cDcnpRANfnMExQMwu7ORGa0AUkWAYZd78C92Bhb5iLrVU7J0Mkel+UVisiiROfxdf
         4kgDVHzmNA6yxYMNrFKuxFTu7V84iHm47bhJwOkkwGTuAPs2cDtB703aHOalWhVmnZRi
         ENQw6ofUzLhuw9aT4hglaiftC5G2RmyRqviLOSnQ971iK0z4Pry8QQ5YTYuEPwyryGJ6
         0xsVrBQCHpSmFE27+wS24yjSxSNSapRNp7F7otLJf65jvQWxR0sycLFzNuHrEpEOXzaa
         HdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754303721; x=1754908521;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVsZnKEppNL82Tx2ebT8ir6qzuWebnepuASOH0OHUpg=;
        b=K6ExYmcsij9snCuYIwQfvRBeXdTkTaJFZekhrz/pGpTFrBDqsxpfsc103qXT5M9167
         eI36/wN2ijS74u3Ydiq4ZaHD0iEoXgf5qhpLXCU10Si/OTRk2/IASUSLWdNheuTNcsxu
         lKeF2GqSwzPTBvZjKtkcTs1d3K9MU//Q/8aHPGWY/8n1bhfQXKijx//YO+W59Nvsf23B
         tDSQLUmfKlBXxLt6sX1+av4beVuhkzJ/moAsl81SlVqyvJRnS+ZDDZSOqFt0nWvMSsAW
         ly0/FPvvhWOhLFUtTuOlT2fL2QCNt1dQzgtuorT/bRCmaPejYvrnXDs1GOttYz6VMmf3
         tNDw==
X-Forwarded-Encrypted: i=1; AJvYcCWI6+B4WO3zgC1FmCZnc7UZA1R8oZC0RlYJU/x8Sf2Bw2JnE3pMVBTjBFOru6X6/MGhuxDa8YwNzki515Czj9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaXiV3S+2GnP/KOgIF9UJOXzzPCH1uAxmFN1b+crRR7ryQgZYp
	QitokkjhdUx42lw5sMwHbImmGLXVDonnv8/dtFN03gEbgA/uo9FZwYi5z3JjLxCtSAM=
X-Gm-Gg: ASbGnctZq1E8Ls4lUgMfVA7MLCPZxc3hXUhJXmpJ7gJaIoHkAPkS2QuqODn1mdu6h+H
	0APHj3R/RsGQrX1mfN1khmgAT6WVavT+TXNIBbm3omxvA77ZXH8nuvbWKiGxmGG7s8bmfNNJGVg
	bs9WT1qcl+2rGS6ahqXCZrxpW705o4WY+8MznIVyhaa7POHKXQY056/koucZNxT6FrE5dmX7s5g
	QwYkQezgSYwMSLaRDMn/Ckx+FdhJ4/Hd8cH3Q+5hcXt0iJSPazrc/2xE8paNcArzcqwEPszXVev
	WNJwA15h5JwHpa5MSHDL3XWu9Y4IgU5M1FEaHbirxxtuhOsKx6PDX+P1GrFrex35jl+Np8aFsZO
	RqA6xnyFoOYrwMR0GFLauiaFi5fA=
X-Google-Smtp-Source: AGHT+IFxnCtzMP77QQqIeHFAiFOez521/A3SRrlULlSKZYQx0zCUMF1RLl0DCGN4eVqJHy2LDD7DZw==
X-Received: by 2002:a05:6000:26c5:b0:3b7:8473:30a5 with SMTP id ffacd0b85a97d-3b8d9468519mr5415292f8f.8.1754303720554;
        Mon, 04 Aug 2025 03:35:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c45346asm15189488f8f.39.2025.08.04.03.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 03:35:20 -0700 (PDT)
Date: Mon, 4 Aug 2025 13:35:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lance Yang <lance.yang@linux.dev>,
	Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] netfilter: clean up returns in
 nf_conntrack_log_invalid_sysctl()
Message-ID: <aJCM48RFXO6hjgGm@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that these look like error paths with missing error
codes, especially the one where we return if nf_log_is_registered() is
true:

    net/netfilter/nf_conntrack_standalone.c:575 nf_conntrack_log_invalid_sysctl()
    warn: missing error code? 'ret'

In fact, all these return zero deliberately.  Change them to return a
literal instead which helps readability as well as silencing the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/netfilter/nf_conntrack_standalone.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
index 9b8b10a85233..1f14ef0436c6 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -567,16 +567,16 @@ nf_conntrack_log_invalid_sysctl(const struct ctl_table *table, int write,
 		return ret;
 
 	if (*(u8 *)table->data == 0)
-		return ret;
+		return 0;
 
 	/* Load nf_log_syslog only if no logger is currently registered */
 	for (i = 0; i < NFPROTO_NUMPROTO; i++) {
 		if (nf_log_is_registered(i))
-			return ret;
+			return 0;
 	}
 	request_module("%s", "nf_log_syslog");
 
-	return ret;
+	return 0;
 }
 
 static struct ctl_table_header *nf_ct_netfilter_header;
-- 
2.47.2

