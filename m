Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8876C15E97;
	Mon, 29 Jun 2026 12:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737661; cv=none; b=u6GbCzJb9OHKnxdefFOewXj57eVnS687b7Luylmbp7UNTEzCguFXXZ8T84W/Z6YJLBHrjTiDvsZkRF8pHN7WJxEnyEKUNWLAonJylrYA2hlKerZ/GxnoUp9soRTSKhOMnsQ87b1G8UD1pBZQIxP7xKZ57JSaXqv2kq6px9++YAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737661; c=relaxed/simple;
	bh=4BwVQpcNchUTdbvjDJ55LDhPkgrsLDzCii653vq1oSs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=EGBUaKSLm3XF73+xsh2Im9sqjFXL3YyX7yi7+SbJqP8R60LIEgGSAYcRQQ1A5j3+oi27pW2vxEjXlojsE2/sHHzEvr3vJZUuKD5+QTEQsiZl0nnHQ9883QDs9aWoBzz6k1nSsgnOE1iTYLD1u2uHMH3bzAxyoxk86SMwuMvMJDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=WOlBmuOy; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="WOlBmuOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782737650; x=1783342450; i=markus.elfring@web.de;
	bh=asC142A27m0an9QyhmyjtQDandImCzAu+Zn7m1yt3VM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WOlBmuOy4XY5Yws2A8vOG8OSCRdqouiMczxsvLaIZ4FULz5fhQQZ9lgEzyzWvzII
	 cxmWTnfL5c+E/bKddSqtyn2Y2osX9Rsqg6deBICzA/xmSG/bl2n4NsMQY0VzWSaWx
	 C43lnFriax9udW9524QUfg4HKwMXW2QIoP9rwUyb6FhV865vKbP+iqkTcR8SlUoQ4
	 6maticp5U2zO3Tj9Yr3k+eMe3vF2DkcTcXl1m84oM/8jiEsXodvJQYuPW9tAtO3rd
	 9tz1sM75RbHGGh9BenowLqKSAY+/HmORbCIwKhbBecqg6FRhDQkv8bSYeGMnGTKI/
	 S0I2U7aCmvWQUqlVqQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MC0PR-1wqWMh1auL-0030J2; Mon, 29
 Jun 2026 14:54:10 +0200
Message-ID: <f1adcf3e-1489-4131-ab62-277cab6a29b9@web.de>
Date: Mon, 29 Jun 2026 14:54:08 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tao Liu <ltao@redhat.com>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Baoquan He <bhe@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20260529032739.13264-2-ltao@redhat.com>
Subject: Re: [PATCH] riscv: Fix a NULL pointer reference in
 machine_kexec_prepare
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260529032739.13264-2-ltao@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MblcNkU5EZqPCpQvLieb6roP6tB7TZ1rpYJIepkLi9fWxZghlUc
 JwV70AvW6uwXtZPDECBX4EeUTjwRzAEGYqwAo9N3My/cGju/hif6cmvay8m3a1hnaa5jWLu
 X7FS1GzELmpI0NvnD3+GA3YiHJWx0JtZ7GCu6VwX37mHG6lKu93j0m+BZFwPHRwKg3hsuOt
 YO+Ww2nEeMHMtfvtFERnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VWcjRC/TJCA=;eJiBpiNTr7EfK5tfNMa5P0GbgxA
 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

> A NULL pointer reference issue is noticed in riscv's machine_kexec_prepa=
re,
=E2=80=A6
                 dereference?


=E2=80=A6
> Fix this by simply adding a check before copy.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

See also:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.2-rc1#n145
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.2-rc1#n34


Regards,
Markus
