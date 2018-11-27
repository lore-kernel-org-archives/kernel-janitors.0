From: Florian Westphal <fw@strlen.de>
Date: Tue, 27 Nov 2018 10:38:16 +0000
Subject: Re: [bug report] xfrm: policy: store inexact policies in a tree ordered by destination address
Message-Id: <20181127103816.bvg4sowo262bt56o@breakpoint.cc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181127103307.pmzdnge75333wfby@kili.mountain>
In-Reply-To: <20181127103307.pmzdnge75333wfby@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Hello Florian Westphal,
> 
> The patch 9cf545ebd591: "xfrm: policy: store inexact policies in a
> tree ordered by destination address" from Nov 7, 2018, leads to the
> following static checker warning:
> 
> 	net/xfrm/xfrm_policy.c:1316 xfrm_hash_rebuild()
> 	warn: 'dir' is out of bounds '3' vs '2'

Right, thanks for reporting, I'll send a fix.
