From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 02 Mar 2020 12:24:10 +0000
Subject: Re: [PATCH] netfilter: clean up some indenting
Message-Id: <20200302122410.5vncrjcjjchkjcsw@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200225064150.hwewi26uc2yfwh2u@kili.mountain>
In-Reply-To: <20200225064150.hwewi26uc2yfwh2u@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Manoj Basapathi <manojbm@codeaurora.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

On Tue, Feb 25, 2020 at 09:42:22AM +0300, Dan Carpenter wrote:
> These lines were indented wrong so Smatch complained.
> net/netfilter/xt_IDLETIMER.c:81 idletimer_tg_show() warn: inconsistent indenting

Applied, thanks.
