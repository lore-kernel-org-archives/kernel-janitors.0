From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Sun, 08 Sep 2019 16:11:18 +0000
Subject: Re: [PATCH] netfilter: nf_tables: Fix an Oops in nf_tables_updobj() error handling
Message-Id: <20190908161118.hfvcmrqsxyyxogyj@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906081808.GA8281@mwanda>
In-Reply-To: <20190906081808.GA8281@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Fernando Fernandez Mancera <ffmancera@riseup.net>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

On Fri, Sep 06, 2019 at 11:18:08AM +0300, Dan Carpenter wrote:
> The "newobj" is an error pointer so we can't pass it to kfree().  It
> doesn't need to be freed so we can remove that and I also renamed the
> error label.

Applied, thanks.
