From: David Miller <davem@davemloft.net>
Date: Tue, 05 Dec 2017 19:38:27 +0000
Subject: Re: [PATCH][next] netdevsim: make functions nsim_bpf_create_prog and nsim_bpf_destroy_prog static
Message-Id: <20171205.143827.1200817158476092630.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171204125609.5931-1-colin.king@canonical.com>
In-Reply-To: <20171204125609.5931-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jakub.kicinski@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  4 Dec 2017 12:56:09 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Functions nsim_bpf_create_prog and nsim_bpf_destroy_prog are local to the
> source and do not need to be in global scope, so make them static.
> 
> Cleans up sparse warnings:
> symbol 'nsim_bpf_create_prog' was not declared. Should it be static?
> symbol 'nsim_bpf_destroy_prog' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
