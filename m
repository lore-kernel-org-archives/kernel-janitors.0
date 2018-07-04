From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:40:38 +0000
Subject: Re: [PATCH] cnic: remove redundant pointer req and variable func
Message-Id: <20180704.224038.1110290834924254400.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704073912.15598-1-colin.king@canonical.com>
In-Reply-To: <20180704073912.15598-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: christophe.jaillet@wanadoo.fr, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 08:39:12 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer req and variable func are being assigned but are never used
> hence they are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'req' set but not used [-Wunused-but-set-variable]
> warning: variable 'func' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
