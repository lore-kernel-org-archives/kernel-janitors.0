Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3037640B6CE;
	Wed,  4 Feb 2026 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210311; cv=none; b=coS4hEm323Xk9Myv7aL9ybJo7ArEA0RjhSxFiNPH214P3ex5UNOJnRjPc+IJ4YJi15Umgode9ICXEvakPyiy0ObeBSdgHxRbYB3zofs85E9xXu6bD4N5SaaY7E6cLQ5J9Kmm7xgQtfou5h9UgnOEP+o1hm/nPoUIEsdiGffI6UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210311; c=relaxed/simple;
	bh=Hx6NFYTFGKEqU4p+d+bpM74eF0b9omNPgd5ukVZgyGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftyLGUx07Yj9RundRARQ5rR3jhO42XAdiKuworCc08SYwOLAJZo3wLDRDu0QIP29IkJh5YPqVAchduG38LhH75HbDx86qAE4QjBYPUK9m0Kn7t/y6gllID2bc5JLkq1M9hORlkeoUfstwG9lJ6iynwLv7OQZ3uirbeAwd/6OBLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyRBDbKr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyRBDbKr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81737C4CEF7;
	Wed,  4 Feb 2026 13:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770210311;
	bh=Hx6NFYTFGKEqU4p+d+bpM74eF0b9omNPgd5ukVZgyGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyRBDbKrxUS4lv7rdNYXGjs3Ab0G4ZRQtqcAI+4rRGrW9u090/iXGf+dpAf/lzbIj
	 XXqNBDe/V1RLdQ81r0J9nyReRxhlvzLwzSZEnFPxvWQNHcLssPbx2taNct+TwOnqfF
	 VpVvFgEcF2wfCk1SkrDeb27aRF1j+jClEomySFKSOVw0qZteqUFq+ZLlACIs6ZpZGc
	 LMz/TQjLY1CxWV8tV5iVq+iobc3MlhMuM6h3tUQ+0Ek5Fem/WNlXxBkuYM7f1XonyX
	 5z74z+TNUUJ6IVZgknbmkDGwThaA9XWK16Xp+slz/kMw2G/kscssyIEhL8KB82FWtw
	 +yaL/lR7yNCWw==
Date: Wed, 4 Feb 2026 14:05:06 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/gic-v5: Fix spelling mistake "ouside" ->
 "outside"
Message-ID: <aYNEAorI+Ax/nDie@lpieralisi>
References: <20260203210735.5036-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203210735.5036-1-colin.i.king@gmail.com>

On Tue, Feb 03, 2026 at 09:07:35PM +0000, Colin Ian King wrote:
> There is a spelling mistake in a pr_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index e24ce3d9fb62..8c4cf8430871 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -902,7 +902,7 @@ static int gicv5_its_alloc_eventid(struct gicv5_its_dev *its_dev, msi_alloc_info
>  		event_id_base = info->hwirq;
>  
>  		if (event_id_base >= its_dev->num_events) {
> -			pr_err("EventID ouside of ITT range; cannot allocate an ITT entry!\n");
> +			pr_err("EventID outside of ITT range; cannot allocate an ITT entry!\n");
>  
>  			return -EINVAL;
>  		}
> -- 
> 2.51.0
> 
