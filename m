From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 07 Jan 2016 09:10:31 +0000
Subject: Re: iwlegacy: 4965-mac: constify il_sensitivity_ranges structure
Message-Id: <20160107091031.BA568605BE@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1451474449-17912-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


> The il_sensitivity_ranges is never modified, so declare it as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> Acked-by: Stanislaw Gruszka <sgruszka@redhat.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
