From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Feb 2019 14:23:43 +0000
Subject: Re: [PATCH v3] net: ns83820: code cleanup for ns83820_probe_phy()
Message-Id: <20190219142343.GI17104@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <715767253.151509.1550580124264@ox-groupware.bfs.de>
In-Reply-To: <715767253.151509.1550580124264@ox-groupware.bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Mao Wenan <maowenan@huawei.com>, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, john.fastabend@gmail.com, hawk@kernel.org, jakub.kicinski@netronome.com, daniel@iogearbox.net, ast@kernel.org, julia.lawall@lip6.fr

On Tue, Feb 19, 2019 at 01:42:03PM +0100, Walter Harms wrote:
> 
> Am 19.02.2019 10:06, schrieb Mao Wenan:
> > -
> >  	for (i=1; i<2; i++) {
> 
> 
> the loop here seems also pointless, so you can eliminate i.
> (or did i muss something ?)
> 

True.  But please do it in a separate patch.

regards,
dan carpenter
