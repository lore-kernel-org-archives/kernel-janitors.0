From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jul 2018 06:50:59 +0000
Subject: Re: [bug report] nds32: Loadable modules
Message-Id: <20180713065059.ezm27dyesfzuh4ev@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180712124159.h7kqf2hamut2idhd@kili.mountain>
In-Reply-To: <20180712124159.h7kqf2hamut2idhd@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 13, 2018 at 02:03:52PM +0800, Greentime Hu wrote:
> Hi Dan,
> 
> You are right. We should use ~loc_mask. Thank you for finding it.
> Would you like to sent a patch for this or should I just create one
> patch with your signed-off-by?

Signed-off-by means I sign a legal document saying I didn't steal Darl
McBride's precious SCO codes...  It's not the right thing for someone
else to sign.  But could you give me a reported by tag?

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
