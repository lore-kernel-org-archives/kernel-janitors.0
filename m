From: David Miller <davem@davemloft.net>
Date: Mon, 17 Feb 2020 03:30:48 +0000
Subject: Re: [PATCH] NFC: pn544: Fix a typo in a debug message
Message-Id: <20200216.193048.970019609345533158.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200215071728.302-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200215071728.302-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: sameo@linux.intel.com, joe@perches.com, gregkh@linuxfoundation.org, allison@lohutok.net, tglx@linutronix.de, kstewart@linuxfoundation.org, natechancellor@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 15 Feb 2020 08:17:28 +0100

> The ending character of the string shoulb be \n, not \b.
> 
> Fixes: 17936b43f0fd ("NFC: Standardize logging style")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
