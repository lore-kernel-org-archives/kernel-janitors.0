From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Wed, 10 Jan 2018 14:20:45 +0000
Subject: Re: [PATCH] netfilter: nf_tables: copy and paste bug in nf_tables_getflowtable()
Message-Id: <20180110142045.4jtqqmmuadcshlhd@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180110094735.zyfdsonrb76x7cd6@mwanda>
In-Reply-To: <20180110094735.zyfdsonrb76x7cd6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

On Wed, Jan 10, 2018 at 12:47:35PM +0300, Dan Carpenter wrote:
> We should be testing "flowtable" instead of "table".

Your robot was too late, sorry :)

I'm taking the patch from Wei Yongjun.

Thank you.
