Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE22A1D619F
	for <kernel-janitors@vger.kernel.org>; Tue, 25 Mar 2025 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742894532; cv=none; b=ObWmZFCeX8sXc3PbfnMv3fZcjbLP3VzyjLAKbwWvVJXBJ+ePvuGtQR00N9qys5WSSwd9aOOvwsOOGkFoTYyE+gY1wBU50ppeVFlNmYFCGmO3a0iSyd8/5KK1FhrDupAQpzc44mqwLCcbTGbsaaRQjXUiFD+d76YBvqYknKKGqx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742894532; c=relaxed/simple;
	bh=xaWwfXPFRfECFLckVObq454sJfCkJQ61bDemiqaexqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZsRWkb7MleE6k001Af+8k6RM76CUy/MAr39LT7+KWo+3cXUnsxVcmbtyoa9d/tZaqCq3IXRiJcqI7y9F3zvQ+IAjim9ceOipMIVmRoIAw0O07743Hx2AgH09jqmHLUz9MDwO1hYslp0QWaLn1Id8/NTbd6j1asEDefK/vJe7OuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HCuF4h6F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HCuF4h6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742894530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P9IKeqJUU7xfsmBL2lNiXrAlhz1JyfP8xtACFJ20okg=;
	b=HCuF4h6FhHAEMYTRcGQn//Wjz8F3CClu7UcrdKTkuWppp9zTI0nZR4Kd1qOk/ZTyRuEDjy
	tuSAjpZBvPQaazNfZGWihmqUsn35/+TerYW/QElRC22sHoPh8pi1Vry8TPd7I0kTgmrLOl
	ry5Fv9nxN8ZY082dyc27tABSuHC6z/w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-sE1S8Bg8NJKFVMWS67figA-1; Tue, 25 Mar 2025 05:22:08 -0400
X-MC-Unique: sE1S8Bg8NJKFVMWS67figA-1
X-Mimecast-MFC-AGG-ID: sE1S8Bg8NJKFVMWS67figA_1742894527
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d6c65dc52so6712595e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Mar 2025 02:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742894526; x=1743499326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9IKeqJUU7xfsmBL2lNiXrAlhz1JyfP8xtACFJ20okg=;
        b=FeQTvDPDVN/BnpCdmNVjQd1PzPcU+5fEerxrs14lyUEr1ijn4IUVBiin/xTUXnmuBu
         bCaHDIvS7RdzJfUXVLovODLwGdbzn7Y587PAaYqPhVoYQrPVEzzYL8EFJdr75cGQEgVw
         LriC/q2PD/0D0+jOlJArKEhSj5C6mCkmapoOzXw2JW8Jj5cfWuwPTewHIiAKU7t2zJZe
         rjXa/iUrfpVpULqGdf14FFZAgWRdrH3b2W/9OFFRckb2nJEZP0IOrsH0L7AYUWpdacK8
         1r9zv6+cX8gGdci1EYmjQDeYK8MulM8X1lW9fZFSQ5IsRdjXSWvMBuVByIYnbUh7Sfth
         jlng==
X-Gm-Message-State: AOJu0YxKOungVBg99y+NiBDN5rPUduf7q4XLGIpyaW9tQqNC2nLM/bqA
	VHAowTeC4Nj3utjlA+Ha7QqL+aOFOfrj2TrJnTZ9/wtSU9pTwH8Np24QyjTIymFbCFQ4SU07epl
	6OA1ZEI3ZJwLcOy9mJmTBzmPjuUXFAlZI5LAEFBbO/wQm4ugGi8ZNWoiF/R7ujVL73w==
X-Gm-Gg: ASbGncsq3v7gP9v1nGi6nZ291FGwVswUINEbadQ5EP35oLIwJkCPr8/Q2eC1qnSvLiG
	KUdPlMUQjcFHeSD+ywNOVEKyxpIfLmZtc6iIO6/7qnpDNDOin+Z1VwV2pcFqcbod+tNAtarS1Ju
	/tpDdKfXlexEv95+3gW8t+NS0qwlRWlnP9mg82sMjrFtpX+xYCzSNXIrRTtuO8dCX/hJqECKmFm
	98cner6VcgAT8x1dSkMascaoGgXuCkIgi+ugzrVzhqkECgV4S8j96dgTMeDBG9IHJDV2Eo++gaE
	OttnjSgCw6MkzO8PT9Od1ATnyDBi6CcTwZdZhdsWpsBBc/z4lfP6zVx+6ZPOSA==
X-Received: by 2002:a05:600c:1d92:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-43d509e3facmr158369975e9.4.1742894525946;
        Tue, 25 Mar 2025 02:22:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgB3O6gG9DIBwRaHL0X31Mvb/WLhRUK8r9nnr/FWmU8azB5KhfTf5kSGnz61tuuks4tGk/sQ==
X-Received: by 2002:a05:600c:1d92:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-43d509e3facmr158369595e9.4.1742894525528;
        Tue, 25 Mar 2025 02:22:05 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9ec29sm144070755e9.30.2025.03.25.02.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 02:22:04 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Bao Cheng Su <baocheng.su@siemens.com>,
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>,
	Tobias Schaffner <tobias.schaffner@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust the file entry in SIEMENS IPC LED DRIVERS
Date: Tue, 25 Mar 2025 10:21:59 +0100
Message-ID: <20250325092159.213463-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 835a0c10d33b ("leds: Rename simple directory to simatic") renames
the driver's directory to drivers/leds/simatic, but misses to adjust the
SIEMENS IPC LED DRIVERS section in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference. Adjust the file entry to this renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e6454e171c4b..7a4408512381 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22040,7 +22040,7 @@ M:	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
 M:	Tobias Schaffner <tobias.schaffner@siemens.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
-F:	drivers/leds/simple/
+F:	drivers/leds/simatic/
 
 SIEMENS IPC PLATFORM DRIVERS
 M:	Bao Cheng Su <baocheng.su@siemens.com>
-- 
2.48.1

