Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE061A0BC4
	for <kernel-janitors@vger.kernel.org>; Tue,  3 Sep 2024 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725356399; cv=none; b=PKUmqAjQLIH/qazL82J/OOP55cyc/mSpwaFrijgvb4Zm/nnn+9Vzz51wdCm5DcsHWdt6UpKacFl4xUahR7CULNcoEA9ZBUEG4R2qRUGrYNHPkvLothcpeoqYa5X2b69xh2/Y1MYaQbsEEw0JQHo5eCvaTHA6dssGEG+WGmaG7lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725356399; c=relaxed/simple;
	bh=YmM/1Eehb6jsD664Sl2Rr0CIjdzwq6jIGR9orWtFBBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZtwnZjJ6My+72n2QgdxcVRJLTBq6Qd5MtF6UNYQa1Cws7sT60T4WP0r7PQmWp6vJxkvwKTqYVigoMmD8PNFkITEI1++mIBHvMRAzr4u+t1LtmT1KA7qL0k8BZnZcWDv459eqP+xvbTx8YyM7NTFTmmKgdvluXYaYQI7fyzQUM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Au6xXDpf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Au6xXDpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rPJ8JR2hsu2+h8AaCAr5yRN3QjhSF/kOuIBdMukfuug=;
	b=Au6xXDpfDdZcsDmgJ1w3MqDvnKqOCoAy6WZkhVJOVH9cgXirJeTD59aNk84INqek034i1E
	Z4+AivIud2m11d2LO9EmH6HFLPu00Cya485u9JzXj0Vketm6BIa+bXqw1nNr54czTJKwg9
	dBbMgrd8oE24rbEdTlgKHjNqpYGCYpE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-3NMx8oKcPuGtAKcXEBm9rw-1; Tue, 03 Sep 2024 05:39:56 -0400
X-MC-Unique: 3NMx8oKcPuGtAKcXEBm9rw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-374c79bf194so1312941f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Sep 2024 02:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725356395; x=1725961195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPJ8JR2hsu2+h8AaCAr5yRN3QjhSF/kOuIBdMukfuug=;
        b=CzNYnsTmLLq0RGBikxjp2BBmXOzyTuZvRhkk0EiDiDpfiKA7DgvlBOjxfHIfeNN/7d
         Tlbqab6tLZ6sDpc5wYiHwqwuLUz3bXiwSDkAJjac89TOBC7VCRLeTtYNhlhj3/4OpSrq
         AqFPF+LrLA4ns693JVqidsl8Sx0EWnc5M+gZJbLTxP+9rsTZ2g8f7bCRACDshDfGaS8t
         9c6NBGl2Fv/1ahPo4jJ88yUo6gbSUaoItFgCim0sJ48bS5srijaCqvAwhcUsrK0SSwtj
         nJwXi2swUQD5rpqXEPl5z0hBmCfzcbmS838aT8v8Yhkd5HAq/UU8om0s7+dZYxYiDIwk
         vVrw==
X-Gm-Message-State: AOJu0YwOsvrnd+Y7W0tRuP56SGWL2Jt1pDZXArEiB5JAQ1+yRZdTMxhw
	4P9ohe3T63lO3VdhLwY1TikqxWMdExHsjPWOyiOGVoOAbw1Yg2Bk/tTkDBazg/M7pjV2nCU+76U
	2uBv5sosXPAk7YXihfqEIigEH+dudDCusnH50bvvxDTEurUnqdwZ55C4r0x4Z2LGaHg==
X-Received: by 2002:a5d:4086:0:b0:368:7583:54c7 with SMTP id ffacd0b85a97d-374bce97f92mr6805206f8f.8.1725356394862;
        Tue, 03 Sep 2024 02:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHopwsF2Or6X59KptCdtP9shvBUqKfSIOsOAprOTS/L+AM2LQoWh0DPR0/BX78uGFil1dVQkw==
X-Received: by 2002:a5d:4086:0:b0:368:7583:54c7 with SMTP id ffacd0b85a97d-374bce97f92mr6805193f8f.8.1725356394362;
        Tue, 03 Sep 2024 02:39:54 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e33d60sm165511655e9.43.2024.09.03.02.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:39:53 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: remove unneeded file entry in INPUT section
Date: Tue,  3 Sep 2024 11:39:48 +0200
Message-ID: <20240903093948.122957-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit b9401c658d2c ("MAINTAINERS: add gameport.h, serio.h and uinput.h to
INPUT section") adds further header files in ./include/linux/ and
./include/uapi/linux to the INPUT section, but the file
./include/linux/uinput.h does not exist since commit a11bc476b987 ("Input:
uinput - fold header into the driver proper") removed this header file
in 2017.

Fortunately, ./scripts/get_maintainer.pl --self-test=patterns complains
about a broken reference. Remove the file entry referring to the
non-existing header file in the INPUT section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 87108b3fefaa..3b19921eb948 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11195,7 +11195,6 @@ F:	include/linux/input.h
 F:	include/linux/input/
 F:	include/linux/libps2.h
 F:	include/linux/serio.h
-F:	include/linux/uinput.h
 F:	include/uapi/linux/gameport.h
 F:	include/uapi/linux/input-event-codes.h
 F:	include/uapi/linux/input.h
-- 
2.46.0

