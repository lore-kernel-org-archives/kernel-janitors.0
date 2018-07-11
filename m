From: Stanislaw Gruszka <sgruszka@redhat.com>
Date: Wed, 11 Jul 2018 09:26:44 +0000
Subject: Re: [PATCH] iwlegacy: remove several redundant variables
Message-Id: <20180711092644.GA2114@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180711074253.4192-1-colin.king@canonical.com>
In-Reply-To: <20180711074253.4192-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 11, 2018 at 08:42:53AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables id, unicast, write, conf, a_band, accum_tx and ucode are
> assigned a value but it is never read, hence they are redundant and
> can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'id' set but not used [-Wunused-but-set-variable]
> warning: variable 'unicast' set but not used [-Wunused-but-set-variable]
> warning: variable 'write' set but not used [-Wunused-but-set-variable]
> warning: variable 'conf' set but not used [-Wunused-but-set-variable]
> warning: variable 'a_band' set but not used [-Wunused-but-set-variable]
> warning: variable 'tx' set but not used [-Wunused-but-set-variable]
> warning: variable 'accum_tx' set but not used [-Wunused-but-set-variable]
> warning: variable 'ucode' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Stanislaw Gruszka <sgruszka@redhat.com>
