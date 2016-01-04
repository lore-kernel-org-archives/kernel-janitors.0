From: Stanislaw Gruszka <sgruszka@redhat.com>
Date: Mon, 04 Jan 2016 09:37:38 +0000
Subject: Re: [PATCH] iwlegacy: 4965-mac: constify il_sensitivity_ranges structure
Message-Id: <20160104093737.GB2588@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451474449-17912-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451474449-17912-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 30, 2015 at 12:20:49PM +0100, Julia Lawall wrote:
> The il_sensitivity_ranges is never modified, so declare it as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Stanislaw Gruszka <sgruszka@redhat.com>

