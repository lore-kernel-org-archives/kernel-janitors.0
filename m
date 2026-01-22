Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7475A3B9602
	for <kernel-janitors@vger.kernel.org>; Thu, 22 Jan 2026 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067984; cv=none; b=P+vhgBU3gmrmAbfK/w44CdybtfeZvvK2v9DqIH8ngOKrcjMEdIr2JlOjoPsT99f98eXdQLUf/8ZrlEdvvD4Vv2F7pcVHKBwzUdIv4/zbwqsDs9vaeum592f6FFuSCvgUbQiWwDgv+VzuqkAbEhXLAd91pgq/ZMRHGixn8PFJeRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067984; c=relaxed/simple;
	bh=Mh6GmTAcC6CCH1HP0aQQaSTCLqmkUkcVsNO8jNHEmLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SgrUgMo6SOrsh7qrItmK9E2mDgOm0ha1lbDjkRo4S3eqYHLWtxkm+CF0I5T6szLS+pynjwB8dSyamI3O0yUU+DAKG93cCk/QgcQOrBMOiPRdITZEiPYniR3kwJKcwvMYyCFgz1AO1V/KzctEitfqLJy5hsdPC3mMXsSb/3YgAOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P3mL5tce; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=r2+qbaSM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P3mL5tce";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="r2+qbaSM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769067978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t9dKCUHIDcz6wnU/JJwI6d22joS1LJKYpB/XmCytXco=;
	b=P3mL5tce5duRpy9KWfvcdTNXOn6wcXH8pOy2bk8QkHL6BrqNRmX2jwuEsKsgIg70LLLnB5
	APTZErHYsYPMVCid61Eno5adgfj32wyulGW4g3uV/nzPk9PVNTIyuobXiQkp4EgYGQqAf4
	zwAdK0fewmxa7P3zmeA1orhgK9AzUz0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-rEqVl5y8Nw6t0g93O8bxhg-1; Thu, 22 Jan 2026 02:46:16 -0500
X-MC-Unique: rEqVl5y8Nw6t0g93O8bxhg-1
X-Mimecast-MFC-AGG-ID: rEqVl5y8Nw6t0g93O8bxhg_1769067975
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-477c49f273fso5927795e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Jan 2026 23:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769067975; x=1769672775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t9dKCUHIDcz6wnU/JJwI6d22joS1LJKYpB/XmCytXco=;
        b=r2+qbaSMmTV7KsscSYKPh7Va/vQ7sqyKXu1QlAp+uHtubnGaWhztE7WD30AVBh9Guf
         qDgm85TAh5Aw1oScUHe3O5F/5IqfiA7SRdPu60d03KgssYtpRUzRkciZFjvmRBp05q5G
         Tn/OopfO+zKV4KfQfQnpA1zeKkhkP7R65kILhO5s7twhJw88Qh2DhffsFNbe5SJDReoI
         iO/mPU2K1COPap39MEkiGDO3fRL6VGQaD0Noa3VoWnBq/rMZXV270bG2QNpll/3dIe3O
         AyponrlqKz0+Xf40n2FEbGKlWBqDJin42MQ2w6Xj9HGhTcOfWvpulnAaa854bSQTOhob
         hmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067975; x=1769672775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9dKCUHIDcz6wnU/JJwI6d22joS1LJKYpB/XmCytXco=;
        b=mBPom1oqKG4dNVyJEJbSb2TZupQ3Mhaa0xB6z7WzI8ZtQRffLSbFNqoV0cUwhw9WkI
         /aceu/qjiuPhCHzjlzjroyuz9XCsy4hpyDH/6+Aet32qqTQ3638fdRVU2aJ/YFR8SVvE
         ct2GtGqEzlz/M9Z9vNZ9Yg+JfDCwUFzQMuQ6gthv5rYmRx8rW9I1tV7Zmh7vf7mhzMUu
         4KzihrCDZVBdHCLWbUty+j/5G4tqsQkOIFhfYT/AcJfgkyupFuXEZ+spAFoE+w74HZWG
         WieOVldJqN8kAEe8RddJp5IEj24Ef8RBRdy/JWAEOaJ82MgCl5RUF7GzkCXN+hCyuGqB
         5+YQ==
X-Gm-Message-State: AOJu0YynOmDjTgGXAigagpV4nxRAvxg+tJda8RRdP8T85aP21mwHIRET
	IzWIuzEMY+FtApP9NDPHh1K9fIp2hbEJV//HsPqIpRMTp1ppr1VBHKBFXgT1ZgIHYGi3k6mKoM5
	b1ht9BJJYW53+ngSQ90g9jOT+cLI3PZcMh4921XydPmhd1xaBsxuNNGmuQdEbw0z3RqrJNQ==
X-Gm-Gg: AZuq6aKJ/tADgCcn5++YgmULZvolW6dhvMnJlUYz3+pYix3wC15ZkGcWewN2U2GabKc
	P4PdEwGHKBE8exwWzfSZ52ZZGpslC/1uUyisgXX4mCi3vtirfN3Zzub8Y0w0Y/dBer5FloX30aB
	uTzY0QDhjh0n0N77LP/EgdE3QSA2l9rRqSFjQmqh2DPUeaeFbKUa9yiwv3O0zx291d6iCi8vYy1
	hobLU8tPgeq0YmmI+mAtWAw9cfUVtP79WTzSvBL5wFNHKVC8iV189Kon9HwXSxDOZT2CEu/kXOJ
	GtIHfVc99I1k0OsYikC+WaEfoBRbdcqgT2kOPk66tg57Lm2ro7SShgfIPF6BvhjPJCp9f9AjkB6
	eKjVgoVX+HoKJey3KN9+Oft8BFdKp53NVd2uZGgE1v0uV+UWgIj7ynEKwv4A=
X-Received: by 2002:a05:600c:5291:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-4801e2eef8bmr250977575e9.3.1769067974932;
        Wed, 21 Jan 2026 23:46:14 -0800 (PST)
X-Received: by 2002:a05:600c:5291:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-4801e2eef8bmr250977175e9.3.1769067974509;
        Wed, 21 Jan 2026 23:46:14 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804702876asm50954025e9.1.2026.01.21.23.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:46:14 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: remove obsolete file entry in NETWORKING DRIVERS
Date: Thu, 22 Jan 2026 08:46:09 +0100
Message-ID: <20260122074609.151058-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit d8f87aa5fa0a ("net: remove HIPPI support and RoadRunner HIPPI
driver") removes the hippidevice header file, but misses that there is
still a file entry in MAINTAINERS referring to it.

Remove the obsolete file entry in NETWORKING DRIVERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a56f8f00aebb..350e7c64e12a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18275,7 +18275,6 @@ F:	include/linux/etherdevice.h
 F:	include/linux/ethtool_netlink.h
 F:	include/linux/fcdevice.h
 F:	include/linux/fddidevice.h
-F:	include/linux/hippidevice.h
 F:	include/linux/if_*
 F:	include/linux/inetdevice.h
 F:	include/linux/netdev*
-- 
2.52.0

