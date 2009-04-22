From: David Miller <davem@davemloft.net>
Date: Wed, 22 Apr 2009 09:24:42 +0000
Subject: Re: [PATCH]8390p: Get rid of init_module/cleanup_module
Message-Id: <20090422.022442.248600629.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <667b0cb60904110555k442f3959k9140d355b00980cd@mail.gmail.com>
	<alpine.LNX.2.00.0904201744380.13028@wotan.suse.de>
In-Reply-To: <alpine.LNX.2.00.0904201744380.13028@wotan.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jkosina@suse.cz
Cc: ormi.linux@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, p_gortmaker@yahoo.com, trivial@kernel.org, netdev@vger.kernel.org

From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 20 Apr 2009 17:46:19 +0200 (CEST)

> On Sat, 11 Apr 2009, Mateusz Mandera wrote:
> 
>> This trivial patch just "gets rid of" init_module and cleanup_module
>> from drivers/net/8390p.c
>> 
>> Signed-off-by: Mateusz Mandera <ormi.linux@gmail.com>
 ...
> I'd rather have this merged through subsystem tree than trivial tree, 
> adding netdev to CC.

Applied to net-next-2.6, thanks.
