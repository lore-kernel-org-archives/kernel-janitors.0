From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 05 Aug 2013 17:05:45 +0000
Subject: Re: [PATCH] trivial: adjust code alignment
Message-Id: <20130805170544.GO5102@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375714059-29567-1-git-send-email-Julia.Lawall@lip6.fr>
 <1375714059-29567-5-git-send-email-Julia.Lawall@lip6.fr>
 <20130805160645.GI5051@mwanda>
 <alpine.DEB.2.02.1308051810360.2134@hadrien>
 <51FFD1CB.4080907@bfs.de>
In-Reply-To: <51FFD1CB.4080907@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Julia Lawall <julia.lawall@lip6.fr>, trivial@kernel.org, kernel-janitors@vger.kernel.org, corbet@lwn.net, m.chehab@samsung.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 05, 2013 at 06:24:43PM +0200, walter harms wrote:
> Hello Julia,
> 
> IMHO keep the patch as it is.
> It does not change any code that is good.
> Suspicious code that comes up here can be addressed
> in a separate patch.
> 

Gar... No, if we silence static checker warnings without fixing the
bug then we are hiding real problems and making them more difficult
to find.

Just drop this chunk.

regards,
dan carpenter

