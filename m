Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED37359712
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768222503; cv=none; b=LtR4BbJ/Scro4FK6QO4mD2yLg0Xc8g1IbJJx0pLJSA7yVl7v2SPzbOpjn64mlYThGofclyDR5ABKJz2avMK060+02iqpTEQA/7IeoyEejgPUAtNuwIL+O2qvBaj78o4cEinbYtj+LHWnZdcOj4N0DLyaLL0oHkYbHUG9nYx6TNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768222503; c=relaxed/simple;
	bh=TCr86+g83B5jykr4uoI4MF4hOXPzr5E27AlUPYqmfnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XeSckCvva48uaDl5j9766x9FvxcJKYx2WSKJXc3Qk4Rn990Re6k7qmY5szMVjGQNQoSQXGgsP64cXDCz6ifHf9YWnI04AE4dXpMjcHawWAJ0SaSRSjEjrBHg6VUlF8ihMCLiiTGaJPo3vU+RZT3jYky0YzYlL1Nrmrr+tEvwuDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PFo0d1up; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=a2cu08iV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PFo0d1up";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="a2cu08iV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768222501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhxkLbdZYuCDIREBJ5aMnl1Pqa4kOCAZc2N2w1wi0pg=;
	b=PFo0d1upUW83+n7Dv77dKkBu/gq5gfntsjyfS20sCIoS4O5ME+5k/Pe1NBOtRAp73REcMz
	q9+wvLJiHCXgWL5OUdraStZ62dZoBf10vILcz5+XGdwcTbqMFQUDDpv3sydQUahJTFEGka
	rOQ8MwDygUUcOTxi3VZTcfH46p+uA/I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-D0qwYEt4OR69uQjV6nmoYw-1; Mon, 12 Jan 2026 07:54:59 -0500
X-MC-Unique: D0qwYEt4OR69uQjV6nmoYw-1
X-Mimecast-MFC-AGG-ID: D0qwYEt4OR69uQjV6nmoYw_1768222498
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b831e10ba03so935371266b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 04:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768222498; x=1768827298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhxkLbdZYuCDIREBJ5aMnl1Pqa4kOCAZc2N2w1wi0pg=;
        b=a2cu08iVMFn/z5KVTdc33ddBRhM9nauUO+V8DwpNdFsMpxt232p6ZYmRWfPT/Q0oHG
         Qw3GHiPJBzHZ4iigWJ2KQXwzanAxlsSUj80xkJ90GIVVnsQby1B0hmjPWazr6l3+b+T8
         ctYH1c9NTrcIfrjNClPCGuvzE30AIretagA5yiIeaWCT/pGzdEinYjAGbjRWStU2KA2h
         P37z+/qGACCyilZ/Y1IUCewb9qSxh8mOUzkKKPxY9tO588Ks+HpFJOgv6MQ7IRrYzoCn
         RvCD659tiovByLPspnNOJctMGD8Z41RlRezMjtXYJ6qXkT77PPjXrnE/mzCofGem9xS9
         +/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222498; x=1768827298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rhxkLbdZYuCDIREBJ5aMnl1Pqa4kOCAZc2N2w1wi0pg=;
        b=HrAC9vk6LPRKQGmKrSZWNlg/eIb/eG21WO1ZNrujqxQJMr8F2yZUSAna49/aLH1P2F
         /NkevrkMIiJGoCc8ueVBtNV9QhZ/yykg5+oMp3dkeX5cYTuCAd0AHpJh5dPI3vgC5gX+
         HYXVIuQeMFWOoF8BiNyKNpZOaYkaJXmJ66vAGpzyZpHF+UMbFD2ZN/9fgFvtxh8vL7kQ
         yzcwapw/izxWOvhAMvzk4ZEtUGY0lgDGBTjM8azB8CyI89aolKE/DPvnC2ZAAtyyEg6e
         KeeifjzKW27GbPvvMQExzcPyphyrARTxRIsWJ+ki3f6tCOUT/iG1CkOMK6/yL7JA7187
         ZhnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1c3dhvbBvlfThNNPs6jKgmQ96XSpmi/9ld0EZiazt9ALhr0OgVJWPwE9+4vJPOZMf5U4+rcBrJm3DZm5J6lc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9/SYuIH8QdC3sU051TMpEHm7mo9XwmiAb9Hd2o3Fy+9xHoJ5O
	y5VMBz8Sm4uO/jAIZCxgSA3g3+PSnq+RVV1xyM9LUniWSKmXOa3kxt45WXXObAsMXB4iNXgGes0
	x87lDHCkUb6MLYJ2Jlpyz2uAbxQBdRAIh2GU1ER1q8CNdTeQ2jQe3nKmKPJPCdSkgj88r4w==
X-Gm-Gg: AY/fxX4Lwh3COqc7TBsxseUULxuqXXt3ALil5Kx3MTr4RQ8W0cs0gAisOWD23h6fkuB
	NRuT5aK+3R8QPEd5lO/dFyiNbifZuUgyC/93tZWr3+BaaPjXgC/mmq0vIGiddm1rV/C/WEacm1i
	7BTREOC5wkPQTP3rp4yRb7V8sENJwtFNSfHy8GLBJJbE4rXL0aeg2vW24RIF3GoC4pkuuNuzX7H
	wZ7AvImz3EhAoR2irsTRSecLFydEf+cM0ELKsvyEVJfI3TeG22rWcuWU5MmlPf38hXeDt/abdeq
	1VwA33PVssKT6Nz9j5hhunYG3JMORSIcN9mYlINiq/uiqFzq9veoAkm1QLd9ov77ktaHUY9j4Sm
	gJquWBHqblOLXXL+yPhuDulcZ/tYdNOcRVewF6x8rGE0CUHOvkm+c9mbVhMw=
X-Received: by 2002:a17:907:26c7:b0:b73:a2ce:540f with SMTP id a640c23a62f3a-b8444c80f04mr1718744166b.17.1768222498465;
        Mon, 12 Jan 2026 04:54:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPr3dIgVWRsuP91OEnws2gf/Ukq1HmhAKZbz1wMFay2J0zyGKodjzzWjXpSeXa764C1KXgRg==
X-Received: by 2002:a17:907:26c7:b0:b73:a2ce:540f with SMTP id a640c23a62f3a-b8444c80f04mr1718740366b.17.1768222497991;
        Mon, 12 Jan 2026 04:54:57 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm497062466b.16.2026.01.12.04.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:54:57 -0800 (PST)
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
Subject: [RFC PATCH 5/5] s390/configs: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
Date: Mon, 12 Jan 2026 13:54:31 +0100
Message-ID: <20260112125432.61218-6-lukas.bulwahn@redhat.com>
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
tree, update the s390 kernel configurations to set NF_LOG_SYSLOG and drop
the deprecated config options.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/s390/configs/debug_defconfig | 2 +-
 arch/s390/configs/defconfig       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index 4be3a7540909..93721ca340c1 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -176,6 +176,7 @@ CONFIG_NETFILTER=y
 CONFIG_BRIDGE_NETFILTER=m
 CONFIG_NETFILTER_NETLINK_HOOK=m
 CONFIG_NF_CONNTRACK=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_NF_CONNTRACK_SECMARK=y
 CONFIG_NF_CONNTRACK_ZONES=y
 CONFIG_NF_CONNTRACK_PROCFS=y
@@ -327,7 +328,6 @@ CONFIG_IP_VS_FTP=m
 CONFIG_IP_VS_PE_SIP=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index c064e0cacc98..7750f333a1ac 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -167,6 +167,7 @@ CONFIG_NETFILTER=y
 CONFIG_BRIDGE_NETFILTER=m
 CONFIG_NETFILTER_NETLINK_HOOK=m
 CONFIG_NF_CONNTRACK=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_NF_CONNTRACK_SECMARK=y
 CONFIG_NF_CONNTRACK_ZONES=y
 CONFIG_NF_CONNTRACK_PROCFS=y
@@ -318,7 +319,6 @@ CONFIG_IP_VS_FTP=m
 CONFIG_IP_VS_PE_SIP=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
-- 
2.52.0

