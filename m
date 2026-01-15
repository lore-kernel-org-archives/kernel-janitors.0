Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9437530C63A;
	Thu, 15 Jan 2026 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768466975; cv=none; b=hDegy+I5Tc2GVXIOCw23eg2sSYV6E9PYJuzrGfx7vFoTx2vFRBLUvKITHb0BX3Et2O0OZIR6rR634KJznF0f7bPou3M+3jKZ2JvMVmYlbanWIh4Gaq36fsJHn87FDDACYTQVe5bCBBK/OuVVbsMfwQpUA3wdbQGyUzmWX/1Gksk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768466975; c=relaxed/simple;
	bh=Zeyjyb2t+zJje3FWsJHfMAe5hb2Mu7WA7siSzcu0C6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n6HvIHsknqkViIuVCJHhK9OUf9c+m5VygKo3mkrrV56HAsKMyIB/rXUHpKT4CXUvsSED1uvu4nyZdIhtetrF2Bn8iRHMhU3+k1c5QvfwvxZSg2+2k4Ng/zhpnO9we6QUkoZFiV9MvrsSsvxCZP9FZ6sK0wMCZSNyyWPnfwcIMAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkaZfxo+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkaZfxo+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0C1C19421;
	Thu, 15 Jan 2026 08:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768466975;
	bh=Zeyjyb2t+zJje3FWsJHfMAe5hb2Mu7WA7siSzcu0C6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bkaZfxo+crXYyXHHaIIs7XlJHJDJ5ufZMfECyl33v1lcJeiosPUjT5W/L/03Rk4Ou
	 5gkmZ38XORmfIlvgfNXqJckPQH7/R4pIsblYEGVd10JKMLvjbm6f/q5OqgRPnSMcw0
	 X6k+U9T4rNiQbo7RwU0I/aNGf1Md2B8QXQQa0C1BuL3pa21EIQDk/F9JskccPBq8T9
	 v/6fRwgTYIZF6P5SuCFz3rbWbmP/QOYmf7WZ3RQa7J1AZilFzdXBah6u5Nxnfovger
	 Lykq1QQnBKkuA85+U3uPagYJq2LYrsqJzkA85NMmn/ZiJ3i7ImxTm/MpipXOR4yb5b
	 V9TkTGvDKFx6A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Breno Leitao <leitao@debian.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <70c5fd68fcc4d3ba1f18002012fae19acf4ce50b.1767007414.git.christophe.jaillet@wanadoo.fr>
References: <70c5fd68fcc4d3ba1f18002012fae19acf4ce50b.1767007414.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] samples: configfs: Constify struct
 configfs_item_operations and configfs_group_operations
Message-Id: <176846695542.721717.5021604107219919636.b4-ty@kernel.org>
Date: Thu, 15 Jan 2026 09:49:15 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Mon, 29 Dec 2025 12:23:51 +0100, Christophe JAILLET wrote:
> 'struct configfs_item_operations' and 'configfs_group_operations' are not
> modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> [...]

Applied, thanks!

[1/1] samples: configfs: Constify struct configfs_item_operations and configfs_group_operations
      commit: 6363844fdbbb76afe1d44d678fe0746390204a5f

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


