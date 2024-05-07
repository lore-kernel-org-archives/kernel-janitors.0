Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B258C15F314
	for <kernel-janitors@vger.kernel.org>; Tue,  7 May 2024 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090499; cv=none; b=jZU0e5lc00QdqDIlnCtOE1KlwtlkPYJru32YEujAeVEht7+Cfkd1R3Mhupft1GrbaESAv1m3JES3WpSJtXkqj+ZMzwLgpfU2b4AC4OxOX6agYoeQrL8ffIc73x5cE1JoEfcCMdFMNiei5jZhY/ym0i0rb37w4+qir7aJZENG1Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090499; c=relaxed/simple;
	bh=+g8grQa8IFxIKr6O761BzLF6WlW57k8wJHHqWVnea9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaqY/fbkbzigARoQmbbtrLA2GpabEvWCsLn6DzFn0cX59wz8v36maxUTDMsBpR1Foka7dPF8OSNxaSOol99kBF4ocggX/8nBpsw4ob/eYMrg/iBtSXeAkUiSZVOEWpwwCLMaaWJ4maPMv7cW+UvnKF/u6HRQoNjpM1UkLYZgVCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L3YkBltt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L3YkBltt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715090496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ULn520VtyFUFvINDBmnGTg2429ZFbTlPrrXCyiYuIFk=;
	b=L3YkBlttJDzX/Y9ntOnuntR4UmBBiEj1KoDcyXI7oZaHxswieyxJuB3Tz3DkiDr050qzg1
	DmLgWlZLzTrPVD49YvqTUi05+jiIouHK9+KPVD125PZ3w4z/MEWnLZm+ll4KRCBqg8axDj
	u9oy2Wn2E1zcR9742dhEGDui+HFNSpQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-F8j_UIoOOMyOXOHC0hGsJQ-1; Tue, 07 May 2024 10:01:28 -0400
X-MC-Unique: F8j_UIoOOMyOXOHC0hGsJQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a59d0fb7731so157903766b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 07 May 2024 07:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715090486; x=1715695286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULn520VtyFUFvINDBmnGTg2429ZFbTlPrrXCyiYuIFk=;
        b=dt0SFIP+JSIxykyO+H2iGIB8nQJuWbeKV7eoymYarAW6SY9y2ggCnfKOJaD0Z5Ar2O
         b3pkbFxwS5A2GYaXPs+MZ5SojcxjjjELWj5idtndhYViCh+LwtYarBHsuaElFSAjn3Kc
         Bc4INwaiorTOE0U1eOVgcrNqSMmeZ2OFACQBHbGhtTFQylwlWWTxIOYpyweTYb794k4f
         YtpXxmev0x5MMh+iVtXy0gUx50LLBs6SY9cOYRGti+mzemKKKT1Fui7VKyJyrbZEIBuD
         jx3JeDM/mKhDX25cokuPVUIBv3ZtskUY2qL25tDRQk8Ol9lmeYwNkqEHMZQNXVPgbIJQ
         gaUg==
X-Gm-Message-State: AOJu0Yy4QoyQZrMw0FxWujRerBWF5ndkBlLbbsukHUztzGGhuYBL8BEu
	jiuYPAD4YmdriUUzSADVHMm0m5/f1MPEHa/6UbQUOXEQaaqBhHYSLQx4jWG3qRGIO2CzNNQ3MNo
	OApl58mr60vjOQnytASK9kbZB/23O9CGhI4T92dLScZIfWMdBjDf6u/pzbb9p6TvUXA==
X-Received: by 2002:a17:906:c311:b0:a59:b099:1544 with SMTP id s17-20020a170906c31100b00a59b0991544mr4636183ejz.42.1715090486687;
        Tue, 07 May 2024 07:01:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWKHyguRFTZU0iJ+9SVdFZmCvdMPXw68yJmNWWRHcy4KBLCFlWQ0WOCjLrHyUtqT8caqLjSg==
X-Received: by 2002:a17:906:c311:b0:a59:b099:1544 with SMTP id s17-20020a170906c31100b00a59b0991544mr4636165ejz.42.1715090486292;
        Tue, 07 May 2024 07:01:26 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ag3-20020a1709069a8300b00a59a6fac3besm4341867ejc.211.2024.05.07.07.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:01:25 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: repair file entry in SECURITY SUBSYSTEM
Date: Tue,  7 May 2024 16:01:22 +0200
Message-ID: <20240507140122.176304-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 67889688e05b ("MAINTAINERS: update the LSM file list") adds a few
file entries to lsm-related header files. Among them, there is a reference
to include/security.h. However, security.h is located in include/linux/,
not in include/.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this new file entry in the SECURITY SUBSYSTEM section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a37cca3c47ef..ca79616a4836 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20140,7 +20140,7 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
 F:	include/linux/lsm_audit.h
 F:	include/linux/lsm_hook_defs.h
 F:	include/linux/lsm_hooks.h
-F:	include/security.h
+F:	include/linux/security.h
 F:	include/uapi/linux/lsm.h
 F:	security/
 F:	tools/testing/selftests/lsm/
-- 
2.44.0

