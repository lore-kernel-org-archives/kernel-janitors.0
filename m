From: Jakub Kicinski <kuba@kernel.org>
Date: Sun, 12 Apr 2020 18:47:25 +0000
Subject: Re: [PATCH] soc: qcom: ipa: Add a missing '\n' in a log message
Message-Id: <20200412114725.2dc5844b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200411073004.8404-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200411073004.8404-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: elder@kernel.org, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 11 Apr 2020 09:30:04 +0200 Christophe JAILLET wrote:
> Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.
> 
> Fixes: a646d6ec9098 ("soc: qcom: ipa: modem and microcontroller")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks!
