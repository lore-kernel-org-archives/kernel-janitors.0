Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153292D9EF1
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Jun 2025 13:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031903; cv=none; b=DciiTuxR/yBJZAwcrvQzbooAHacrOqi7o4JdDtUi5BkHpa0gXoDZfXMktR0btwZo8RA1CdXqdbpvvMkbux9V5Ul7WS7oAtR5f6O6Q/EZNc8nFJWaS/zzF9S8YwvTaUfEaWhNbcAEFtVO3u5BvOt09BGKw0p9agP1gJALJeWb/cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031903; c=relaxed/simple;
	bh=8bG3o5gRZA5FwgazcAq8PDL3/TF2VFfzR2zlNp78oD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aDvU0aXSvQZ9z4B65XBIClWgsWPl5UvBNYGzR5Poo82pjZvdLjCSPjdCOdzJZaXEo4XUwD/rN674zA7AENQXfgQNBcJLGBH2SnEREUEybkcU+ZUPnliMZLYkhPZwo951TuI5pCZou6zGdKvvhC/ziHuqY/59FiXw+nhGh2g0/4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GwtnV7uD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GwtnV7uD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751031901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sfCzCKZHgavpsXvy8TlJ0gEXh9QhrZFiByLFjuD7+iA=;
	b=GwtnV7uD1KwppUiNHkxloz5KOJbLNR5eX9naqbTzqoIZt1+H+2Ap6Fc/GRWN6bgIUSvopQ
	O4YSGx8ucSUdlC1LDD1DdiODVkYVXHkfN+45KLFwHAWmdiRdb038S3rZrnLN5c6QNuiInh
	fe2xGXwVt0lD0ZAfjXqWmKb5iwHWqdA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-tbmzbwHSO7eZAw8DFJ1ZVQ-1; Fri, 27 Jun 2025 09:44:59 -0400
X-MC-Unique: tbmzbwHSO7eZAw8DFJ1ZVQ-1
X-Mimecast-MFC-AGG-ID: tbmzbwHSO7eZAw8DFJ1ZVQ_1751031898
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so10333175e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Jun 2025 06:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751031897; x=1751636697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfCzCKZHgavpsXvy8TlJ0gEXh9QhrZFiByLFjuD7+iA=;
        b=jWl2F/Sq9StPniZcKa3re+/311i1RdlQozWfrkYwzbJCQ1GJuBSl7Mu42NU4Ch4oiD
         zgF2FFDSzonR7rL57EmN0E1h/WeNLce4xxZCzsT5anolu3DLjAhWhM2XzNKl+drRBJiC
         YLcLg17Hcr1dN4zWmsHmdXyfEqQotuFKxBBMEIBWckrmDqEu5OhmyOZiiGX+odqgdAL4
         Q1SjRKnntmGs0JN1KzvWvlxvOmurmpf7UoH5V7tgr9q+MoMz8/x164M21ZQHytXbimF/
         AyKt2FCmvJJjic+tL76WRU+YVoRTOOskzy94nU+9zFOq/qwbLdABAle+s0NwNGJ/VzX6
         9m0A==
X-Gm-Message-State: AOJu0YyuAzHCJH7DpEcX+3hqUCgfV0D0exElAuhFb+gUXXikDGvf4y/x
	5WyKMyCTIKnNesQsVCN+rEvcHNminiE1M10mOhKMuf/MupelXDieXaaTAacmE4Wuibvtd4u5EEe
	TuefIosboAJRU240wl4U1x3suAXd0ylge5rBzsNyrGPYFmTmKQlITsFOkEONopQPcuXclaQ==
X-Gm-Gg: ASbGncsoHQ63+4G8UfSZ7f4wo2IjOJCgHHXEur/NOLPoavxU1rS9HkPBulPN3p/FCkW
	Q23c0IezNrOLKtJl7QSkynipyvM24BL3xAROAFguQJp4/IQ4Xj4OA3QrfbGVIVbmXWaVjTlfRjq
	57qQcARKMxMspELHSP8jFEfQ4ScczmZt3H/YiGKv6f661bobhVjvU2FeGKBl49E5/eYT7zxDlXp
	MB5Fcd7kMMO1RoiU30/z2Cafsb89Xy7YF1IK6Xx3G9beKXaMGIPkUeg3fHOfaN4+ErSJpKWDoxl
	fJxso1AcLZ55JTBauHuTSGrwxNJXryPTyU5OYvUW2+gd204PuW5qfmzq4Qf/tHUNo51h
X-Received: by 2002:a05:600c:1e0d:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4538edeb1e3mr43906785e9.0.1751031897534;
        Fri, 27 Jun 2025 06:44:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5wO7lBzKmrbrRtSD3MlBN7myKwo/CLhGpeObS/nJo2QfYJbjf/v98tsfeefUPIC/qB8O98A==
X-Received: by 2002:a05:600c:1e0d:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4538edeb1e3mr43906355e9.0.1751031897103;
        Fri, 27 Jun 2025 06:44:57 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233bd14sm83028885e9.2.2025.06.27.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:44:56 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry after renaming rzv2h-gbeth dtb
Date: Fri, 27 Jun 2025 15:44:53 +0200
Message-ID: <20250627134453.51780-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit d53320aeef18 ("dt-bindings: net: Rename
renesas,r9a09g057-gbeth.yaml") renames the net devicetree binding
renesas,r9a09g057-gbeth.yaml to renesas,rzv2h-gbeth.yaml, but misses to
adjust the file entry in the RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER
DRIVER section in MAINTAINERS.

Adjust the file entry after this file renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d635369a4f6c..bff9651a9a94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21271,7 +21271,7 @@ M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 L:	netdev@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
+F:	Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
 
 RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
-- 
2.50.0

