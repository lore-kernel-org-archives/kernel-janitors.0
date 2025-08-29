Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04132221FC4
	for <kernel-janitors@vger.kernel.org>; Fri, 29 Aug 2025 07:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756451058; cv=none; b=X9sTDa0FB1wZ6ooQaEV8E8wnR0HGk7ae6UFrR2BpPpPmY0PPwvLde3JMQ4Nc8N2XLRz3Zo0F8S41Awa2FTvH+MjftgXANS7u0IPxNVdD1sqtI+3vucfQSk4JU9HnalNAhAD8jF0UmyDx9a3M/50c7t9JOOg2BAq5g/RtFIB1/Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756451058; c=relaxed/simple;
	bh=kAvLvzdaDPJ6ECP5JdqAlgLO+8zgi9bbHR9EEJehkkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mxp86weGiAX+UORgS8Tv035kmOYxmcqWf12C6LRTPiTtWRtjBFOe5VcmXDDo97jvlTI3vO+eL+IxZxnoM92bCMlgD7ZiSzqWfMrqbIhxiAEGn2OIvQYtZjB9L8XciJE0XHrbcbcLSekVj/X+yIOxnb70HFLpBqrTwJ5NKu+KKAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IBI7oACq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IBI7oACq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756451054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HSxQ5uHqTcAFdl8TpMUsBZcieGblejZiliIfARmISnM=;
	b=IBI7oACq/91SyNhDcw4wm0Nzo/u9tLqxm0x+kBdp5MUs4a6j/pKzzkN2GK22g8U676cFQo
	x5T4hz4xE5r0Xly1seiG6him99Ulfo9rh/8qo41dR7Zd/Vd4nCk6LGbt0gdlZeuajQBtrf
	+oa0UaY1sMeoujQVQKnDtmB2Dcw87P0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-9zo15TCyNniApyFxhypXnw-1; Fri, 29 Aug 2025 03:04:09 -0400
X-MC-Unique: 9zo15TCyNniApyFxhypXnw-1
X-Mimecast-MFC-AGG-ID: 9zo15TCyNniApyFxhypXnw_1756451049
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70dfbead769so18045916d6.2
        for <kernel-janitors@vger.kernel.org>; Fri, 29 Aug 2025 00:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756451049; x=1757055849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSxQ5uHqTcAFdl8TpMUsBZcieGblejZiliIfARmISnM=;
        b=v53iWykl8HWpZkFEmObPst1ifi411/QnhOmdVjTokhruhxhQVztolX5CW8xLDyTuyV
         9l5UwWMg3bifGjrPRXMLV297UMPsOOcPcgkXRg0wpsjqrvRvYc5+iZpMj8NyYiRvpuDO
         4jSsiz4tjpN/H3RMLqkvXlOqLEQqOlsyc5LnV6007qWIyWyG+fcu7KbvrBZ80MIVi1IV
         /VkC02ZLXBQH0sjEdRxvqRNpFmyLaHaAsx2wthaC0DeWHbct9x8EuvuTabYkrXCsKSy9
         Nxv6wokHrdw2OsF7XUz992UPyjltiqB+5uFUYzRYsOI1EDiehU0XxuouVdQlrZB2aVt8
         iA6w==
X-Gm-Message-State: AOJu0YwUGH/2ElWBXIhwGjmbDHOwwl5/cKo5LxdlhscQH8V7pG2+/M6E
	UiB+UETIln+srQ0b2uDUM0VRpsZVuGoWg9rPI39ttlt6mQaFuSwA6GqqxZuAlGsNRg+Y+TOLsm+
	09tAMwQpHcX5IEU/azRafMZzf9t31u1VX95W5qNsvnck66SnmfBeh9PxzaKYv5NyvXoRstA==
X-Gm-Gg: ASbGncuS+wCwCzTinV56huGZvjeE9GPV9PWEz2CBwzgMGv5oZGp1CE9p1JVz02fsT4F
	oy1YYiesQxJRE2wjpgU6rr7IGtgNg+7al/mCO2QmUDPnRctxaJA1iRpJ6CHAFCjKbyknzk/cQ8X
	1yRYIhpvHIXwMRE+fwX5OZm1ZccTkH8bEygMX4XgLouXmuTvjPAyOmQ7uqEG28aKvP/PVPjnZfT
	pdkHoNJJCwppkZ2br9kPUEsX+5e4oO/GD6WPfA0mORBDAvPWQMgFuk2GYyabLcBzU/2H3jDFMth
	Rd3ybtB8LSYNyngKOzgWWUe7Xd5oi5L+6wC6rWIAifX/m8ECxzeKQkmoJkaYnSDCXFu3rE91gsw
	JmKd3Pk5EKA==
X-Received: by 2002:a05:6214:2623:b0:70d:bffa:21fe with SMTP id 6a1803df08f44-70dbffa249fmr190374806d6.32.1756451048969;
        Fri, 29 Aug 2025 00:04:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvNCGAKglGCoAmY/c1Jkq2J7bhpvWeJJJNXZT684KY70w9wlcGMPpA0aV6SmC50M6VwQDWXg==
X-Received: by 2002:a05:6214:2623:b0:70d:bffa:21fe with SMTP id 6a1803df08f44-70dbffa249fmr190374536d6.32.1756451048411;
        Fri, 29 Aug 2025 00:04:08 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e57e4b20bsm10805846d6.33.2025.08.29.00.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 00:04:08 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] x86/xen: select HIBERNATE_CALLBACKS more directly
Date: Fri, 29 Aug 2025 09:04:02 +0200
Message-ID: <20250829070402.159390-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The config XEN_SAVE_RESTORE's only purpose is to select
HIBERNATE_CALLBACKS, when config XEN is set. The XEN config definition can
simply select HIBERNATE_CALLBACKS, though, and the definition of
XEN_SAVE_RESTORE can be dropped.

So, remove this indirection through XEN_SAVE_RESTORE and select
HIBERNATE_CALLBACKS directly. Also, drop the XEN_SAVE_RESTORE from the x86
xen config fragment.

No functional change intended with this clean-up.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/x86/configs/xen.config | 1 -
 arch/x86/xen/Kconfig        | 7 +------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/x86/configs/xen.config b/arch/x86/configs/xen.config
index d5d091e03bd3..98b6952ba9d2 100644
--- a/arch/x86/configs/xen.config
+++ b/arch/x86/configs/xen.config
@@ -12,7 +12,6 @@ CONFIG_CPU_FREQ=y
 
 # x86 xen specific config options
 CONFIG_XEN_PVH=y
-CONFIG_XEN_SAVE_RESTORE=y
 # CONFIG_XEN_DEBUG_FS is not set
 CONFIG_XEN_MCE_LOG=y
 CONFIG_XEN_ACPI_PROCESSOR=m
diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 98d8a50d2aed..aa4040fd9215 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -8,6 +8,7 @@ config XEN
 	depends on PARAVIRT
 	select PARAVIRT_CLOCK
 	select X86_HV_CALLBACK_VECTOR
+	select HIBERNATE_CALLBACKS
 	depends on X86_64 || (X86_32 && X86_PAE)
 	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MATOM)
 	depends on X86_LOCAL_APIC && X86_TSC
@@ -64,12 +65,6 @@ config XEN_PVHVM_GUEST
 	help
 	  Support running as a Xen PVHVM guest.
 
-config XEN_SAVE_RESTORE
-	bool
-	depends on XEN
-	select HIBERNATE_CALLBACKS
-	default y
-
 config XEN_DEBUG_FS
 	bool "Enable Xen debug and tuning parameters in debugfs"
 	depends on XEN && DEBUG_FS
-- 
2.50.1

