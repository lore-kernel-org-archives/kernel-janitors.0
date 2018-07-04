From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:41:13 +0000
Subject: Re: [PATCH] qlogic: netxen: remove various redundant variables
Message-Id: <20180704.224113.994787090221325781.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704114553.8293-1-colin.king@canonical.com>
In-Reply-To: <20180704114553.8293-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: manish.chopra@cavium.com, rahul.verma@cavium.com, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 12:45:53 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables consumer, cmd_desc, end_cnt and no_of_desc are being assigned
> but are never used hence they are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'consumer' set but not used [-Wunused-but-set-variable]
> warning: variable 'cmd_desc' set but not used [-Wunused-but-set-variable]
> warning: variable 'end_cnt' set but not used [-Wunused-but-set-variable]
> warning: variable 'no_of_desc' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
