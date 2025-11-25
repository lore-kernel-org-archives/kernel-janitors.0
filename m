Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B502DAFBB;
	Tue, 25 Nov 2025 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764065287; cv=none; b=ZVY2BRTgQ/Ebo5SMheaeZ61uZxFG/cLsIg7tf87i3xZXTEndPimM/AQjUzKNNtA4oxQp0FBt75ZZ/xo3jwsB9joF1IXaYjMhES2fouwYf+ye+s7+hy8OLFLyIvYzlNUSy5vqhtNLiUSW/4rFCFbcjbK2jTTsRJ8M+A+fce6LrKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764065287; c=relaxed/simple;
	bh=D1b4er93gAo+OdqHV55sYeUH0qszWznpY2Gqy4l4Bpw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=W5KLFickxsMEAF/HDrKKPu8ic4y6f3NiRSL9SEvpB3HSILeQpFeyjkDZCD+99mSM0d75vyBNOYs0B4FwMerEpNHQ/wKRQt5mq84CXUYcT96JC1ieEAYaSLENdZHcxWZ3+hqUlFASXPRgehU9PD4IwNPVvRQCysAFXxnKw9c1vLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEPGstBb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEPGstBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C36C4CEF1;
	Tue, 25 Nov 2025 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764065285;
	bh=D1b4er93gAo+OdqHV55sYeUH0qszWznpY2Gqy4l4Bpw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aEPGstBbu+C83dg92XtBr6Vs04BmxFzimlKkzXWXFd/tjzsGs8c2Ml4G9o3qliDFa
	 1lBo/b9j1xdEfgJ5+Zz26WZ8NcaSQSXu5BeGg4iY9vhu0vU54jiA+Rfp/X3k/XYAF2
	 YYTd00hXO3tKGYG5KPBvuOj7GmZ6fW2kI0+6/lNJJMBGHfX/ZZ14rgDYvQ4/WdbcC9
	 mdAhux7EBWLiaLaikGFLBcgb0FkrOZTUz6qH5FAuRGS7uLGTwZ1HIuYkfGB4gEogV8
	 8iBzTl6g/ohSViXQbB9ZdLAttfE8/84SXbFdKAcxY5xy6pyLFs+ElKgbi6BWXYfBGr
	 ofBYjNvzUOfgA==
Date: Tue, 25 Nov 2025 03:07:59 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
cc: Conor Dooley <conor@kernel.org>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    Himanshu Chauhan <himanshu@thechauhan.dev>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
    kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: refer to intended files in RISC-V SSE
 DRIVER
In-Reply-To: <20251121134757.120782-1-lukas.bulwahn@redhat.com>
Message-ID: <1d42ff22-509d-ccee-1f7d-3400ffb6ed61@kernel.org>
References: <20251121134757.120782-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Nov 2025, Lukas Bulwahn wrote:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 5ffe60d26107 ("drivers: firmware: add riscv SSE support") adds the
> files riscv_sbi_sse.[ch] and intends to refer to them in the new
> MAINTAINERS section RISC-V SSE DRIVER. This section however refers to the
> non-existing files riscv_sse.[ch].
> 
> Adjust the file entries to the intended file names.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Thanks for catching this; queued for v6.19.


- Paul
