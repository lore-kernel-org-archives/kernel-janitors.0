Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75F8361DBF
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 08:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932120; cv=none; b=h1lrOIJHzyalbCRicpceSq/COeqkASGjbX/dyuzdJ8rR7h4MdT2xMPksZ7F0pIu4GuLmt7863oJYu12kpBBMckKvCAMxqMTUax9RCRQ0PJBh4BhibNE7HGIUn6824kQVgkG+5OS/2sNSwirFiudUxhVdNqvDdrvCO6Y6pDdgwug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932120; c=relaxed/simple;
	bh=RU8UHEcMDQ31+XMhZweZWyi85Cawfhiz9/q0WEBa9iE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UnzjWN2zWsxpPE8+WfojditXu73Xr7XfJ5H2cXFnfz/UBJhiDq4xWiQcrR/lOhGyNjSjzdontzae3DDryu2I48BlOepPdQ1LyxnwCb4YAfPqBU3VlkgpsljmFTMP02OLyZifNckoXjYjgEsxaq8STiF/LqoYC/RjBUR85YiznB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtRJAaRx; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtRJAaRx"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6720c7968e4so739939a12.0
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 01:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776932116; x=1777536916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3K8BbI4kqqDT2uTdEJ7DYsFUVLuW/rEWVHIXnjPkzVU=;
        b=AtRJAaRxP5GUSRZL7x4rYPBmpZ4LVTujsa6iNyCs2glVi/XWlns8XWDHfhsqRQNTyN
         YXfQcxQEOuGyWacuic6IG8E8+ujwMsyxugIyBFF+y8xIo+OuK2ssDtiMD6WYwXV5w0DE
         92uODZgKxAjFDwMm9Dl+8bSuONcjO1hTe6d7cvSslAz6IVtKtgN896Olal+y8fbqWlUE
         jxZYZOrqccIrbSQ8slWZdR1BVmFIcT6BHKyRAXQZ2kYIQg6NysKKHVkBTkyKIS+7eXMy
         n0aOirw4RYK7y2pn/x7cw5DVmB6/g7bHGamyqD/fYfRqIwMgUpmROe4jWEGARH6NXfvC
         J7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776932116; x=1777536916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K8BbI4kqqDT2uTdEJ7DYsFUVLuW/rEWVHIXnjPkzVU=;
        b=FdU4IC6OPMdFgAziVm6nBp4ibsvVOxIbYwn8IKfnJ6w6ABxfg82hX5o8DcSQhJCAa7
         QBtMps4T/gLk9HF8NGVICLUQAyyIELbbCxEAP31/cvmR99fcT93K4Fhvpuoe4oLlTokv
         1Ho3bOyEcK6AoSDuMyyRq5uu/m+w29Ikgs1ceZXZkKlXB7UgBIK3uT/PNRoCkJ1hWUrm
         aTdoTMzxZmOdJw7W+wd8h/ZjSbSY+C7AJqQLUR1mdN9XFA0pxG1SoXq5nhbimIqqvIHi
         Ul9O3KxOiv2V3nyHHKrQMuwybQR1l4dmXF2+/meTLwsRZK0sDrW6GdufeLVAfOiac/9k
         ZCGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3mgp2yJq2RHXoVbQ6zfN/oCQwJbMsgO+sKQYU/I0Dg18h/XF9tRTXTXzJ0eoIeDaGSpNq/DCtBVQJaI67eYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBsbi25oZsSJqYBnfxQZzpWZZJvpwtUhxr+tonm5uHcmLyjCRh
	aOoU0imPQsDkilBB3Bwf8jY0nxI1Gy25B3U0iUd7AWMmuRwAw7lJ0xdu
X-Gm-Gg: AeBDiev/4ZquT8/WARD0zaVbjuveFcd70/+AvPl3e9VhmOa0qaD1KD2euHv9J2q4enL
	yMGPZOy6GB66ddG1pUZ3fR6qYzdHoUgr/lU69lkc89c5894XO02yYMmAbvP9Bfp+EnweQdYDkuW
	fw0+WC7ybXeqngPJpURIxpC64V5WdbiZ86erLnUBCMd+dfvkamMCYRpklg7sdRkOl/y/Z4nIW8s
	BzhoBWQ2r8sv24QB6wSP7EhAVH+zi5AD9YkF8/g4Lcu1ehMb4Pcaq3ow1o03c3mrwr8po72AwfH
	jN22UQL2y0oXX75tF/chlYzMMlYfNyfKmdiLGC9H0b95Kf5vYk9xrFx6VTVdWKf3Q+0J4etmIq1
	9PXZDvMDl3hYvvZoXUJhju5+8NdOG+8ludKDomiA3wONdd2xJZVcGrw8c1DR+REmnNS9mSPDbsW
	pJBN7cCjIFKL3JRVI6eHKDiHez0cxnwU/dw0hsMviD6prCcFawKkLyTjT/dP6N3OND0CtVPVXW4
	bBsStyXVfFnAiyb3GhhpP2Jx/YQGPax/kGH2g==
X-Received: by 2002:a05:6402:440b:b0:677:1cce:54af with SMTP id 4fb4d7f45d1cf-6771cce5812mr2125371a12.13.1776932116061;
        Thu, 23 Apr 2026 01:15:16 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6744dcdf29fsm3332962a12.30.2026.04.23.01.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 01:15:15 -0700 (PDT)
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: [PATCH] scsi: isci: remove unused macro scu_get_command_request_logical_port
Date: Thu, 23 Apr 2026 10:13:43 +0200
Message-ID: <20260423081343.1813002-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro scu_get_command_request_logical_port() has never been used
since it was introduced.

Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
---
 drivers/scsi/isci/scu_task_context.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/isci/scu_task_context.h b/drivers/scsi/isci/scu_task_context.h
index 9cb4f5e30b86..40306c054117 100644
--- a/drivers/scsi/isci/scu_task_context.h
+++ b/drivers/scsi/isci/scu_task_context.h
@@ -211,8 +211,6 @@ typedef enum {
 
 #define SCU_CONTEXT_COMMAND_LOGICAL_PORT_SHIFT           12
 #define SCU_CONTEXT_COMMAND_LOGICAL_PORT_MASK            0x00007000
-#define scu_get_command_request_logical_port(x)	\
-	((x) & SCU_CONTEXT_COMMAND_LOGICAL_PORT_MASK)
 
 
 #define MAKE_SCU_CONTEXT_COMMAND_TYPE(type) \
-- 
2.53.0

