Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A9824A7E8;
	Wed, 15 Jan 2025 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736953322; cv=none; b=SrHv9KyfiAORTL9aw1u/1S5MoKWEBGHzCWF+wq7E3MSJjBNIdOjwdsLgaY9ZLSmReGVw+Vzf/9WRTe1VCbygsrTLu+A6EQTztKvSD70EEms+NAbU9a+XU9P86ffD+jG/7eJ8VHiQfJbh+4af0a7w3ojjGkIf9iSL/9lKK9WzP8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736953322; c=relaxed/simple;
	bh=oSgVQD0xpvqqlDYs9nEBaWNPRJOFZ0gODY4jWMuozSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eRoes0J8fCrbnRbNvvf0K2P7BOhFj3bkjvC4B0T+BJn5dkQd9+umK6aS3too/kZ9Qhca4EE149+QrUz3FHqc45CrAnx+08i65KVKkFzcBSIVOqZVnpl26GP3ot5hdo7/JFt463F9a1rJ7YzcZv1+wE1a7YNWI9/IkY4PHJa4DmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HU4IdaWE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HU4IdaWE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406B2C4CED1;
	Wed, 15 Jan 2025 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736953321;
	bh=oSgVQD0xpvqqlDYs9nEBaWNPRJOFZ0gODY4jWMuozSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HU4IdaWE9T7LSDzSr52omxBfSAnoOD6hTdqDHxZUJnnswkLVpppcmpKrEf1j2jlP/
	 ETr7bZH1kIA7yPIXV6Hk64SJU8Uy+L/+0+zddB0c+EyBcrmqsAgGYjReM8IBvhp5fM
	 DF5d3mWzG3cqC6l1XCrriHa2JVYljDFN2PbkVuh52Uv93+8LM6cMG93eUFN+q8jYDC
	 1Gji8mX7IAE37wjP9QsREvh4ozg0Pb24UFQJSdzlCALY/XVQuoOTUysV9UkMmttYlU
	 On3yJbr5XBvkOXqPETPwMruSeNpVsPGJU4OuBwKCVpG3rLGOpDfDqsVmsAfFgDK4DP
	 abXYofRqXYr3A==
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
In-Reply-To: <20250110120736.58831-1-lukas.bulwahn@redhat.com>
References: <20250110120736.58831-1-lukas.bulwahn@redhat.com>
Subject: Re: (subset) [PATCH] MAINTAINERS: Adjust the file entry for the
 qnap-mcu header
Message-Id: <173695331999.4116163.16095608205046775735.b4-ty@kernel.org>
Date: Wed, 15 Jan 2025 15:01:59 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 10 Jan 2025 13:07:36 +0100, Lukas Bulwahn wrote:
> Commit 998f70d1806b ("mfd: Add base driver for qnap-mcu devices") adds a
> file entry in MAINTAINERS referring to the file include/linux/qnap-mcu.h,
> whereas the file added in the commit is placed in include/linux/mfd/.
> 
> Adjust the file entry to the actual location of this header file.
> 
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Adjust the file entry for the qnap-mcu header
      commit: 2816b0c949af89640b8dc05de53e650cbf1d55fb

--
Lee Jones [李琼斯]

