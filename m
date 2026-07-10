Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB935C190;
	Fri, 10 Jul 2026 03:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783653729; cv=none; b=ah1g/9PmAnk2W/OcWzctY7W3/XSUanSqua0lyAScsVqletNAcbTnETVdEMeO32QjuTJxK0T1c2ndBGmGlJ9lKfbs9c/HAIuFgP79jNUnhDg5VuEVGCk5BWuESpavRTbISkAd+873k17+4HMW5gaA6UVvGA0Pp7FTpNKkN7gASyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783653729; c=relaxed/simple;
	bh=tKh1qCrzgWfnCFnHN3fqXGUnrCmIJKVA0QAhomlV2FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERricG/CYJkCBuNCC0ZPv86j6vOK48avuPvBFW3um50AhZ6DVmLcPFkQlEIArROi6wtlNwMmHYW42/8pbf70aeHOBKvrXvMYXsc4HUrxN6i4tJGG/JZ4VsSob/YrVxOFcuZvooOijXhaVdMVh1ASIevtXIAMvsm9EYZ8GKEPwzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=OJh4r+Pk; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="OJh4r+Pk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Fp
	hOzGelo2OndP6ZM7q3Uq/HNkmuVo2X9VqpYUpkCNk=; b=OJh4r+PkNWKUAC8wav
	pA2FuehKgGylRyyVtVnMD8qyAxs4VM6WC8h+schYms/gSmpx/jxIwyEzkaOeXTFc
	ghtxARe0zK8bGdWEFylYpP3IugNvSDKX9r3JU4BF40HazDeykpaIBznc5uPZl4Ar
	1yoE6D96HPfCOqtREPE4sUZnk=
Received: from zhang.. (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPSA id M88vCgD3ZzHoZFBq6TIQBA--.49746S4;
	Fri, 10 Jul 2026 11:20:10 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	David Howells <dhowells@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: [Question] list_add() naming: why not list_add_head()?
Date: Fri, 10 Jul 2026 11:19:58 +0800
Message-ID: <20260710031958.6845-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3ZzHoZFBq6TIQBA--.49746S4
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiIAoCwmpQZOoLYwAA32

I noticed list_add() inserts at the head->next, 
but the name doesn't reflect that. 
Why wasn't it called list_add_head()? Is there 
any historical or design reason?

Thanks for your time.

Regards,
Ziran Zhang

