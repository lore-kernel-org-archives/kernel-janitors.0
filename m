Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B7281531
	for <kernel-janitors@vger.kernel.org>; Mon, 12 May 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057423; cv=none; b=lfUFp8DHPRK3lwiIWPZLvazeXaT6C4djm1ZJY0XC7bYcvbgULmS2xlcdzBnXDOwMXce+XSB/IH5TU0mHocodznFy8eSAmFNjIGEHHjphZzlaxvjDHyePWh4bxu3kBnc6QKZi4rVrTWVPQqIT+GVYoPhcRLeKXMGad8epSBahSXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057423; c=relaxed/simple;
	bh=DIkq7mdvxGhBOJFBrxOyEybYOHqdPTblIBg1vS+0Vmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rU1nUik+bI3wBceg603LBYGy8mRouFnWMfQBAIQdPXsCZ4i60d7uJTDuu8LnJXtX8LQME1soI15Cq9gFYH1YtqwKfdJE0PMZcEQ308Q4e8N5Zoo8e2BGnHYf9Vj5WxlmZD8F4BkGYt71wB/R0pYKVurvNyQXKPBdMOZEZUW5Pkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lxrewr28; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lxrewr28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747057420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kceEV5H6KvQLNqsOUbeqe5/B8K16InTUHSahrshNDTA=;
	b=Lxrewr2814gA76BTIXhzlA50N2/wNCeTZeUkhfAPsE9mvRb6xsmo6pwFt2Me4t4nbCQ0tB
	2eIpG5kwVUVX8i5mqhjZ1taP6y4ZxfePmvphcDbNbPBflMbW8qCl0OBh9l636tWbbh7u+D
	aw92I1Cn2LoAo9XNeSNjJDY+HrOpP98=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-b3A5gtzMP02xCSKg6OIRiA-1; Mon, 12 May 2025 09:43:39 -0400
X-MC-Unique: b3A5gtzMP02xCSKg6OIRiA-1
X-Mimecast-MFC-AGG-ID: b3A5gtzMP02xCSKg6OIRiA_1747057418
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a202744565so674581f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 12 May 2025 06:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057417; x=1747662217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kceEV5H6KvQLNqsOUbeqe5/B8K16InTUHSahrshNDTA=;
        b=dxOG8CKbPFrj8KJGCle9xebtblQpnp8uMV7KGG7UwqPQQ2xCjg/ArXaBl/09kAjUYs
         lAnHNFEQRWjs6rgUxKYI1n7bu0QLqZvGpSKa/MSs0+CJjko8i38JTPEPxy1/8pXoALzR
         VelYSg/J3Y0i0PdRlBMWjqPxXOY/wfHcngLrrly1o/eYrkSrTfuzmoPma/akjxvK+6nP
         cXqY2f1/NrrT/XSM10pVb5/2NMDG/muyGMG2gSP3XML9D8BKPld/hqD7J40KfY/kDnnw
         8S7D9usPNfqOvSTHbJQZmlayHF6/FlnDXVO4Gzr6o072u3cMt9ak7PDNDyxjE634QM8Q
         zTdQ==
X-Gm-Message-State: AOJu0Ywn54/XixbYWbWdzyJjnQ+VHAnwtQoX/sWnTbmKTLNtyM0h/ZTE
	YfizHjX2ukGSsSFnlN4AuIVaptjgI8Aol25npXc2bg1vxbUpwsUKoYXYF7JnpIfor0pNMPQLops
	HUDwbAwTAfpHf/YZBOy1JE/B/ZQ2OylVkqj54tqFbYFDQz7LZaDeRhg4FOWSjYCD3Tg==
X-Gm-Gg: ASbGncuWEP75mP0169FNLOC8qAQBG1pyG+YBxCD6pkuQREXc4ZsDbcPvU71h8I/r4iJ
	8LWPfPErU5jcVx7Aqh2Wox8FtjIxdt1EeKDhNjNMj0TZiTPE0SRVRCJ0AkKFq1bytgPqc05Xggb
	PvHBxmK7HJiu+8USEgu2bV2kNDSnIkaMujWJrkO7vtYmgpFxuDMiJRI+Nt9cjFkJBwqR5hUiHER
	UveSnBh+8+SiyaTfKW+Bzlrh1O4nj7vt0aI3k8O+AU0S20zjTrf4sfhzb+K5ATp3dzRHv/dnxwU
	Tpe0ejrwbQx4c40otTAO5vgeeU5ywFzbs2BtaPx5D/Pufdi75oZOEDeceQ==
X-Received: by 2002:a05:6000:1885:b0:3a0:92d9:dbf with SMTP id ffacd0b85a97d-3a1f6a0fecemr9538722f8f.3.1747057417701;
        Mon, 12 May 2025 06:43:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9GrRsQVcleOZ+a3jzIYyFjnvFHc9WWiVYWigIgCkWCb9s1ctlCszrZn/+QgiDGFa4grcYmw==
X-Received: by 2002:a05:6000:1885:b0:3a0:92d9:dbf with SMTP id ffacd0b85a97d-3a1f6a0fecemr9538710f8f.3.1747057417366;
        Mon, 12 May 2025 06:43:37 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c599sm12700074f8f.94.2025.05.12.06.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:43:36 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Mahesh Rao <mahesh.rao@intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in INTEL STRATIX10 FIRMWARE DRIVERS
Date: Mon, 12 May 2025 15:43:32 +0200
Message-ID: <20250512134332.36366-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit fbfb64987062 ("dt-bindings: firmware: stratix10: Convert to
json-schema") renames intel,stratix10-svc.txt to intel,stratix10-svc.yaml
in Documentation/devicetree/bindings/firmware/ as part of this dt-binding
conversion, but misses to adjust the file entry in INTEL STRATIX10 FIRMWARE
DRIVERS.

Adjust the file entry after the conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 49826646c38f..2c04cce07a9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12383,7 +12383,7 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git
 F:	Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
-F:	Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
+F:	Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
 F:	drivers/firmware/stratix10-rsu.c
 F:	drivers/firmware/stratix10-svc.c
 F:	include/linux/firmware/intel/stratix10-smc.h
-- 
2.49.0

