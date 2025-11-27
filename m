Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D64C23BD06;
	Thu, 27 Nov 2025 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764241975; cv=none; b=o+m83wiG8wMG9D5HIBhoEhGPisooNCWm9n/6WUb/AoVmE1TDp53yfFOUEv2+QqmsFZwp6rfn7DJvLzzdKhMVhzRykP9J2nYMy/f9AEBU3GvlabjdXtTVB56MfcRLS0lU5o0dnY2y3z+NLiVYkHWqZ73ptud8D9onRUT51tQylag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764241975; c=relaxed/simple;
	bh=QjOo4fmWyobB89ivxKhHk3XpB5a4toGIRDjmMB9+tZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GUIkIDlK23H+VVqSWi4Ilbk6SRb8UBVlIWjnvMH5xcvVqohp2ig0Lu7LPm0cq2Ic3fbCRtTtPjGoB5I2taXtaB3DoFbQnVXqS7epKR5akZs/7gBdR6PfceazB/9pD7TuEHHZW0ywR0KMke5GJCpjQGOdLWnnvBU0UhSl+rz/Sqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nxq38WUg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nxq38WUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E989C4CEF8;
	Thu, 27 Nov 2025 11:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764241975;
	bh=QjOo4fmWyobB89ivxKhHk3XpB5a4toGIRDjmMB9+tZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Nxq38WUgO2kSP6H9CDnErX0t4IUPeIb9bkzOmAgTpG0OBfTKzBZPHZlKTmqBPD/NB
	 F79ICfDOdcQoBwyWxNmr8CKWkCbGis6DD8Fqz62vnWGdiVeQ6pWsoVQCpWpkB3a6Ub
	 g6R1UbygYz381Z8GnlNlndTxxkz78QUwZZTyCMwC2p1+H87PWyWAAJ5N1cIanbQ5l2
	 SrgnJgrNCYFJeXPq09HQgMXAyBVCPMACWM6eXAd95JNX1R5VaN4jWGuYbW0Jlj9/D9
	 rpH2QljI3Cfi1xhcQ2+9xakQJlt6McR3GaTxX+/J7y6Q0iYrpbqOh1BpBS5/sm2xZi
	 /fAowL/08XB8g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: leitao@debian.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <cover.1761390472.git.christophe.jaillet@wanadoo.fr>
References: <cover.1761390472.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 0/2] configfs: Constify some fileds in struct
 config_item_type
Message-Id: <176424193166.680817.14663362702382532392.b4-ty@kernel.org>
Date: Thu, 27 Nov 2025 12:12:11 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Sat, 25 Oct 2025 13:15:36 +0200, Christophe JAILLET wrote:
> These 2 patches constify ct_item_ops and ct_group_ops in struct
> config_item_type.
> 
> When/if they are applied, I'll send some patchess in each subsystem to
> constify the corresponding structures.
> 
> This 2 steps approach is IMHO easier way to make these changes.
> This avoids long series and cover-letter/first patches sent to many
> maintainers and lists.
> 
> [...]

Applied, thanks!

[1/2] configfs: Constify ct_group_ops in struct config_item_type
      commit: f2f36500a63b73a8be90127322ad740253cf89c0
[2/2] configfs: Constify ct_item_ops in struct config_item_type
      commit: f7f78098690d60a03b47942ac7d73ea17b42239e

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


