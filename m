Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EAF2D3728
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Nov 2025 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762156800; cv=none; b=OnXpvq2dLskdV3wfTNb1ZUBr1XgMbyMOF/KvHVhudjzsa2TXoAaEf945vBhHUkIXwb3TDzQCYe5spBNFvM9ppemnQzvi5GeA8Gfstd80NuVBBqA+3BKCYurW9T9xXzYGv1pr0f+FA7yg2y2dz34ZQhUB1BswzZuvdWOGn+clTck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762156800; c=relaxed/simple;
	bh=IszVnDCPm0bboeFG4KrxgTH5HC9Vm0rG9lgMcCpXRTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BqUzAiPGUc1GS6gzVV2QTGOMhU1kK5WtMI9BMSmjLKm0iWanAL233IeP0BqVUrFVWZVqlDUjyi49EdhOOxgoIkY5ZB/ZrhuVMGZcjkU5isFnNZOBW2QrhYbTKsRhAUGsrtC0VF7xFV4KQK3D3owe5yCjCdby7mkZYvWejYpGQn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fOShY7PH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=akdUxWQt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fOShY7PH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="akdUxWQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762156797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8Ng1Pwu6FSvlmYcO+fW7tQgV+r8RIUxL6Vl3k5g+WGE=;
	b=fOShY7PHpJcrvdtzDoyKG5lUGUmoz3Lov2shLvEXn7Udz+m27ylouAf8RuZm8RZ2qAdK3k
	Kg36+npGkhFneaBmF8+0WEK9AMx1B25YfYu54CoWP7jWBIHqkU9VOdAk9Z1CVtapL+Yh6y
	gpofyEF0I2woIi4b0mWnyU2OlMnzeJg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-NZd1c1XTPcS4d69nRy8tcw-1; Mon, 03 Nov 2025 02:59:54 -0500
X-MC-Unique: NZd1c1XTPcS4d69nRy8tcw-1
X-Mimecast-MFC-AGG-ID: NZd1c1XTPcS4d69nRy8tcw_1762156793
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b5fcada9d24so413673666b.1
        for <kernel-janitors@vger.kernel.org>; Sun, 02 Nov 2025 23:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762156793; x=1762761593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Ng1Pwu6FSvlmYcO+fW7tQgV+r8RIUxL6Vl3k5g+WGE=;
        b=akdUxWQtQ48+Orban5nSw0T3s/u6TlngqbAqX4OdHXqpLYuavEWyqZ98GYFr7+Fsyw
         6fcLmUg6MP+/Ak4we/RA5Nqu6moKKdSH/pvCWg/ukdOMPtq6Ktv0/DYHOQjB+csaaoWy
         3qgD3qTHZW5BhjSDIjl7omVNA5iFYXsPsVmw053AWzxAyu2Rj6JcdCkGRPV5A03+b0Fw
         RNhRUY5pJiBZd/c75C+psEDvMsrymh/u2LrcVXSLbGS4rjx8KwhmfNW07qR9ASDW3E3l
         sQ8WH4WvXtEQWPoENJOCJwc40ly/yYHDU/DKZo2jZzPfdHhX5z1iqnov6Gd+57b8FVQp
         kGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762156793; x=1762761593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Ng1Pwu6FSvlmYcO+fW7tQgV+r8RIUxL6Vl3k5g+WGE=;
        b=TyBEiaUvjzkwJCa3pRd5CVLY+SLTEmt4Ht1TNzOyj0FYLhpbFxJGs3xXaQLVmJ4/7y
         QgU/Oemi+k/2JAfIUcYBntHmZydpKjZdBBmNO7sOvPf+GUECCCA8b6c+MhnTcRR7+oCD
         oS5myCjhSUe2INkEn2ppxSRPMaVWqtxgmdgKAxjflFRg3apKYiwz7RQKyn6wHQPrA3pt
         iCiw464f/+mdZvSp3fMnDvtrFyjaRrw5zsgPZ5+Cw4lnxOkn/ONSYgtgYX4ErHilL0y6
         z2KcxIgA5Dh0zIjk2IIYe6Ofns7pGg3mTQ39IOeIcCJd5DYInYeOhCQbqdRQzQ03eIi9
         U1DA==
X-Gm-Message-State: AOJu0YyiW2ol7IB7Efm3a4ue9eEPx9l3/LeyP43fiao+89shOwO/3ePC
	ermyLXGpMHSawtmecf/aU4i3ppszWtes/qjrICzlhya9LKIyTZ3dhMFHIeo0GQXVQCJgmq907ol
	zb3uXVmEAGC4HJhXY6zB/trR7r/NhUivIo1GLH7j67b+I+01Ajq249ABp0MhNzyqUzvdYAg==
X-Gm-Gg: ASbGnctshr8OwGtkiu8andqdgVOC5YCsFlkukaUdBRIFlgkN96Hdm7BJTEsGZf8xwJ+
	jZHQ0O2WmJKf9U60m9yF84jB3WhpErTO4vMMym94yz2cvx3M8gmTRuwjM2k1bXRCNSvLQmwDX63
	Okcu4E/TqJoGPFe0AEHBNinYa2z/e1/qsLYuujPXeTCq/5KmWcbwHJjXchmnyxWQN37ZT2QM5F9
	/H6HrBfYVmjpW0AtZBHIp5ZXpE75V9TE663dJVXHwt/H1Wam9DXuCDsj7RcfZv80hL+wvSAgjA0
	/UiCxaOMasEqhJyjncpGoUyOTI4MBBM1ijo2d/eZb06IpxiMYI2EhD371E/bsp/lJE6KVkuyX9O
	oKVmD4P3WZkR2VsyJSia37QVhHHKKZ1+3JbY2kcREcwQe+PDt
X-Received: by 2002:a17:907:6d1b:b0:b43:3dcf:b6c3 with SMTP id a640c23a62f3a-b707062eca7mr1059167966b.49.1762156792991;
        Sun, 02 Nov 2025 23:59:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEei0TEbbcqaHv2/H5u75E6cBldBAuSc4DG6tLxuw9RodARfK8Z6AgTqtkQDZxiwrECzBHCag==
X-Received: by 2002:a17:907:6d1b:b0:b43:3dcf:b6c3 with SMTP id a640c23a62f3a-b707062eca7mr1059163966b.49.1762156792088;
        Sun, 02 Nov 2025 23:59:52 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm312691066b.8.2025.11.02.23.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 23:59:51 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: extend DOCUMENTATION SCRIPTS to the full directories
Date: Mon,  3 Nov 2025 08:59:48 +0100
Message-ID: <20251103075948.26026-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Due to commit abd61d1ff8f0 ("scripts: sphinx-pre-install: move it to
tools/docs"), checkpatch.pl --self-test=patterns reported a non-matching
file entry in DOCUMENTATION SCRIPTS. Clearly, there are now multiple
documentation scripts, all located in Documentation/sphinx/ and tools/docs/
and Mauro is the maintainer of those.

Update the DOCUMENTATION SCRIPTS section to cover these directories. While
at it, also make the DOCUMENTATION section cover the subdirectories of
tools/docs/.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7031ee1e7cff..c9bdaaecc946 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7442,7 +7442,7 @@ F:	scripts/get_abi.py
 F:	scripts/kernel-doc*
 F:	scripts/lib/abi/*
 F:	scripts/lib/kdoc/*
-F:	tools/docs/*
+F:	tools/docs/
 F:	tools/net/ynl/pyynl/lib/doc_generator.py
 X:	Documentation/ABI/
 X:	Documentation/admin-guide/media/
@@ -7476,9 +7476,9 @@ DOCUMENTATION SCRIPTS
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-doc@vger.kernel.org
 S:	Maintained
-F:	Documentation/sphinx/parse-headers.pl
+F:	Documentation/sphinx/
 F:	scripts/documentation-file-ref-check
-F:	tools/docs/sphinx-pre-install
+F:	tools/docs/
 
 DOCUMENTATION/ITALIAN
 M:	Federico Vaga <federico.vaga@vaga.pv.it>
-- 
2.51.1

