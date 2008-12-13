From: David Miller <davem@davemloft.net>
Date: Sat, 13 Dec 2008 05:14:01 +0000
Subject: Re: [PATCH 2/9][v2] mISDN: consistently define 'debug' as '*u_int'
Message-Id: <20081212.211401.140171586.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49419a25.02e2660a.1ba9.6cda@mx.google.com>
In-Reply-To: <49419a25.02e2660a.1ba9.6cda@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kkeil@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 11 Dec 2008 22:36:00 +0100

> Impact: change data type for variable 'debug' from *int to *u_int,
> same for the argument type of mISDN_inittimer
> 
> In "core.h" mISDN_inittimer is declared with the argument type "*u_int", make
> the definition in "timerdev.c" match this.
> 
> This fixes also this warnings:
 ...
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: Karsten Keil <kkeil@suse.de>

Applied.
