Received: from mail.fastemail60.com (mail.fastemail60.com [102.222.20.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43D2264F90
	for <kernel-janitors@vger.kernel.org>; Sat, 10 May 2025 18:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=102.222.20.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746901126; cv=none; b=uJ1fGuD1VUTj376Hplqc3Y5Ab/eoZMfRcJdcyohBRv+0KDvFBNRJMHK6SkKKeCDCg19Auv6xUIRiaFyoV1zoi+gzrZutvMCRFS6Rj0kJvvZfUGvf4kX6iitGS9Vx6Bz8fK0S9YgpDfYMS8XSiNgvCCQGfp2moWa07W1kx+uMeCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746901126; c=relaxed/simple;
	bh=0kM12Ki2v7eI61I1WvQrX7nQw+DKE1uiGUA45uahRZc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L1+7LAuhZPspR9FRmug/gG5bvUepep19Fel6rWlu922w4iPYK5j57F1O6O02Jrr2m7WGfPsRbmL5+xWsZuv0d6xP1TM4GJU79L1REhKwmcTyNtR+upJmNFxb3KE3FOyD4byoe8BuMkMi6wAwYwQyRB8Rw4CRe5lta0rhCfJQvh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fastemail60.com; spf=none smtp.mailfrom=fastemail60.com; dkim=pass (2048-bit key) header.d=fastemail60.com header.i=@fastemail60.com header.b=m6UjGMUb; arc=none smtp.client-ip=102.222.20.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fastemail60.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fastemail60.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastemail60.com header.i=@fastemail60.com header.b="m6UjGMUb"
Received: from fastemail60.com (unknown [194.156.79.202])
	by mail.fastemail60.com (Postfix) with ESMTPA id 603928A9F3A
	for <kernel-janitors@vger.kernel.org>; Sat, 10 May 2025 16:31:44 +0200 (SAST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.fastemail60.com 603928A9F3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastemail60.com;
	s=202501; t=1746887506;
	bh=0kM12Ki2v7eI61I1WvQrX7nQw+DKE1uiGUA45uahRZc=;
	h=Reply-To:From:To:Subject:Date:From;
	b=m6UjGMUbfoUncoP1DZPhyxE5D5IKbSxtFWYznEek4xG0tO8kAjkXiXavV0CLVAkzE
	 z5xNOzt8cGEBTa70z4kBGozPVlfVMSY/LyBY4ymxvCx64kiFyplaulh4zMGxuVHYkF
	 nEtlST55leGt1EJEUe3mj80A62ElQ9NCUOqda6+mnIYJYkkrpg6q4k6OKPLQ0vNmFy
	 Yjz2WVy/z2JL+SC3gths/YU8OcGKAs0KZAlYXrt1yGERKu1e0s0IxSN125mQjyS5GV
	 4j626RbD0gDvYfu1NqKDN1qGHFBYxBVt7V0m47JCmRsaZBR4iU/ceBusMr6r5Jvg0p
	 ewWYR/134Wt8w==
Reply-To: import@herragontradegroup.cz
From: Philip Burchett<info@fastemail60.com>
To: kernel-janitors@vger.kernel.org
Subject: Inquiry
Date: 10 May 2025 10:31:43 -0400
Message-ID: <20250510103142.0B0F227F2B906DAE@fastemail60.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (mail.fastemail60.com [0.0.0.0]); Sat, 10 May 2025 16:31:46 +0200 (SAST)

Greetings, Supplier.

Please give us your most recent catalog; we would want to order=20
from you.

I look forward to your feedback.


Philip Burchett
