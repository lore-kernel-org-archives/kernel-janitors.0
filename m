Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55B0334692;
	Wed, 15 Jul 2026 11:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115339; cv=none; b=UWyo9VTf3p0DiNtiZHoO6FCnfVClCwMNcGtZPQEHGT9zvhD0tBkQuureGrqf6zXhIm41GW+oj6NQ/MhD3IgF8JliLilNM8mDdIc1L1t3lTlE+vEVGYAGfyXQ38FQMt+KD8l64/dTBASHkkvzBYsXTXglUCAnhcCyoyUP4BI3bNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115339; c=relaxed/simple;
	bh=0wV7b41rEJI4kdnRgNeLbj6Bx7WR7DoOrjY0ORsprpE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FhznLsJ63oW3uB8cCp6FemwELuhnaqXUWC8wqESv0lMzdnn84Om1cNriwJGN2awQr8WWaiq4b4hzstl/SppHjRbjbHUjf+MyGgcHHCXmsVwhN5rMjK+4zcau7VibumLmxd3UDSu/3BNE/9ItYgKOYUVwg1KWqK8VPMLnrlnznCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZS2SHHy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZS2SHHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076D01F00A3A;
	Wed, 15 Jul 2026 11:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115337;
	bh=3+DvnJFWuEv8F3DbR7zs2qmORx+Tuuq9xuhrdGIsPB8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OZS2SHHyCAJC/Y4MOjAutNHNLS4MOw3b383xaGtw7ENMZu3ByxigZOBWYiTQ8azEu
	 3jDUHc3DnP8YZF17gIHD6UG47Nk+mvKixdfIXdYN1+5WiwKqJet9fNHtIBnzlxnCvM
	 NyZkvDHVWhhABS7KIbKjGjFbVmWiZL3sprWCZiFUW1OUT3UQiffJylsqnd9bmMwX/2
	 Ptfm2Sp/j3gaWQvJrJcolplNsD82GcTvSDMZ68/E2hWpS6bLlXicz6uttHkbSI8d/e
	 TWs/6H6PqAQKXfB0uZplfnNQUTFnZeb3ut3TlvKJUaNhqo+E5LONY/gjcFrdlkY5Fh
	 Dxnd8HSAO4lEA==
From: Mark Brown <broonie@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, 
 Dan Carpenter <error27@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <alFJVBbiFNxhqa_1@stanley.mountain>
References: <alFJVBbiFNxhqa_1@stanley.mountain>
Subject: Re: [PATCH] regulator: adp5055: Fix error code in
 adp5055_of_parse_cb()
Message-Id: <178406414188.7661.3559621560898546008.b4-ty@b4>
Date: Tue, 14 Jul 2026 22:22:21 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0wV7b41rEJI4kdnRgNeLbj6Bx7WR7DoOrjY0ORsprpE=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqzwgvb1y96tbWA7ezK2rGGFy/sXIp1NMUp56mzym/nKQ
 sXU1/R2MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQATWf2b/a/QF5mI2paMe7ff
 2LvXTywwy6uRvlVr9t7q3LecmS43mqO843Zncl0yNzqs1RV5blb9fEPZ7Ic1pzKbvC53yQT7th/
 Y8nvJmxspEyt8vHU/LDJviw/zvR6R+DJvw9vcJyotEdU//nq1SUVt+Z3sWeE2vbTv1nRe25Jbok
 vLd8d9knHv/74+MPr4yXmlEj9WzDuV8LLvkfcKDuYJMZpbF+auKc95e9QtPE1VozNkUsPqL0+WJ
 0gkMUbPfb9VmE2KoUM0Om7Zzq2Wphedm//xfL6/1UVpldP0Wtdf8e9OtkkaslYeTpj/WizhQuf+
 eYxFK552HCj/2+3EyiC/SEVN/8auSh6FmoYaRun1igJXAQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 10 Jul 2026 22:34:44 +0300, Dan Carpenter wrote:
> regulator: adp5055: Fix error code in adp5055_of_parse_cb()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/1] regulator: adp5055: Fix error code in adp5055_of_parse_cb()
      https://git.kernel.org/broonie/regulator/c/153bc959ce0f

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

