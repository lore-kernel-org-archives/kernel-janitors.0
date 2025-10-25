Received: from smtp.smtpout.orange.fr (smtp-75.smtpout.orange.fr [80.12.242.75])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634EC261B70
	for <kernel-janitors@vger.kernel.org>; Sat, 25 Oct 2025 11:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761391069; cv=none; b=BnfwoO0+goCNOwUKnLBLY40TXrByzOm83wHhGun/4//NnOM94ns+VzMBBOIzYIFivt61mXVTt3JX/4kQxRZBlvX9Cwq955dOq/4u31O+mWV8VtD6Mh1x0H3REqfYpv4jhfTQLNQAS7xrh/LQIgIRn06FTgGq7mKpRYt9OtzQX5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761391069; c=relaxed/simple;
	bh=Lq2wWKt0qZqtk96S6i0E28snka6m7DlsRQdcmzY33vM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dNGXHs4VbfxzEQub4eRdv8Sh4e4fSFPN38d4U2x7Rj59FuoS14YOQ4JXDF4HTQ4vecPt7QpAdnpDi65rVl7E/5YyyDLUzGW0SvM4Tahlf0DVwDo8VqnTvC96z168/4WsmQeoGznfgudyOCkRGM8lbjjLqGneKeEqovM7gQbNZ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=fnVhg5fV; arc=none smtp.client-ip=80.12.242.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="fnVhg5fV"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id CcHGvE38qB8skCcHGvnEQC; Sat, 25 Oct 2025 13:17:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1761391063;
	bh=X7rEnnozJtAWUkQG2ZxrQbrzsJGLonDAIDW0QNmRp68=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fnVhg5fVlQYXsaZ1pkYCrOgnN5sDsjMQrdqaI4bSBDIiUTPx5S9Lc4ugkiGdE4v73
	 zKmzRUaJIREga6u/X1X6VQSJFAMb1CY53Afd/bDl3OMnGvVwqcVyxkKPak4irGCM5D
	 UnMXATaH6C8NnbnrsFQjrV1Bb85MRzqZnla3tAJeotydNy2i5bWvJkP5BH/14vYhXf
	 z1ef9o6k0ST8sUBLZRlCi6zzDxio6fezk9Y9yMU9ZQIsrh3+1hD512j+sRTAjK6G7y
	 Y/Ga0q0GYs7d5j947DYYTCGp3tan4wHrvlmJ4PtQ3tsLX+fmJ6aFmq+etrudF9vF3e
	 trTKt5WjdC4zw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 25 Oct 2025 13:17:43 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: a.hindborg@kernel.org,
	leitao@debian.org
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/2] configfs: Constify some fileds in struct config_item_type
Date: Sat, 25 Oct 2025 13:15:36 +0200
Message-ID: <cover.1761390472.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These 2 patches constify ct_item_ops and ct_group_ops in struct
config_item_type.

When/if they are applied, I'll send some patchess in each subsystem to
constify the corresponding structures.

This 2 steps approach is IMHO easier way to make these changes.
This avoids long series and cover-letter/first patches sent to many
maintainers and lists.

However, if you prefer things to be done in the same serie, I can do
that as well.

Christophe JAILLET (2):
  configfs: Constify ct_group_ops in struct config_item_type
  configfs: Constify ct_item_ops in struct config_item_type

 fs/configfs/dir.c        | 2 +-
 fs/configfs/file.c       | 2 +-
 include/linux/configfs.h | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.51.0

