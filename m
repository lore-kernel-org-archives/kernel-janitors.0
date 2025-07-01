Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552F2221281
	for <kernel-janitors@vger.kernel.org>; Tue,  1 Jul 2025 11:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369657; cv=none; b=Pm2VaFbml+8VJuIsgtzKxenDgNGnf1NpHfKkMlJqt2GVglphRqL4aCWZ+AetGWym7uac3T83tHJboRnVehSF8s7k5o5oreCvnFbR0VZ5RiPKx3pLNu8ta1iED2WigLKs8A0Xks/B8EM4oTn2jfeF2neO3G4rA44dheOde0K2s94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369657; c=relaxed/simple;
	bh=dBgPVe4bIEIpwcFKebSjBxi9Mwj1VM4kDhGseOtEpME=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QeccPIpXHem8qzB6rZWE3bwhhLFAkM9N0JJ7LBTErkVsE6lDV+4XLdxhEP3REbSE5rQErp5kQx3xiQWlSoemsNbwP+8Q7eYXmW/TfXTxjGm0TS+mk66E3/rUBOZHMQ8r5jl4OnHIYpRNOsa/cWJRIlcAUdLu0F3hM/4OHnEK9LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=ys06cJVZ; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="ys06cJVZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XBHZug9kzeOCmE+cnYoUbgZz8XAZ55Pejq8xSlYg/KY=; b=ys06cJVZSXVu+s+ypDtWWjhqiG
	hcBaxf/rcDAyjN8JSoWMncHp3rkHltCucuBcu6pUkC62lUn1zj82APmORDDiau/AljQRwmjGzqdim
	xynQlFCMDimAMNIYWWlXHJj/W2CqO6D1uN8qsS//j+shbB+ytMCX6F+r7rWBA/as8OwZdZOr85hj4
	aoQuiDQQUfeOwR0fJvWSB65rTjvVFxWSko1dBn7epl1R2arWpw55hUJXM24Kci9Q83/zkeW4JFiWX
	okhWWmiRCtJU7tslQlSfaz0WinB16qsBzPe3n4D56yJ1BUD005sbA2WpyaGmf4jdjoGYriRL54ZZm
	GqPRs5Cg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:54876 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uWZFa-00000008QG6-26UM;
	Tue, 01 Jul 2025 07:34:11 -0400
Date: Tue, 1 Jul 2025 07:33:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Lukas Bulwahn <lbulwahn@redhat.com>
cc: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] crypto: caam - avoid option aliasing with the CONFIG_CAAM_QI
 build option
In-Reply-To: <20250701112045.18386-1-lukas.bulwahn@redhat.com>
Message-ID: <f80f2972-e148-1b59-5d5c-d1714a843433@crashcourse.ca>
References: <20250701112045.18386-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 


    (Most recipients dropped.)

On Tue, 1 Jul 2025, Lukas Bulwahn wrote:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> In the Makefile, the new build option CONFIG_CAAM_QI is defined conditioned
> on the existence of the CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI, which is
> properly defined in the Kconfig file. So, CONFIG_CAAM_QI is just a local
> alias for CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI.
>
> There is little benefit in the source code of having this slightly shorter
> alias for this configuration, but it complicates further maintenance, as
> searching for the impact of CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI
> requires to grep once, and then identify the option introduced and continue
> searching for that. Further, tools, such as cross referencers, and scripts
> to check Kconfig definitions and their use simply do not handle this
> situation. Given that this is the only incidence of such a config alias in
> the whole kernel tree, just prefer to avoid this pattern of aliasing here.
>
> Use CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI throughout the Freescale
> CAAM-Multicore platform driver backend source code.
>
> No functional change.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

... snip ...

  hilariously, i was *just* about to use this symbol (CONFIG_CAAM_QI)
as an example of finding what i call "badif" Kconfig symbols --
symbols that are checked by the preprocessor but are *apparently* not
defined in any Kconfig file. i'll write a separate note about this
right away, but this very symbol was one that was flagged by my
script that turned out to be just a bit trickier than i thought; your
solution dealt with the "trickiness", though.

  explanation coming shortly.

rday
