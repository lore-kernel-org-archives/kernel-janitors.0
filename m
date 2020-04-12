From: Jakub Kicinski <kuba@kernel.org>
Date: Sun, 12 Apr 2020 18:47:46 +0000
Subject: Re: [PATCH] net: ethernet: ti: Add missing '\n' in log messages
Message-Id: <20200412114746.1ed9fda7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200411075211.9027-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200411075211.9027-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, grygorii.strashko@ti.com, colin.king@canonical.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 11 Apr 2020 09:52:11 +0200 Christophe JAILLET wrote:
> Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.
> 
> Fixes: 93a76530316a ("net: ethernet: ti: introduce am65x/j721e gigabit eth subsystem driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks!
