From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 28 Aug 2014 12:29:51 +0000
Subject: Re: [PATCH] staging: lustre: mdc: expand the GOTO macro
Message-Id: <alpine.DEB.2.10.1408281427590.4009@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1409220635-13453-1-git-send-email-Julia.Lawall@lip6.fr> <20140828122641.GM5046@mwanda>
In-Reply-To: <20140828122641.GM5046@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, "Dilger, Andreas" <andreas.dilger@intel.com>, Peng Tao <bergwolf@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Drokin, Oleg" <oleg.drokin@intel.com>



On Thu, 28 Aug 2014, Dan Carpenter wrote:

> Thanks.  These are nice.  We need to get rid of the GOTO() macro
> entirely.

I will.  The whole patch is 11,000 lines (including the context code, @@s
etc), and I didn't have the patience to check all of that at once...

julia
