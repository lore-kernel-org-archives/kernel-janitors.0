From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 14 Oct 2020 00:15:04 +0000
Subject: Re: [PATCH 0/5] net: use semicolons rather than commas to separate statements
Message-Id: <20201013171504.5089fe3b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: linux-security-module@vger.kernel.org, Valdis =?UTF-8?B?S2zEk3RuaWVr?= =?UTF-8?B?cw==?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-afs@lists.infradead.org

On Sun, 11 Oct 2020 12:34:53 +0200 Julia Lawall wrote:
> These patches replace commas by semicolons.  Commas introduce
> unnecessary variability in the code structure and are hard to see.
> This was done using the Coccinelle semantic patch
> (http://coccinelle.lip6.fr/) shown below.

Applied 3-5 to net-next, thanks!
