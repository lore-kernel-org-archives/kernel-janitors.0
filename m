From: David Miller <davem@davemloft.net>
Date: Sat, 13 Dec 2008 05:15:35 +0000
Subject: Re: [PATCH 3/9][v2] mISDN: make global symbols static or include
Message-Id: <20081212.211535.151764794.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49419a29.05ae660a.58c7.314c@mx.google.com>
In-Reply-To: <49419a29.05ae660a.58c7.314c@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kkeil@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 11 Dec 2008 22:36:00 +0100

> The warnings fixed by including an header file for the appropriate
> prototype are marked with "*", for all others the corresonponding
> symbol has been made static.  This patch fixes all such issues in
> mISDN.
> 
> Fix this sparse warnings:
 ...
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: Karsten Keil <kkeil@suse.de>

Applied
