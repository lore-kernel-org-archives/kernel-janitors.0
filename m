Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E6335BA;
	Wed,  8 Jan 2025 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345105; cv=none; b=U5HobxAfEFx76E6AXW7EtkNR2vt2yJPFlbESmhT7cva/3tZT6Hr3ItaDRIg5uHV+iIS7k0b+y0HJN4n8kN4t7EN2kGB5vts+GujoJ/1iGKVmsPXAxtxEyX2AvWKjlIPU3wZHDs1UBtxEyJ4Z5atL8PgVTUtcbh15GeR7Cbwf1Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345105; c=relaxed/simple;
	bh=RNt3kA1iYSWS6cQWjQ+oP/zXo2lt265DJ+7Okh+67Tg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VGwihYU+ozgXyL5rm2GmgCySQ6aKvC0jueAOKEt2ddt0YV2FdTQ4iZAnKYgBVe0WevgFmovVMfX+yqv576xAmsmUuNXwZq12hvCpVlFl5UrUCf2W//VtcITt1y7mxcJKqynWygJSVru11nek5lRB/+F9XiXBmT+7k9XZF+u50d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FkxB5KBv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z0XvQdeB; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FkxB5KBv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z0XvQdeB"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id D3BF611400E3;
	Wed,  8 Jan 2025 09:05:01 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 08 Jan 2025 09:05:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736345101;
	 x=1736431501; bh=RNt3kA1iYSWS6cQWjQ+oP/zXo2lt265DJ+7Okh+67Tg=; b=
	FkxB5KBvD7AadJuEO5g0uesrL2eacp/eDdL4x+Ts5YLlSqolkPCWCLvfadlFvQg4
	K7dL1hL+YLJMUb38AaQbLpdLDPfcC9MtP04OfZPxyCgck1OHUE1J+OwGqB70XRY3
	syf5Q8/5ztAkkDuLA2qGVWLCsIXC2r/S1mTwn45qwt9MWyoAfbTz1TMHAvy5SjMi
	Hh9PyvIQeg4h04Zp0K0HSuVRxJfI1BNCS3II9VO9qG2JFuiMt7pteoNZY2u1Fu4M
	YQWXF7/OH8106lSClcaheDv4oVEgOaqijBh1Ta7mkkJJAQxzfWiLEx5nWj0ouh1Q
	wSJ2dIxG6CObT3JuXeCulQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736345101; x=
	1736431501; bh=RNt3kA1iYSWS6cQWjQ+oP/zXo2lt265DJ+7Okh+67Tg=; b=Z
	0XvQdeBc+PrgUlyrQXUyNcFzoqOSMvj4d3Q4fOLqGvfHsTbmbyYy94RY+VgO9qx1
	evE+dU3tovCF3vGzhodZQF4gookjVwvxlHdZ0Mo80yewfNJXGAnwuMtjNFqSXs+Y
	OOAOSWnYTH/xu0Zel8d5KACCATjR0gjs0kXKOpn5vgAIatUHyybP/FdxQjugG8sh
	Fe6rhoWQnOrLRKUuemRIBr1HB4oxxQF8G5Psy+eWB07y019FRnr36LwHLTrqp8xB
	NbPYQbg/B79G0tsGNk8qWzzVaVHuBtlL0JBZbP7f0Sx7npS19iLyq2l46n2/K0Hh
	Quclzwx5jgUQVd9vUyiDA==
X-ME-Sender: <xms:DYZ-Z95_HmNtn_TGvjvnXZsQGHHwR68ErhCCnwPKB5PKhL2bKywdTQ>
    <xme:DYZ-Z64BfEdiCu-ObyJteEcyVc2cYVz9UtdcjsqeNTpzHZLYGVgwc_nhEGwrOBFr5
    C-X9rIsDfMgGDqHkDo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughpvghnkhhlvghrsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqshhtrghgihhngheslhhishhtshdrlhhinhhugi
    druggvvhdprhgtphhtthhopehlsghulhifrghhnhesrhgvughhrghtrdgtohhmpdhrtghp
    thhtoheplhhukhgrshdrsghulhifrghhnhesrhgvughhrghtrdgtohhmpdhrtghpthhtoh
    epkhgvrhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:DYZ-Z0djF0F8Cyx4YNavjb8CC2oJrAOU29XNan1QzxqSjMHqKEF4nA>
    <xmx:DYZ-Z2J7fhZaSrbL7UzD0spwvwcjCSpnNNqVHUhzeo02Uuv2Xj_PeQ>
    <xmx:DYZ-ZxJZUC0wnmxkUfBBDj1y3j9pNHjnO_OlL6a2mdY5xE-vlZ-xig>
    <xmx:DYZ-Z_y0urQdS2Usp2V_Pv4BTIt8JYfRjmmHtukW5pNjKrAPmXQLuA>
    <xmx:DYZ-Z5-Yw0PdjJepNiPbi0xNdi4G4LqXw-qlLOQeOwuI1wG6KW8nVOMF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3842F2220073; Wed,  8 Jan 2025 09:05:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 08 Jan 2025 15:04:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lukas Bulwahn" <lbulwahn@redhat.com>,
 "Dave Penkler" <dpenkler@gmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Lukas Bulwahn" <lukas.bulwahn@redhat.com>
Message-Id: <8ee50d2d-2c3d-495e-abd8-f0326ab16bd0@app.fastmail.com>
In-Reply-To: <20250107135032.34424-1-lukas.bulwahn@redhat.com>
References: <20250107135032.34424-1-lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] staging: gpib: refer to correct config symbol in tnt4882 Makefile
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jan 7, 2025, at 14:50, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit 79d2e1919a27 ("staging: gpib: fix Makefiles") uses the corresponding
> config symbols to let Makefiles include the driver sources appropriately in
> the kernel build.
>
> Unfortunately, the Makefile in the tnt4882 directory refers to the
> non-existing config GPIB_TNT4882. The actual config name for this driver is
> GPIB_NI_PCI_ISA, as can be observed in the gpib Makefile.
>
> Probably, this is caused by the subtle differences between the config
> names, directory names and file names in ./drivers/staging/gpib/, where
> often config names and directory names are identical or at least close in
> naming, but in this case, it is not.
>
> Change the reference in the tnt4882 Makefile from the non-existing config
> GPIB_TNT4882 to the existing config GPIB_NI_PCI_ISA.
>
> Fixes: 79d2e1919a27 ("staging: gpib: fix Makefiles")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
