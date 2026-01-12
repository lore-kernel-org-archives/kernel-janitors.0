Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E973587B8
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768222497; cv=none; b=Q0WR3stkxT4YKap+ui5zkVkOMqAbOG2A//uWLUb8cFfp9QaYFSuP2I8wqnPI1+ELJUaRKDNuwaHztaGEq9djQMfqMmHQvHX6P//r/gtwAH0n/deCbCSt/7YTDU4ge6c0sysrvgI5jdp3E7RXL1+W5zAiFjsjscF74SMYjKBc1TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768222497; c=relaxed/simple;
	bh=XU1R8eEmf+8OcV6QhVEoFS8ffVTmlKxgnjEPke2eHaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QwwuG3d8KlJaNy/Fc1tVemoohz5TVHgNh90MsxUSfNnOiTybohUzjZbU5VzTu5j48kAiq39kcuQmU+5ArKeNbarzJ78qmD1Nki/+cIhNXIe7M1uY6XGFGTeWb7iQTdQtKTAlm2KIbIjcd0vfr7XVJb6VA3I2c2zl08M3mmBAru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VNXTye/l; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LqSqNFh5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VNXTye/l";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LqSqNFh5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768222492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2pTWpsZNjWgj8wv5f92UAOMouEbb8hc3HuMURULyk40=;
	b=VNXTye/lKeVm4qlAASEDQsM1WhhtZhODxCOWrDJza5X4ilScl0sJ47kYE7HYV7HoAFcrv5
	8nlcDhnLfqEcflS93FE9Oo0WROHIdDmox08Jq/Ld9IwpGR1FLz37U7IqeQJZR3aeoq2zW9
	Ico65+wp3iQ/5IBgBodYk53Mw9EY2vc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-f6xV33KlPx-usVC_60ZxKQ-1; Mon, 12 Jan 2026 07:54:50 -0500
X-MC-Unique: f6xV33KlPx-usVC_60ZxKQ-1
X-Mimecast-MFC-AGG-ID: f6xV33KlPx-usVC_60ZxKQ_1768222489
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b871328f6caso96040766b.3
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 04:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768222489; x=1768827289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pTWpsZNjWgj8wv5f92UAOMouEbb8hc3HuMURULyk40=;
        b=LqSqNFh52oCCy4tw8QgSvS8ufBhTEEWVhgKds6lYaSxVk1WvSTIIEACeYiUzsVQpPM
         IjyuipVH2D8+7BOhL8h1P3wvZIhCCwu9POsdpoifZ8r/o9RkJtG1QEMlz5Ww3LHc7NsT
         PCAZ01DDVwLMNqGuRjD3sLZGnaTQYfyNtoG/H8iQJpXYp+vlU107WBn52H86etbyw6pb
         92l4B4JQnuhwAFrO2eAtIgK58nj3X2GbICLw2L9XNuEjR1BvBQzCw9BQyEc232Fy3izr
         lXEkITsELO+NXFrfTHcuhW/wH1PKXtDUivtDxdxPfcMG+Tk2WPWRmcHAwQ37rht0prEQ
         lfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222489; x=1768827289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2pTWpsZNjWgj8wv5f92UAOMouEbb8hc3HuMURULyk40=;
        b=ekVr46gxFs1DdKS2yGtkrwKOFTRVHJ+k/cvnryo9PVsUZTzvRAphw7SilV6H8ieQ7n
         MghPzAMN0GK31WN4d6H4+yUzCCxpiB6x1x7XSIIOYX2kMR7XBrEjo43aLQTBWhdNVQU7
         /EE0BmK/1++fOQ7w2qjOdJcvuLhZKCtAkHeJQa6EyHIwhDS8MNNujKsXGB6f5zLEfXbO
         oWImn/7RJWc0C3mZEX3ExDU8tnyEmOYpEscUPgIyFdeaObEt8HtwqCOND5NgkxwQ4Ul5
         0wArRR1icRBNUHkhkDY3SOOQyCloBdvqkOoffgD33sjT42UMfgoaxsAvvhDdkCBv3FxA
         pftQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEY/b4AUhtayLcHpCBdUlnuIP9EHGOd7taVqq8nUmKLEmx6hswQkCMEiYP6hifgO+EETz458VhS863XERaa4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbhLAp2W9WT8nQJUxSe8dCN5SAsfjEvvWkooew4D8JlS1ODeQK
	qyCU6kauR5qt/HYMJ9uoNK++1mn+KISc17E8hlGrJEeLAD8w1+sxjHT9Oc+CvgS0XSGMdWa/63N
	ZyP+eekRSr99Yva7TGuXz5dwL3S4xbzvWko9yd/LAZszcdAxQ6lVmreCofhSdW+U/QEMM5A==
X-Gm-Gg: AY/fxX72ogbIdf9R4X/savloc9iDKnWTv1oJRCHwwnGz3alhk/FvSu8hVMF/XybI9h5
	A10dwKUMeU2dlKXRuQVDgnJHg98osBwg85wX71JYPfFGpAKvVeL3s1PF8uQjG45RNIG+lRsgK18
	ZKlphNmep044modmQXCa6VQF26DDso+BzBK0Rc/FsPmnEaONRAAia+JbVSk7AHkNsG6vOXuTa9Y
	vVMtif9ELizCSFdJ+GCv8YfiXWYWssjUAuEkGJ2aBe2q/mf/gyqclp6Cs2s7lfMvnwReEKnii43
	WyOTO6mUESxcpHocdffusKWuwCpm6aaF1LhPbIX1O2gepqfbZs+UXUcFBi21Zm2jyv8N/ACoJGI
	ubt38o+R4KQfIll4XSRVW2Q1gYiVnXuYM7Wod86dGE/EtasLDFJ4tsQQoo5M=
X-Received: by 2002:a17:907:a0e:b0:b80:34e8:5eb with SMTP id a640c23a62f3a-b844542221cmr1612469266b.55.1768222489066;
        Mon, 12 Jan 2026 04:54:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7t8/HlV/5AlKScEccxcE3fk05AaGQ3PxxJdFkixgC3oQPqTZ4vVB050U3KXnraou/3iD9lw==
X-Received: by 2002:a17:907:a0e:b0:b80:34e8:5eb with SMTP id a640c23a62f3a-b844542221cmr1612464966b.55.1768222488577;
        Mon, 12 Jan 2026 04:54:48 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm497062466b.16.2026.01.12.04.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:54:48 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	David Ahern <dsahern@kernel.org>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-s390@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [RFC PATCH 2/5] selftests: net: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
Date: Mon, 12 Jan 2026 13:54:28 +0100
Message-ID: <20260112125432.61218-3-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
References: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The config options NF_LOG_{ARP,IPV4,IPV6} are deprecated and they only
exist to ensure that older kernel configurations would enable the
replacement config option NF_LOG_SYSLOG. To step towards eventually
removing the definitions of these deprecated config options from the kernel
tree, update the selftests net kernel configuration to set NF_LOG_SYSLOG
and drop the deprecated config options.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 tools/testing/selftests/net/netfilter/config | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/netfilter/config b/tools/testing/selftests/net/netfilter/config
index 12ce61fa15a8..f7b1f1299ff0 100644
--- a/tools/testing/selftests/net/netfilter/config
+++ b/tools/testing/selftests/net/netfilter/config
@@ -64,8 +64,7 @@ CONFIG_NF_CT_NETLINK=m
 CONFIG_NF_CT_PROTO_SCTP=y
 CONFIG_NF_FLOW_TABLE=m
 CONFIG_NF_FLOW_TABLE_INET=m
-CONFIG_NF_LOG_IPV4=m
-CONFIG_NF_LOG_IPV6=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_NF_NAT=m
 CONFIG_NF_NAT_MASQUERADE=y
 CONFIG_NF_NAT_REDIRECT=y
-- 
2.52.0

