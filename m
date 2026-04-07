Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FF338642D
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Apr 2026 06:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775544232; cv=none; b=hdic+SvBp7qlrgRhsRXMYIvWiBqMWbmTU8Ya/1IQ6ltJP1hPDKbvjfrhIK9TUSJIwYptbyZyuULJ3wtnKasIMFyilhc1g0QptNaZod0hhHN9rWnN48EGXCE/0RWBBvR9TZpRFMK6EvPtPphVAXeLdOtrfP4Kf0kyKp0jchWn7aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775544232; c=relaxed/simple;
	bh=aFb1INi/NUNadwFavlaxDB5+UNJh/ScJxVg4b+I3juQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7AN+V6MFkoicFl7Ob71CZMHqDOIPontMdOv/0cv73nML0RRjIV/fXTBPQY1pa/vKd+dEFmqDlHcpcZm/f+wytUfr2MB7FVh1O4C0UNCML2dK+BErGaDBGLJ7xWXA4tIyr2C41u/+lBgbfbBqAblqnunufwAFGKT7qUeQ6sNlkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4aHZLc5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4aHZLc5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso22958735e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Apr 2026 23:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775544230; x=1776149030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZGa67ZFGELe5bUP+eZlyvbCuIknlSmdEyMWxXen444=;
        b=T4aHZLc5Gh1yzq1Hm4a3SF7o1PTKXtDWEvb8vJYIlGQXPH4BOyGTuJug873oM+t7Fk
         3ICFGg0Mk/B3gcmQNL1w/S7tTn6qLOKKboahDXsdqPJi04DZCFxXom0Gx3t9+VXpqJbw
         8/AOlfaJWK2IZgOfUanrhEqcKDRZTIPftq8zOpYeOsvquoxEJxKA/lAu2B8gvv0NADzu
         axa7Szxee4ymfYS52X+ldWW/4nLgP8AGXNsJtK4ummqVXYIc84rN7ZuVhyGfgIrIcf2l
         wCR6Q0pBPdplK8sDx5juu3x3Xh29ngL8xfsm5WkxE1oh1Ms2VzIe7362RSA8zKv6aDpH
         n/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775544230; x=1776149030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZGa67ZFGELe5bUP+eZlyvbCuIknlSmdEyMWxXen444=;
        b=A+wyQxnWONvWp5AsP5aKrwaTIUm/p5e12GjDACWUfZnrhjn3Jw+JWsH2NfOrG2SGYK
         qd/Ymzc0AIe/PvVbBT0v3didfhnLmD/AdkQYdYb6EhrDpnaA59DbAG1LT0KpI56pS3Yi
         4o3NZy1hX8OSqoeuc8kmYuFo3p1qKxxYEqhKXsexs/WMXlnrMRXTDURTqeJVCdTXLElr
         5Yp5zH9kNNBIgOdwsKzFEV8/fn/RR5ked42tYXo9CZY+lVP9ztddDQzIhMyDRzT761pV
         Dc6VFg9+YpopinuF1c5I9pEguc6jvmAqSqEgJLcFmvjpoyj52/UW6rfRW2NIy9bbVj6M
         xJmw==
X-Forwarded-Encrypted: i=1; AJvYcCVtrYRXjF7x9dyqr7mnRrRIJ+e9nLph20IVCl0ojtOCx9NJDm0TODYZiS0BcdIdUEv+Zgt2oMs/hgFztvNvFpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG5WEpk35Ds/mJqARiJQBAftmVJMHb1tQoJ+w4WJJuHBq2PGQS
	SM2czCawIHkyZqqqTpP2eg6hHJWRePuoaZsrZPs9cG0fWUKeywDQpIRg
X-Gm-Gg: AeBDieuGH7iFNpfrAwNBuLkmJALp2X+tNtdijp0qY2fMlO4vWufQxB5atgGBiBiER0f
	2PzqFxI5gdWfDu9n50ggiG43E8VNodQxKrfgKd7tr5Td0lareFTLMNwXTey724Xn5yWluS/59eu
	mRCsYgirEH+/zIqgOWJ8uwiyS2v79C4+uIXOyNgb8IoREz3cRw6yt2ZMXwtpep/K7vm164aYzB6
	VjAI4LU1p58Sh3PSxzgVKeUyJp4E2Cq2FFgGK4PMLyTMOkW6Kpw1+AUDv9WnhlDQ4BrP8ag4Qzs
	C4rSwIbaPUlgDeVQWFINuKbJ6VR0y43vLJ5oDivXvGfDF29f0GGAc304rSgaetq2sDi2VzneXCO
	NtGZ77v5a5V5sGbBDJKMkxkeBafAn0GCSHIE3RXPUEnlOLu1wepNldrCeyJlgHEAsxL463qeatT
	OqbakQReIaRMUePmkazMw=
X-Received: by 2002:a05:600c:4512:b0:488:9324:3ab8 with SMTP id 5b1f17b1804b1-4889977604emr216797945e9.18.1775544229793;
        Mon, 06 Apr 2026 23:43:49 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488be58c982sm10502235e9.31.2026.04.06.23.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 23:43:49 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: viro@zeniv.linux.org.uk
Cc: brauner@kernel.org,
	ddiss@suse.de,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	kernel-janitors@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	rdunlap@infradead.org,
	safinaskar@gmail.com
Subject: Re: [PATCH] vfs: init/main.c: change comment: opening /dev/console may fail
Date: Tue,  7 Apr 2026 09:43:09 +0300
Message-ID: <20260407064309.3223598-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406095452.GY3836593@ZenIV>
References: <20260406095452.GY3836593@ZenIV>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Al Viro <viro@zeniv.linux.org.uk>:
> ITYM "so if you supply your own internal initramfs, make sure /dev/console is there"

I want to write browser extension for expanding your acronyms like "ITYM".

Okay, I will fix in the next version.

-- 
Askar Safin
