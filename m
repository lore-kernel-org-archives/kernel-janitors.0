Received: from smtp.smtpout.orange.fr (smtp-72.smtpout.orange.fr [80.12.242.72])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB4E2356BA
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Jul 2025 08:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752481078; cv=none; b=kkixNzrYZbjpOUzrq1kEBgatMzwTCyF1RLmoBnOdSWopAbJCbaidfGcL4WJ6lfv+E02Zo2bpdg4Bs+A0Ot+2he1sMkxvG0LEDWT7EA1DKUC+UU1xwGJcWP6elW85HI8ba0phiwlTEu7Q3TTO/9N5LuJC+U4piqnvXjlAwIDn7po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752481078; c=relaxed/simple;
	bh=6eKbJRC0egYYk0hIoQ1KegYpV6rakAhDZIFaxng8+HM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HweVzf5ha+cnjT/8vCuvAgsEYhot6i6Qp6x3yBqEkbGToS3ZAEL2Cect/nT1u1g40pT+Jaal4SvqxN1SkthTEBxiHFaouocmBrlgvrioMU4YULdalFgVTLCe0DrHwMmyJrHyfBtZptd5yo4iR5BaXfb9b8fp+v6B30QHbVv5tBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Aaa8ezBu; arc=none smtp.client-ip=80.12.242.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Aaa8ezBu"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id bENfuHN2LILtwbENfuVI5i; Mon, 14 Jul 2025 10:17:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1752481069;
	bh=4wZNbpRPzeGr+80jW4oHXMfPFK+sXJcG4wfEmFBYDPQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Aaa8ezBui2MyM1ToWtYkKEyRZNvJ0DJzCPXkp23ZPYw+jeYcsrQysBN+w6OVu7IK5
	 gRstHYiSu5fcvhR1nV5fiJUsr9934vbmPWXmWuUdS3JhunfVQcxgdwvnlqWjLCkXS5
	 RqUaB69YSNrrlCdpIoNjTKRq5tMRW9FvtOamf8Va57/MX4roAjA/R60c1PRNWHk68y
	 5axep6sQLYfhMKLZCB31E3HRe8VcTYGdTElmo2KoD9oyDU82vUWRg/TFelHOqVT4C4
	 Q/qvlOzq5sYc2kIMbJku1o/bdco8enBZqXoq6YWX0qxyYFS2dFtO1Csh2GpiMzwioo
	 p59BtZ72eK9Kw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 14 Jul 2025 10:17:49 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: willy@infradead.org,
	srini@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v3 0/3] ida: Remove the ida_simple_xxx() API
Date: Mon, 14 Jul 2025 10:17:07 +0200
Message-ID: <cover.1752480043.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the final steps to remove the ida_simple_xxx() API.

This serie was last proposed in August 2024. Since then, some users
of the old API have be re-introduced and then removed.

A first time in drivers/misc/rpmb-core.c, added in commit 1e9046e3a154
("rpmb: add Replay Protected Memory Block (RPMB) subsystem") (2024-08-26)
and removed in commit dfc881abca42 ("rpmb: Remove usage of the
deprecated ida_simple_xx() API") (2024-10-13).

A second time in drivers/gpio/gpio-mpsse.c, added in commit c46a74ff05c0
("gpio: add support for FTDI's MPSSE as GPIO") (2024-10-14) and removed
in commit f57c08492866 (gpio: mpsse: Remove usage of the deprecated
ida_simple_xx() API) (2024-11-22).

Since then, I've not spotted any new usage.

So things being stable now, it's time to end this story once and for good.


Patch 1 updates the test suite. This is the last users of the API.

Patch 2 removes the old API.

Patch 3 is just a minor clean-up that still speak about the old API.

Christophe JAILLET (3):
  idr test suite: Remove usage of the deprecated ida_simple_xx() API
  ida: Remove the ida_simple_xxx() API
  nvmem: Update a comment related to struct nvmem_config

 include/linux/idr.h                 |  8 --------
 include/linux/nvmem-provider.h      |  2 +-
 tools/testing/radix-tree/idr-test.c | 16 +++++++---------
 3 files changed, 8 insertions(+), 18 deletions(-)

-- 
2.50.1

