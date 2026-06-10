Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228C023507B
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2026 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079921; cv=none; b=iUiBJ4KGd56jyXPXcWGgXhtRcp5oCw48uNW5QaWrxN0e3KwTBiaFiZUdMBsKF+kXjfs+pJMVG13EdnALbsK2A/cMUTpCyU5NKwts9CqucaBJBrsms5w9dccf43TaZkft3eRoZkbYVrr3fEqKtrWk/TkaOIb/2wm4aByEWQrzfak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079921; c=relaxed/simple;
	bh=Q1aLiqvcZDHuzaVTIEpNY+4GR4dMo3MFSw+WfQlB+oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/Dd9qhwvOltbkJNfE2llqwAYu26X+Kl1xTzJAr2ERS78U0F+FRKJt/fyAGgKL5QG668jwXIUPz/vXdZxv0Co4cDVgbcCETH83P/j10PFnm/ZvsXzNPmklRD0pyIcZFNTQDANFo9l8Yp5wVs3P6sUGLp0cuy0ahzp2LX8vLflMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=lB4h/7aA; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="lB4h/7aA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Q1
	aLiqvcZDHuzaVTIEpNY+4GR4dMo3MFSw+WfQlB+oQ=; b=lB4h/7aAdxeGaHaN42
	nOReJgqxkbjPcEMvBD0hQ4SPLeVG/1pG+23wl6GNonZB1YoFC9LDtrRQgcGD/LlL
	QfkqbQwZPo/ZVTzyY++7nxiMmDExE27cUAl6EoULG0jSM6punn0Z+9Cvw0GQq7Jm
	XpEfoS+uAQiZuc0avoj/9VhO0=
Received: from zhang.. (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPSA id M88vCgD3f1xbHylq98LzAQ--.7858S4;
	Wed, 10 Jun 2026 16:25:01 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: kalyanipatra2003@gmail.com
Cc: kernel-janitors@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: Re: Seeking janitor beginner tasks
Date: Wed, 10 Jun 2026 16:24:34 +0800
Message-ID: <20260610082434.4170-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACjYBvhy53AmyEgdcxP33T10a7ag1b8dHdY1JgKWghrgpQSghg@mail.gmail.com>
References: <CACjYBvhy53AmyEgdcxP33T10a7ag1b8dHdY1JgKWghrgpQSghg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3f1xbHylq98LzAQ--.7858S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF1rWF47Aw4UWFy5ury8Xwb_yoWDtrc_u3
	ykt3sFgrW8AFWDAr45GF4YkrZayrWDWry8JryF9ayUX3y7Zws3GFs5Kr9rZwn8Jw4vkFn8
	W3ZrZ34xuw1avjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiOB7DhGopH14nsgAA32

On Fri, 30 Jan 2026 17:29:56 +0530, Kalyani patra wrote:
> Hello,
> I recently started learning Linux kernel development and would like to
> contribute for the first time. I wanted to ask if there are any
> beginner-friendly tasks, janitor issues, or recommended places where
> junior/new contributors can find suitable work. I've been routed to
> tools/testing/selftests by linux-newbie. While I'm looking into it, if
> there are any cleaning tasks that I can take on, I'd be glad to
> contribute to it and learn more progressively.
> I apologize if this question has been asked before.
> Thank you for your time and guidance.
> Best regards,
> Kalyani Patra

Hi Kalyani,

Welcome!

You can start with these simple tasks:
- Fix spelling mistakes in comments.
- Add const to static structures.
- Use ARRAY_SIZE() instead of hardcoded numbers.

You can visit https://lore.kernel.org/kernel-janitors/ to see how others do it.

Use scripts/checkpatch.pl on your changes.
Before sending a patch, make sure your changes compile successfully.

Regards,
Ziran Zhang

