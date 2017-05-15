From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 May 2017 10:27:27 +0000
Subject: Re: [PATCH 2/2] staging/atomisp: putting NULs in the wrong place
Message-Id: <20170515102727.fv34r6kgkdcv7lqk@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170515100135.guvreypnckqolnrq@mwanda>
 <59198139.9030405@bfs.de>
In-Reply-To: <59198139.9030405@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Cox <alan@linux.intel.com>, David Binderman <dcb314@hotmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

On Mon, May 15, 2017 at 12:21:45PM +0200, walter harms wrote:
> can this strcpy_s() replaced with strlcpy ?
> 

These functions obviously should be removed, yes.  Please send a patch
for that and we can drop my patches.  Give David reported-by credit.

regards,
dan carpenter

