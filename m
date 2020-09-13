From: David Miller <davem@davemloft.net>
Date: Sun, 13 Sep 2020 21:21:28 +0000
Subject: Re: [PATCH] tulip: windbond-840: Fix a debug message
Message-Id: <20200913.142128.1235029815519306771.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200913070107.352166-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200913070107.352166-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, hkallweit1@gmail.com, gustavoars@kernel.org, vaibhavgupta40@gmail.com, mst@redhat.com, leon@kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 13 Sep 2020 09:01:07 +0200

> 'w89c840_open()' is incorrectly reported in a debug message. Use __func__
> instead.
> 
> While at it, fix some style issue in the same function.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
