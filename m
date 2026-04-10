Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB90D3DE434
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834343; cv=none; b=booLgVDrb69W7tlIblcNc+dhmpKpHLuzVSRlTQXmbGXbGBnK2aACamJY+/PWa0V8KN65VfOPpRx168yVDzGaLCARRlzyksKWHpyRTajuevj4l3c4jZSu+GhGdtkSNJMoXpt1U7dT3F/kJoVtB2PNhWvklEWnKtVq24KgNvkxH5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834343; c=relaxed/simple;
	bh=sm1IsFAGDJSoe6HecsBacSB8jiT7TwxHfNWc9i5arD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eEk9uhWRCchRCs+L4DS+GXlSAZi3QstrmljjrZntfP7c/UZHhMpIXY1UkZuys3K6ug4oObjMEitFlaROXamzATvjI/tJNzs0KggcOhq/0ucfaue7dBGTMktZbdcfhFbKrkhsxO5rTg1950HfhRHmebCzorApWmvFr/a5SEMsTSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=H3YujPtX; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="H3YujPtX"
Received: from trampoline.thunk.org (pool-173-48-116-90.bstnma.fios.verizon.net [173.48.116.90])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 63AFImrB015768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 11:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1775834330; bh=ESK6mHVlwwbv1lY7gMsT965eIFiYBs4y8KCi4TMqLIo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=H3YujPtXDgCbFSyNsk+mwD5A6Bo8d2gwNFPoNwcwP3/dKJ+XoKRG3dlQcrFDeGvs8
	 oYB08ud0uZfnexDbzWWB7XSTXeGgiZYlP9jZk5JGJJEn5wypiB6qjHYbDW3RRIGQ+o
	 0EgO701UtlnHot8pVjiW2BljzFOW/A5nwJE48+gyKTJ6ZFnY0z8oUgbgLtv7KRDzEz
	 GFyNyhh4Nqubah1SeRWt3RkHNV0FKbPvbSx/0qKYDTdwV4+Dcd9jAQwKQNT3RmvkZX
	 ZhdmjgyvHrJ0zhIpqM6opAC36UTVwLAh+bkvPjABaHh2W1K9y+yrsgeuKrPiqBuiEN
	 szmYYZld/cdjA==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id EC0B82E00DA; Fri, 10 Apr 2026 11:18:47 -0400 (EDT)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Matthew Wilcox <willy@infradead.org>, Julia Lawall <Julia.Lawall@inria.fr>
Cc: "Theodore Ts'o" <tytso@mit.edu>, kernel-janitors@vger.kernel.org,
        Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ext4/move_extent: use folio_next_pos()
Date: Fri, 10 Apr 2026 11:18:33 -0400
Message-ID: <177583430854.2758959.17302898933703692784.b4-ty@b4>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260222125049.1309075-1-Julia.Lawall@inria.fr>
References: <20260222125049.1309075-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 22 Feb 2026 13:50:49 +0100, Julia Lawall wrote:
> A series of patches such as commit 60a70e61430b ("mm: Use
> folio_next_pos()") replace folio_pos() + folio_size() by
> folio_next_pos().  The former performs x << z + y << z while
> the latter performs (x + y) << z, which is slightly more
> efficient. This case was not taken into account, perhaps
> because the argument is not named folio.
> 
> [...]

Applied, thanks!

[1/1] ext4/move_extent: use folio_next_pos()
      commit: a804ecc399d91a529726fa1b10ff699bb531253d

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
