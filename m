From: David Miller <davem@davemloft.net>
Date: Wed, 02 Apr 2008 07:03:34 +0000
Subject: Re: [PATCH] drivers/atm/iphase.c: compilation warning fix
Message-Id: <20080402.000334.14012482.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200804012349.29836.lpotenza@inwind.it>
In-Reply-To: <200804012349.29836.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lpotenza@inwind.it
Cc: kernel-janitors@vger.kernel.org, chas@cmf.nrl.navy.mil, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>
Date: Tue, 1 Apr 2008 23:49:29 +0200

> From: Leonardo Potenza <lpotenza@inwind.it>
> 
> Removed the warning messages:
> drivers/atm/iphase.c:961: warning: 'tcnter' defined but not used
> drivers/atm/iphase.c:963: warning: 'xdump' defined but not used
> 
> tcnter and xdump() are used only in debug build
> 
> Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>

Applied, thanks.
