Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A622B14C5B5
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Sep 2024 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609215; cv=none; b=PVFQq7PFsWVsJ2jHeVBodZl+AwdBvntn+kvNWmNxtT/mA0NiJLql/iAT6LRKWK+xC96an3C1vh+PB3H4dWpGppc7Fzw0zQ8ZI0EwFESmz1+IEu+3+zeAPyr9tGZ1pwuD21Ioth2ZwW7RVoFPX0zwydB+k5HkE52GeFpkQntAZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609215; c=relaxed/simple;
	bh=pDoHJPiqr2uHxsG5WH6Q4c/4CQBkbqkQjiVwGn4FLVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f1VwpHpPfI0wlC6OsTuY2PzBFdvbyIXzAl1Sn+oO23z7xYEeI7bcu1eOPqv1y+IcT4oRO5peqnupsmETHq+TSubpLU3hgV42HGzl2dbCw3IzoF2vDvBbl4mW2B/Y+0NEYsA86Pj+/Yx6HifYyY5abc9EEdMD5AzC3jlYSeAhTxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DdydkiUT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DdydkiUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725609211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FLWAMf4F16Cm/iVBIMV8eWypdRb0d5qIVCKf1JBr3N4=;
	b=DdydkiUT7MHnTt1HbSyQQrzkGjoDHEubRtSqmIF0qUfkdNpS/g3cSaNWVcQOBETug9zX/w
	2oFcdQmkB8mK4YUVhH8+nKPydE9NgO1q9FmPuzn1eAk3uHuEU8DuvEXqREMeXmnFce95MP
	cmAtzgBzxQ+KpR3Cg/ozPaFcZ1L7BUM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-a4kX6PO1MkObox8hdhz-5A-1; Fri, 06 Sep 2024 03:53:28 -0400
X-MC-Unique: a4kX6PO1MkObox8hdhz-5A-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a86931aa0efso152127966b.3
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Sep 2024 00:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725609207; x=1726214007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLWAMf4F16Cm/iVBIMV8eWypdRb0d5qIVCKf1JBr3N4=;
        b=MBPFuYNgLfmVuSTqlN416YQUo3NQbRmPFdt1xYloLlVL4RRcmkx+CvXvKXbmemE1B9
         1AjrCMecQhOiFzcnXIHRuI6TRexx5NJJp9Fm0I1LbB2DtfXEYf54zsPn6KFn5zY14Skw
         jKml43zx45bsWyCXiSsxPfqRx3vXBmh5wr9OmTh6drBKzsdml/pMDb6QxlBhrwrjd8lN
         E+r+g2evHXHnUU1yx113j3ppYDx5WYFASJ2f37Q7t27h8PQmpdQA/TYPgwWvzcBz+o1b
         55QlkLVYIQ5Wj/pvvrF+0QBgoFQc14Db73cwrg8FS3DlM9wJ5bfSq9KBVXlF0TjzWREg
         O6qA==
X-Gm-Message-State: AOJu0Yw7KHGHAainNuy/8AGPz5Uav3T0JMY0uVTBbWNCNPVolCipccXU
	qF4FToHo/ugslUaWBZN6LbkUPxdQUQ3pltFVuh/YWdg+ER3TDjwjGRpZc36UunphGV5Cn8WQ0sW
	Vlb6/X6s+HkQTN/YvobD4xEQChl9G9bSrtfdMpzzp6MyhziNImmyUFC0iQyX/kjZOmQ==
X-Received: by 2002:a17:907:96a1:b0:a86:a7ef:5c9e with SMTP id a640c23a62f3a-a8a888d048fmr94571966b.59.1725609207046;
        Fri, 06 Sep 2024 00:53:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC4LXTl7rqt8bWyFmvt87c820Tjb3KUs14y5WiuLk422+QPG/y6q18RItWc+sk62ze6W26+A==
X-Received: by 2002:a17:907:96a1:b0:a86:a7ef:5c9e with SMTP id a640c23a62f3a-a8a888d048fmr94569666b.59.1725609206522;
        Fri, 06 Sep 2024 00:53:26 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a8a141a46sm61126166b.22.2024.09.06.00.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 00:53:25 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in U-BOOT ENVIRONMENT VARIABLES
Date: Fri,  6 Sep 2024 09:53:15 +0200
Message-ID: <20240906075321.51507-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 2fcea44e1ba1 ("dt-bindings: nvmem: convert U-Boot env to a layout")
moves u-boot,env.yaml, but does not adjust the file entry in the U-BOOT
ENVIRONMENT VARIABLES section referring to this file. Hence,
./scripts/get_maintainer.pl --self-test=patterns complains about a broken
reference.

Adjust the file entry after the device-tree binding has been moved.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c28f04234ad1..b4ed239518ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23563,7 +23563,7 @@ F:	drivers/media/pci/tw686x/
 U-BOOT ENVIRONMENT VARIABLES
 M:	Rafał Miłecki <rafal@milecki.pl>
 S:	Maintained
-F:	Documentation/devicetree/bindings/nvmem/u-boot,env.yaml
+F:	Documentation/devicetree/bindings/nvmem/layouts/u-boot,env.yaml
 F:	drivers/nvmem/u-boot-env.c
 
 UACCE ACCELERATOR FRAMEWORK
-- 
2.46.0

