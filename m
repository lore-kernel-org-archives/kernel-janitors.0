Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BB32FF15E
	for <kernel-janitors@vger.kernel.org>; Wed,  7 Jan 2026 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767777877; cv=none; b=K9B7KIVp41rdjw/ngtLlObU0rZ5HSgC1XB0ra7Wbu5CQ9OyB3otN92VoIEbTbN14zXrBFWKbT4JARWHJnuPwF1QfidbOXo//17595ILmKUC+iyYsuTvyjzd/UPviELsIoGt6s5q2bUKtSWMAnuRaC0s1SQ3vv2J1vBMgP49QyS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767777877; c=relaxed/simple;
	bh=43FVetq3dMIHDGR3851Ik/AtaDIp/9UOdWp+H2pTqss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ijcUuJ2VqSup2p57C8IHMHAw9cwmokL0Aew9bxM1X7SgJE7KP3p6OfBJhVW1QgQj/dcuIuLke7a53cp57kXjuqO6j/CqdmxNHZTcyHuIMaPBZpV8hCFg9dD9iTwrqwCCma0F2BIjOy6KuIFyDcrIUmSa2LdlKi9dOyF0pd03rVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jQAnbOsm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q7EwWB8m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jQAnbOsm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q7EwWB8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767777872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xO4Hnna/PM65GX4N7VWVTxlOrs/0fZlHLbFN32qG7Vk=;
	b=jQAnbOsm/Iemc3THqi0ky5ZB3G7Ak4UvLTiHDBECZ6j5yzaoo/tOp1AweBkfhMy9mxOypm
	ipgcf7GCDy2iCVe4crpCsYyXq5Cdxdp/ucXGIfLnTfS0+a7+aJXORC3QxLuNmuW++0otjv
	VR7Fzgqi3HEXIS4lLUj3ZYYxUx9WDgE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-AF12cTQtOMWkFDBoxuSbcQ-1; Wed, 07 Jan 2026 04:24:30 -0500
X-MC-Unique: AF12cTQtOMWkFDBoxuSbcQ-1
X-Mimecast-MFC-AGG-ID: AF12cTQtOMWkFDBoxuSbcQ_1767777870
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477a11d9e67so12970325e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jan 2026 01:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767777869; x=1768382669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xO4Hnna/PM65GX4N7VWVTxlOrs/0fZlHLbFN32qG7Vk=;
        b=Q7EwWB8mDnJEspYX6w8zNlNvEQac3MHnIktgc5ajm7sbyigRiV6x02NtN7LOemdOPL
         qNv3v/5Wt59cAjVtLphKkrMNI+WFAEdOMNF3VT1spJQzzuL5cpqz3e0d7zyJP9QwM766
         UgdfLF9/5qt1YTpOFp3bBrUvPMnzoM2BbjD5nN3uBJeaQBbC+KoXxhNcMiNbEK/6fSC9
         82CDHdgo9QH17f+UtfZqY8YpX6ChhcmDpTTbZzFWYWXkpUfL2iIcf/ga6HZPuNk47Q2j
         BI1EbIXX0hTwjRF6AdcqrCqPeDyn424H0liM6HHnCVpfZnq7NFtLDWa/6/q75TdTVrVm
         YWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767777869; x=1768382669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xO4Hnna/PM65GX4N7VWVTxlOrs/0fZlHLbFN32qG7Vk=;
        b=qJh+K8BSHMjDsXLhjEWr4m4OmSbUA66JxopHZ7I2NwcnfCLqiO+oytxI5mBtYUVF4w
         Nk6akyAbH+VyDgtldjnt8B/iO2W/KmzY4cP6e1m+RS15kAgcbtkdYNpjKMjqt+00XjWy
         BbwJMnpgmRolB90lvo9a4E3WEUIy5JZIhZeX1DrW5ezV1Gl8ISelSnkyCeBT3vDV287j
         SYQorVY+QKsqgkOjPrb/7vOOGEmTXhMn9IQszcA6dOAa7bj/VqYBa2glcG77bMkei7vT
         A/KAIvaudRSo7CgeZDZwfyNpie/r1bYejZDvb4tUSOXI1TZWVqzc4Jw2mxds67a7ruuK
         Jj5g==
X-Gm-Message-State: AOJu0Yyhx8+iYMtHWpgl63gpxBYejXOxjkUGyJQdK9gW4k+oO9wtl+aC
	0JtUWXuwPDsMJZnq+5k1gXl+gOEe6/y1EOPmygLz1kU9ygj5j7kfjPk1jj+LuBKoy1/O6GbA1MD
	NXsnNmaN0DOgILYGk/osZe5U7g8dIPWau5R66lJ6s3wUmATjisI2QfChDQ7+A7v5U85ZVxg==
X-Gm-Gg: AY/fxX4ET0ss8A9DYAnKmKw/+TJvFtBC2cGoPgP80uktZePQz76EYMyGQFuuybsRGHd
	/CGCq/8isx05xm3V75vGp5qYQ365mQqW6uo2GCFA3gpeK0Ql1pW8QyzhvxtlAXUz/jzDBfPUXsF
	/Bsc8xqr8g3ZminLU8R6lP+WP00ssmrfqYZKPBQswETQJukcO80ctPtL262fkYHipdcOznL7hM7
	ijXbxR4OQ8M1ubAmdjA3PBE3z4uY9VFwGsiPU0+l2prlrkhsPjyJyl3F4y49W436PXFcwPRi/f8
	H7L1Ak+AGXXr+lgSLP3l4NPYvjhZedi65usy3V74NrFj31FsjvGo0DE2YEe2UdlD/X4xRXqNjjm
	eALbLTNPSY3pmYq/BLWUuI1GIaVU9vXUYPWAS/uvxpyCza+ee8ePL8UGXEyU=
X-Received: by 2002:a05:600c:1e24:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-47d84b36a1emr18071505e9.24.1767777869573;
        Wed, 07 Jan 2026 01:24:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXCgkl4Ya1xSJ5ALe1DMRuwSunKAcM/y/jWJ477IQirZy8oG5STSW34j4Qf5OxTgUw/DTIdg==
X-Received: by 2002:a05:600c:1e24:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-47d84b36a1emr18071215e9.24.1767777869186;
        Wed, 07 Jan 2026 01:24:29 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e17aasm9343669f8f.15.2026.01.07.01.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:24:28 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] riscv: configs: Clean up references to non-existing configs
Date: Wed,  7 Jan 2026 10:24:25 +0100
Message-ID: <20260107092425.24737-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

  - Drop 'CONFIG_I2C_COMPAT is not set' (removed in commit 7e722083fcc3
    ("i2c: Remove I2C_COMPAT config symbol and related code"))
  - Drop 'CONFIG_SCHED_DEBUG is not set' (removed in commit b52173065e0a
    ("sched/debug: Remove CONFIG_SCHED_DEBUG"))

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/riscv/configs/nommu_k210_defconfig        | 2 --
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
 arch/riscv/configs/nommu_virt_defconfig        | 1 -
 3 files changed, 4 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index ee18d1e333f2..544c52067dc2 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -55,7 +55,6 @@ CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_DEVMEM is not set
 CONFIG_I2C=y
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 # CONFIG_I2C_HELPER_AUTO is not set
 CONFIG_I2C_DESIGNWARE_CORE=y
@@ -89,7 +88,6 @@ CONFIG_PRINTK_TIME=y
 # CONFIG_FRAME_POINTER is not set
 # CONFIG_DEBUG_MISC is not set
 CONFIG_PANIC_ON_OOPS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_RCU_TRACE is not set
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index e770d81b738e..4a826e30fa3e 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -86,7 +86,6 @@ CONFIG_PRINTK_TIME=y
 # CONFIG_FRAME_POINTER is not set
 # CONFIG_DEBUG_MISC is not set
 CONFIG_PANIC_ON_OOPS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_RCU_TRACE is not set
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index 0da5069bfbef..4c38049633b7 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -66,7 +66,6 @@ CONFIG_EXT2_FS=y
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_LSM="[]"
 CONFIG_PRINTK_TIME=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_RCU_TRACE is not set
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.52.0

