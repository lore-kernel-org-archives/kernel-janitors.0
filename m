Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B8D13CA9C
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 06:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712816694; cv=none; b=hR0vzsvmA9lOkz1faneX6PL5WVH/XruYrugULSKEY1g+HXDPJ7wBDggis/WnMEyb6kBQZiiE4KbMdZdJkVnfy9f4bqohHPMUvG8Rzw0MKgfw+Y3/RbNPd/5uXkVH3xLtfovH6r4WBK5Jv1oDTJOeeKF9qSt0sDmXlB/wsbNczSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712816694; c=relaxed/simple;
	bh=444uiMQcMJzHmI0zrEsPgMSi/MBOOaGCll154shiDkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XKJlNE92MEhRrPmBuS57IwAvQZqUAwo1OW0ZTU7ji6sOEb7+7zMevBpppaEdfnK2giKVDCvvjlJ0Ikp+nl1V1sXXd6Ztbb/V0wYxYiRpA6uXzTi4jhD7X1q5m7S7j0SQAmGpZxI/rWKBibh90lBtpKSZjcKgisGHefEwxyla4a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TeO9GwMU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TeO9GwMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712816691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RCX6MGp3mzAjan9U+6PijABpgY0GU571g8JyE/O/vz8=;
	b=TeO9GwMU9W6vbVKXQH2SVDb+gweANoZshYdAl56eigKDLJiJsI8trkynSAxPWpFm9x/93w
	TfqP/2h6R3bUKJX0MAZz/I0jP+9q5hksLZPKg21L/+KQcfslbV6ej1LY7lxjyrYuOW2jt4
	CTik0L8KZ7CUxSSigJQBcr6cqGhaUEY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-KgvmSyGnPCaMzcZ4wpe_rQ-1; Thu, 11 Apr 2024 02:24:49 -0400
X-MC-Unique: KgvmSyGnPCaMzcZ4wpe_rQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a51c86d406eso50558866b.3
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Apr 2024 23:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712816688; x=1713421488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCX6MGp3mzAjan9U+6PijABpgY0GU571g8JyE/O/vz8=;
        b=myoMs8tsBfPIWOfsJaJo3SERJByzoP7KTDJjwUe2bJOUB4CPICfALziwgzvDJ498gR
         21wz4/IeGMV+UuUF64oaXlgUuE6cDAZ1rNS6OiwBkT0Rmx6yOtMmsmSz9TEnjfClDZHb
         qPQslykpIX6vBZMr7QjtqRs1kMYRdLrxrftseAIOh9IzIMD1m+AI7t9GkLUwqpYxvs/B
         yuPPbyILv5S2QpOSh2KTfV/21gxGVHuL/f0W0WZzsQuJmJkdwa9f1/WkHSYHBmIKBufT
         JtTUAJ78P6cBvtZs8exfkQzXIkchqPRmZzNAF3Je9i2abkbKkAxFyysyb2zJj6dKwBOW
         FEwg==
X-Gm-Message-State: AOJu0Yx+C2ciiZ/nR1VbJmxQuYeyDKAuICTlXRp6isYs629BH04wji6x
	uYiZkIHyjYz16BOSQVSjjHDVirINmc9IRZrXVc9vBoW5kMMKCAzFFTJXhnWAigybnWgJJ+twLHL
	svvNieQNTnVbozRTTYemGajwXcGp4VFv7gIfq3jzPSnkZgO6IDfYZxL9JkSpdAYTuYA==
X-Received: by 2002:a50:a69b:0:b0:56d:eef4:28f0 with SMTP id e27-20020a50a69b000000b0056deef428f0mr3980163edc.20.1712816688787;
        Wed, 10 Apr 2024 23:24:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnVcBcnrTAav1zdTHrQ+F/XWt8yZqNhgddppdiT7mQ7vHwUi/Ryaz0cR396KTlvaukyg8GrQ==
X-Received: by 2002:a50:a69b:0:b0:56d:eef4:28f0 with SMTP id e27-20020a50a69b000000b0056deef428f0mr3980147edc.20.1712816688397;
        Wed, 10 Apr 2024 23:24:48 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id z21-20020a05640235d500b0056e718795f8sm379123edc.36.2024.04.10.23.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 23:24:47 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Ben Cheatham <Benjamin.Cheatham@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-cxl@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: repair file entry in COMPUTE EXPRESS LINK
Date: Thu, 11 Apr 2024 08:24:43 +0200
Message-ID: <20240411062443.47372-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 12fb28ea6b1c ("EINJ: Add CXL error type support") adds the header
file include/linux/einj-cxl.h, but then adds a file entry with cxl-einj.h
(note the swapping of words) to the COMPUTE EXPRESS LINK (CXL) section.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair the file entry in COMPUTE EXPRESS LINK (CXL).

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index edf6176a5530..03204db05027 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5415,7 +5415,7 @@ M:	Dan Williams <dan.j.williams@intel.com>
 L:	linux-cxl@vger.kernel.org
 S:	Maintained
 F:	drivers/cxl/
-F:	include/linux/cxl-einj.h
+F:	include/linux/einj-cxl.h
 F:	include/linux/cxl-event.h
 F:	include/uapi/linux/cxl_mem.h
 F:	tools/testing/cxl/
-- 
2.44.0

