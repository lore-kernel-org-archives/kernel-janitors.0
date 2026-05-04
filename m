Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399D9883F;
	Mon,  4 May 2026 07:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878108; cv=none; b=p53cZZ2ehAilX1dh+DxED8hVubYV6RKSpiJ4fAVhLsgKz9xbzr1se/pdsWpU7uEGuLKfSO/T8UwHHC8TVwGNbYvhU3mkBw61SgIecFYttxgbqzP9cTlb8IeKT9FimPxkWaRfd8aH9WTCiPprKxKENreKlOtik5z2X56qiZx066w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878108; c=relaxed/simple;
	bh=k3MkcnKUpj6Y4Hl/SLRdMsS5S0r+8iRW1ZfsfVLYD3Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OpI3sbP1lUdMAEPS6IS1PLaBRk6URR4aBz2oAGfBE9AfPDOOU4XRfoQ0AhyU69kSn+x5acsRJ5PEM49xr8mMJFSi3waNq/MpMiPX3jNWRA+h1jelZyUcxN7FXo85ukAN3jbjhFhzWuwg6mDPH+6CoX5MogNX7inM5AcpGRyULqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=I5O2S/fQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ojSoVPXI; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="I5O2S/fQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ojSoVPXI"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 4C3B2EC00AD;
	Mon,  4 May 2026 03:01:45 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 04 May 2026 03:01:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777878105;
	 x=1777964505; bh=5txGQwjnvMfmMJt5h7DPCSnr4hPNNXEjb7mJC12aqP8=; b=
	I5O2S/fQJmsAwR42HgchN9BYhwETD+UrtNmgqbfFXRTgXvnIA0pUs9gVS5hUU4Es
	fTBxWst4NbZPh3BxwMb7xcKL4SToqJ7yQVcnbsiG/xAHKBpAg0MdNu7FFWGM2ume
	ZaoGBTDtGvyHCtPPFKUsg+Ii4PbLk0Ssi96eH6gLPS6Ce/INvwzoBDYMTFi6PVc+
	e/hSDjMV0wHk0noQov80SF4txs84pAmmv/ep62W+36zmB7QxoaQNrROE6Fr+Vx23
	DhyfsuMG0bFecPuN0l7vvH/FQ8pGLktwk6hq/Wx7PP6H5BdqSVrXcnuczL1hLSs0
	bgoxkZGZVEOaOM0QTFKfgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777878105; x=
	1777964505; bh=5txGQwjnvMfmMJt5h7DPCSnr4hPNNXEjb7mJC12aqP8=; b=o
	jSoVPXISvQrOwzI8Lx+YPk68Qzg/8+Koc3QzJ9lMft6MhyZZV7AIA56wPee2khAj
	PFriq1pTmS0qFi1LgQCbxdB8oyKtlt/zMmwHp7SWswgIYGqsb0Evv5gpOQFCVZnR
	MwaihWO0y2a3GRFDSdo/rIIh1SO9HKi1ekO75ZWDU3yYPlgZrNR3Z0gWi+iPIGD+
	e1mw2krdHb6T5RdnezJkCusWevV0SpLcaBXKgv/TkHexSrWtb+r/tbXxSJAx+o2n
	MywfIKJBnNLxbqLJ4QbvujqkZUVJZXrVQbJ09Gb4mGmm6cZgeXPL0d8o3jGtQoq1
	pqiqssPa8isRFJetTU27Q==
X-ME-Sender: <xms:WET4aV5v_ECbWwSTq_ZTTpppnl10QEaJt5DNxlTE9c-1F1Kd7KcRtA>
    <xme:WET4aduywIFjL1VHQ4dw_-GMR-VoF0Ho_htWBniw1GRFeIi8lwQtg0k4aBMUzzumf
    IQx4OIXDdyF8QQZ2Fn_anHg90klPtyUaKh7qWTdvwU2ar0Kti0HYyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkedulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoh
    eprhguuhhnlhgrphesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtph
    htthhopehquhhitggpjhhjohhhnhhsohhnsehquhhitghinhgtrdgtohhmpdhrtghpthht
    ohepkhgvrhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:WET4aT8vlBfmpluhyNh2yIqXddM_09TTCCUxKl4644vI2YSOp5sIVA>
    <xmx:WET4aTiMU6Qp25FL4r-7GlaArVdB9V0qKV8ucVBSdimJuEv2MpZjIA>
    <xmx:WET4aaFjei3QmAMylMIB7rBJZZQT5Qz-dZpCzkvqHE5IYxZTdLG3fA>
    <xmx:WET4aS9t5TyodaSvcYSmAq08s4p47p_TynZPMQC4oPSe0Rsmwhq0SA>
    <xmx:WUT4aWMbIrmMnSMsYG--QIYkO8E1a4NyC2RxLOZY0tBJYXblWMVsCQGL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AD858700069; Mon,  4 May 2026 03:01:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A_0bUCm6dRrc
Date: Mon, 04 May 2026 09:01:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Randy Dunlap" <rdunlap@infradead.org>,
 "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 "Russell King" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Message-Id: <734617a9-487c-4053-aaa3-095b517d5bbf@app.fastmail.com>
In-Reply-To: <b52d5383-dd57-4bbe-a6cc-fd584cf68957@infradead.org>
References: 
 <20240622-md-arm-arch-arm-probes-kprobes-v1-1-0832bd6e45db@quicinc.com>
 <3808c973-1315-420c-900d-122a73a34f9e@quicinc.com>
 <05cacd03-686a-4ede-b485-7f4781f69b99@app.fastmail.com>
 <b52d5383-dd57-4bbe-a6cc-fd584cf68957@infradead.org>
Subject: Re: [PATCH] arm: kprobes: add missing MODULE_DESCRIPTION() macro
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, May 3, 2026, at 23:12, Randy Dunlap wrote:
> On 7/19/24 4:28 AM, Arnd Bergmann wrote:
>> On Tue, Jul 9, 2024, at 21:53, Jeff Johnson wrote:
>>> On 6/22/2024 9:34 PM, Jeff Johnson wrote:

>> -#endif
>> +MODULE_DESCRIPTION("Test code for ARM kprobes");
>> +MODULE_LICENSE("GPL");
>
> What happened with this cleanup patch?
> I don't see it on a mailing list or in linux.git or linux-next.git.
>
> I was about to come up with the same patch since it still seems to be
> needed in linux-next-20260430.

My mistake. I've sent it to the list now, will add it to the
patch tracker when I get an Ack.

       Arnd
