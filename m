Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989AD231CA4
	for <kernel-janitors@vger.kernel.org>; Fri,  4 Oct 2024 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728075767; cv=none; b=l9Jvj+sUI/90UIZ0jpShEZs3wINWjrF+a6/IzrlW7owmuVaeSQlq4W/cnew31OaoaTTdDk11PCpuUOKOwuGD0R+gt/3Il+AIiRrHoVeUsiRfWugEnUMAyxkt3QOQ3FrXqz0BjsP4zrLoOg/wxsHiv2Ed5WAwb3tMb0M/9wkWo7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728075767; c=relaxed/simple;
	bh=Z0fJUiXSWKF0/oClww5nKjc/i6T4KrfOP1RoDUDQPuw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T+ytqOgJKDolzi/qGYCmRYhyAe1eoTSvc+eE/zFamnQFm/RZOKqeDKcKZbj2vKwIsQVmRZB9QjQR5kDo+4gflvIKfJo9wwvXoZyjokFvbvZQuNG7K1XsvN5sgvkCo4FEVG0a33KeGuYqCqKwIzEvuvusp+IFdW+58RA7u4X1Wxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=z1EAhie9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="z1EAhie9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b01da232aso21186915ad.1
        for <kernel-janitors@vger.kernel.org>; Fri, 04 Oct 2024 14:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728075765; x=1728680565; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0fJUiXSWKF0/oClww5nKjc/i6T4KrfOP1RoDUDQPuw=;
        b=z1EAhie9MGLkjxXXM7AhbkKvyCIRHeO/QJwco3IMNMyAjnzVcJ42lr2A8HWHhqJCIA
         L0bXETTLb6eYku5IFpN1vecJX+TrQEComrj+OR8Pdxg6gdXmnJxZyITQJvFKDcX8z+++
         hMhzhec2/UcuLbtWurrtCX4+/o8C1BrKpMQcYiQ3vZoRd7wS6JCP+stuQx7DWttaC7lh
         Tfhv7EjE7bQTZ5r3OMrpGQNnFyNMdUeU8ZPpUy+qQ13agq5i4VDE70bkQ85gMiJpCaRq
         4MGaRm5pji561LcCwiYbY9HbEwto+h4veBWOeZsqrN0gPvr67QuMC+DBIBUMTctPrfFE
         no8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728075765; x=1728680565;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0fJUiXSWKF0/oClww5nKjc/i6T4KrfOP1RoDUDQPuw=;
        b=vD+EG974kxcefCLBPgXYTgnU6Vsmn6NEcSXr8hGQyuaDzHGYYc9eNqt7fF/xK1IyDK
         apDIgW4bh6j3SWxmKQIvfQBCAQ4kE9lHzpjPwP7aEYhPTTLjWUf37BZRQlB+j9HTFJYd
         JWYX5ddMUEUC/oY0SLDayiAnOsiQYAdr+nRw+HLTK3iH/U9cM1mryMrDAEuzBdQaeG5+
         w6eLiZmDAfWGDoBUBLNuvrnHpMhY9QWu+wx68x0V3vk9wcIGdPI0pXYiKkcnxFJKFgkn
         LcOtC2eueGD83uGdvlrYaLpQCVmF64agaV8FzkFzy/rwDbloFFvwqly2Lleao4z1l5u4
         VqOQ==
X-Gm-Message-State: AOJu0Yzl7N2nm72V489tgNPWaybqcHGoolYaX/muf38tCFfocLa1ENDW
	XR3f3g9yfR3DSyINFePVWO5xcYvRH0n3lJ6JraapI2t8Vyokc1Tm7CRmJlRC6Ew=
X-Google-Smtp-Source: AGHT+IFDNzDiJhD0c97txDHvcsLQ1YdPdzVbr7H3zXAo1awU2N/Zgy5I/d7MVIKR+rnQSS0tJO808A==
X-Received: by 2002:a17:903:230b:b0:207:1845:bc48 with SMTP id d9443c01a7336-20bff589deemr57720895ad.30.1728075765165;
        Fri, 04 Oct 2024 14:02:45 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13930b92sm2677745ad.128.2024.10.04.14.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:02:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Julia Lawall <Julia.Lawall@inria.fr>, Paul Walmsley <paul@pwsan.com>
Cc: kernel-janitors@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/35] ARM: OMAP2/3: PRM: Reorganize kerneldoc parameter
 names
In-Reply-To: <20240930112121.95324-2-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
 <20240930112121.95324-2-Julia.Lawall@inria.fr>
Date: Fri, 04 Oct 2024 14:02:44 -0700
Message-ID: <7h7cank2dn.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Julia Lawall <Julia.Lawall@inria.fr> writes:

> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
>
> Problems identified using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
