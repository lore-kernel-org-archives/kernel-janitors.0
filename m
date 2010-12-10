From: David Miller <davem@davemloft.net>
Date: Fri, 10 Dec 2010 22:57:44 +0000
Subject: Re: [PATCH] inet6: Remove redundant unlikely()
Message-Id: <20101210.145744.13732812.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1291905468-32174-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1291905468-32174-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tklauser@distanz.ch
Cc: kuznet@ms2.inr.ac.ru, pekkas@netcore.fi, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu,  9 Dec 2010 15:37:48 +0100

> IS_ERR() already implies unlikely(), so it can be omitted here.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Applied.
