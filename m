Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1DC32F765;
	Sun, 11 Jan 2026 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768123654; cv=none; b=Bb6S3pQqaEmZMhnWEWsQjI+fpSKblbSylxhu3MTmqhCZwGXoM9nlB0LSAAKsBD4HM7do4H4gD4yZfjVcCrBwpGZ5q1+xh03Hz8f4ajJBlm9xqh08YrTrYNIDQ9Lt7VJ4ANeNKqaezaN+B9KCgPuxAHa6iRVIchQtfnF5wCT0b9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768123654; c=relaxed/simple;
	bh=vIrE1+A+FPDNQBGEUjZE35/lCfy90jGWmqj2zmLSIqk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=lqoUUcJxMdKCDm+YN9P3hV2CXDWU561BgopkeK7cZI8CnRabERSG00M1++FD7YRKI332A+jwhTuexubbaGMN2v7RVi+NUHnCrf5xDcWnG8nL9m+MocclJqiTAbLt+pNUxr+uggwqVl7x6JBwW9vyudG21kTY3TU8iDeRFFL6TWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=m4OYLsoh; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="m4OYLsoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768123631; x=1768728431; i=markus.elfring@web.de;
	bh=ua6mkBTD9VzeFLBddkmuACWgl30r5BjoUe1tbJ8WuLU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=m4OYLsohL3z7bMG2XA0boYpaWz+0uMWkMseplC2qyRlJK2v6o05dVxR/+qDTDK0d
	 kYdcN6PeL2G50ImzaV/IpAv37Dbr58mmfU+s5iYBQUlMPeI+8pwCwgito1mFLZ/Lf
	 s7oi6q2WMa4N+duchV+VMSh74ZR7JVCsNzSXZSJ75YgPLpKAqjDW4KfjRZw4yBqvn
	 JTWkCf0QP3FxzI5a8Kb4CqOiKGC4K4iMwcfTiLKM0Jsob2TnrVsMEVWRh8+tXwK/u
	 Qcmq6kZopg0WJkBueSShMa1zyfC9RugYgQaJ7S3PQ4WVxMJ10kfj/pbFMivmpislB
	 j2HBSYyET0VF1cyaNg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.218]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N3Xnj-1vmsPs2Y5r-011KlL; Sun, 11
 Jan 2026 10:27:11 +0100
Message-ID: <732ad24d-d88f-47dc-bb6f-bd1b64ad354e@web.de>
Date: Sun, 11 Jan 2026 10:27:08 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 linux-sound@vger.kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vinod Koul <vkoul@kernel.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 lkp@intel.com, Dan Carpenter <error27@gmail.com>
References: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] soundwire: bus: fix off-by-one when allocating slave IDs
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zb/Rc17V38PCM3nS7bb74DIdxBSLiFAz6T7LCWdnX7GZ2JZ9M27
 VHQu1Gc9OC+y+dmBbJ+xyKv6Hh3XwBQuvtLKQAgaGMaW3+4hYfvSR6PLv0ZTH3k267ShpJn
 q5K9x6yzYHeGFFyWaoX1WAs3YSEzV6VBxrylVP650ekKtGSszomMRqHnbv5T+LMWwcjglO+
 5J9qhUdr7zt8b0bpy2m2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NsUJ01EcPEI=;kaGugCEtD6Gu/cSGfg3L2CV3Btd
 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

=E2=80=A6
> Using SDW_FW_MAX_DEVICES(16) therefore allows an ID of 16 to be
> allocated, but the IRQ domain created for the bus is sized for IDs
> 0-15.  If 16 is returned, irq_create_mapping() fails and the driver
> ends up with an invalid IRQ mapping.
=E2=80=A6

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc4#n659

Regards,
Markus
