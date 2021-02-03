From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Wed, 03 Feb 2021 23:58:27 +0000
Subject: Re: [PATCH] netfilter: nf_tables: remove redundant assignment of variable err
Message-Id: <20210203235827.GA21793@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128175923.645865-1-colin.king@canonical.com>
 <20210203230421.GA18404@salvia>
In-Reply-To: <20210203230421.GA18404@salvia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 04, 2021 at 12:04:21AM +0100, Pablo Neira Ayuso wrote:
> On Thu, Jan 28, 2021 at 05:59:23PM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The variable err is being assigned a value that is never read,
> > the same error number is being returned at the error return
> > path via label err1.  Clean up the code by removing the assignment.
> 
> Applied to nf, thanks.

Sorry, I meant, nf-next
