From: walter harms <wharms@bfs.de>
Date: Wed, 09 Dec 2009 15:43:32 +0000
Subject: Re: [PATCH] Coding style correction on some drivers that use Generic
Message-Id: <4B1FC5A4.9030300@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20091209143540.GA9620@vacuum.larces.uece.br> <20091209145554.GQ6070@fi.muni.cz>
In-Reply-To: <20091209145554.GQ6070@fi.muni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Yenya Kasprzak <kas@fi.muni.cz>
Cc: Rudy Matela <rudy.matela@gmail.com>, Krzysztof Halasa <khc@pm.waw.pl>, trivial@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Jan Yenya Kasprzak schrieb:
> Rudy Matela wrote:
> : Added a space separating some if/switch/while keywords from the following
> : parenthesis to conform to the CodingStyle.
> 
> 	Hello,
> 
> 	I am not sure whether it is necessary to fix formating mistakes in
> a driver which is in deep freeze and the hardware is not produced anymore,
> but whatever.
> 
> Acked-By: Jan "Yenya" Kasprzak <kas@fi.muni.cz>
> 
> -Yenya
> 
> : Signed-off-by: Rudy Matela <rudy.matela@gmail.com>
> : ---
> : 
> :  drivers/net/wan/cosa.c       |   10 +++++-----
> :  drivers/net/wan/hdlc_cisco.c |    8 ++++----
> :  drivers/net/wan/hdlc_x25.c   |    4 ++--
> :  3 files changed, 11 insertions(+), 11 deletions(-)
> : 
> : diff --git a/drivers/net/wan/cosa.c b/drivers/net/wan/cosa.c
> : index b36bf96..f0bd70f 100644
> 

It is ok until the driver is removed, if this "issue" is not fixed it will
trigger any check-coding-style and generate new patches. Since it involves
no code changes it is harmless.

re,
 wh

