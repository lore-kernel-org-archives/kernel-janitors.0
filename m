Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1033DB65A
	for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2026 09:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182215; cv=none; b=FeC9OYuJa6mdbOa/R1l38saCMr3He9xKuzcj/i3vpE5oG4tLtZCBYGnMnI74vn1GPQSXPQOJdpCxXcmqtTeA1EEqG3M+iFLblNZ8vobgrYzOdPHpDknP23f3j5Kmd3hQwty+A1bb4vP8c9GcRv7UhnNs+CgroUe3eLrcIowocRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182215; c=relaxed/simple;
	bh=POGVjhh97Wkq6I7DJgr4RTvlvpO4sa4R0ktxh1slj8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZRIjtdhoDtsRKenB/xu9odQDTo4xVwQyFCkf6YNI9jYjEHBVlDLdxp+RXRmcToEpgzCE6A4CZl47dyNi2qYjnwqLiPVAS00nYaoejz3jC+dLi1TOggCSNrVw7kkNpCctQtB97CQXzDwb85PCb9pbKtpQZUMhAr9IRzYJghOnO3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eXBySPMz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dO3ooaav; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eXBySPMz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dO3ooaav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779182213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Psnh/1orvkXMNjpOzKqZw/Hf5BXfe/yVOhTHlyVoMU0=;
	b=eXBySPMzCjXTmXoQffdxpPehgohKZuPds6OYZcpZKQur3TxB4N1ZTAlYocRgFYAPAu67Ql
	Slitbi51KRZ+ZtkCMdUhZuO9H3OygT/a1oWi3oksL92mPdB4RasIGIufMF7qF9Hsir6g2J
	qcYgp8wMvVLjxutFByAgczyfxxTIwms=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-4D2QdOUPNTuSfdhUK5ecdw-1; Tue, 19 May 2026 05:16:52 -0400
X-MC-Unique: 4D2QdOUPNTuSfdhUK5ecdw-1
X-Mimecast-MFC-AGG-ID: 4D2QdOUPNTuSfdhUK5ecdw_1779182210
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-44dad1b938fso1969893f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2026 02:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779182210; x=1779787010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Psnh/1orvkXMNjpOzKqZw/Hf5BXfe/yVOhTHlyVoMU0=;
        b=dO3ooaavu8NebkdbszYP6Hg6HCcOcTGZlRa+t90/q5L9wQp/s8qG+tJ3U2d4woZ2l5
         d7b1cmmivDxWd8++PSlZk4nn4qJWZyuwgYVAL/nn83TztCeGY1gryWvLb42qcsTWejwA
         gFjsrZWtws2iuSQJoDPSCq4UdzGdha4+YWxOA/GWCjYCA4WBgTDAYx1GU67fISPtjsov
         Cd3wP1/2XlzVs6824WJxB9kcSvHBXxzPFkPoYvJ8t45phJhwY6awn7XIc6HqfQLtNyWq
         tshHB+e5LikSvP+FnNFIDsRaCcvptAXy3i97kmsyTm7WCjJs9VPxWh+xxVQYgcgATc2L
         hQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182210; x=1779787010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Psnh/1orvkXMNjpOzKqZw/Hf5BXfe/yVOhTHlyVoMU0=;
        b=KkHZNXkd3lJdlBM11FvBsiEW4PvG2OnBTmxIGT5zXQ3922kR6z5ZeYPrTWht+TmKuW
         gDF1FCqa4iZVcoWDgZMqPxKiQFP8zNbhvfDiJghknYXs7igZmlUSCpd+c59HYLugD8OT
         tbNhqDjx8onjkkFn77y0Y1AMm01zsnp6z6mVKSZEB3YPAunE1f7apUHHL9OfBCdsHMOz
         vrPXr7zFb7t9nEYtTDApMnVLAR019qLi3JJyNOB5vdiYEx43ZcLpjNmHf75rt3NsRwTw
         ZnqxweQYC9U+XFZiFo3/dPwRimKSJxJ6YmKyUih9Pek0yWyQidJM1kJbjupiNqoGA3Ad
         deOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/dQoO7J0D+aNAUkUkOs/NU1bfERYLECZiJhvF57aq8CNdJx5wcHhho4raemjZdw0zDKgsUcXeDJaI0gEgf2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYS1IhHwWrPNua6Ojh0gwNd9Ld6dNbOJnyM6chNbliyqnz1SP
	IN373SUvVlacZvvHTx7ovZ3ixez31t/TWnt4GaUZFVutGEhvkmzi0Xt8LY/zgLG9zD3R/j+p/aB
	/FEENzCuDqwHJWSvtBWIMPbKHXzNYljdCgPpknEg/RJdnxPIKboEcgz/ssW3rHEQwVeEizw==
X-Gm-Gg: Acq92OGj3hO3l25G2eJS2RYW7LBNrlFky5FOWSUb3mUeA6tsDi27GhdzJ2oEjRd4XZz
	FN4/hALIxsQe8/JEbLJMUjDqTkPS7AUWJOOy1CSJ+PcqzKn2dH00IifmtNEyfiu/6LQg7iUykyE
	7Cdek1/xZoF2nJbruuQwZE9W0lpssrL41VnEnQT/pi5D0iGzdDkWTKQZvzFtEvBPZp1YsHMISI8
	nRh6GezFsLvH0ukPmWG88k3L2Thk6+EGttciFxHPvR+QKnuXJTBfJ1Dcb57lsd+4bjCWzr/Hoxu
	YLN0W846wkkaHHBLBq47uS1QJEJsN+Dv8K6xKqca8FvTW6YyT0ssVg48hcQKE42QGRbqclrXW2O
	XA8siRRCH0ikmBSbsvuX6dKU4ZgjsEn1ES5XX8B9fMO9OcsyttpVGdH5iI21QQzKG3DckLog=
X-Received: by 2002:a05:6000:1aca:b0:451:bbe4:b48e with SMTP id ffacd0b85a97d-45e5c57d380mr28511212f8f.5.1779182210484;
        Tue, 19 May 2026 02:16:50 -0700 (PDT)
X-Received: by 2002:a05:6000:1aca:b0:451:bbe4:b48e with SMTP id ffacd0b85a97d-45e5c57d380mr28511159f8f.5.1779182210116;
        Tue, 19 May 2026 02:16:50 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm45178454f8f.34.2026.05.19.02.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:16:49 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: remove obsolete file entry in NETWORKING DRIVERS
Date: Tue, 19 May 2026 11:16:46 +0200
Message-ID: <20260519091646.302458-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 5e138e0ec32b ("w5100: remove MMIO support") removes
include/linux/platform_data/wiznet.h, but misses to remove the file entry
in NETWORKING DRIVERS referring to that file.

Remove the obsolete file entry in NETWORKING DRIVERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e541617ac448..27dbf1ca8283 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18631,7 +18631,6 @@ F:	include/linux/fddidevice.h
 F:	include/linux/if_*
 F:	include/linux/inetdevice.h
 F:	include/linux/netdev*
-F:	include/linux/platform_data/wiznet.h
 F:	include/uapi/linux/cn_proc.h
 F:	include/uapi/linux/ethtool_netlink*
 F:	include/uapi/linux/if_*
-- 
2.54.0

