From: Joe Perches <joe@perches.com>
Date: Wed, 01 Jul 2015 15:08:05 +0000
Subject: Re: [PATCH v2 3/3] Staging: android: uapi: Fix coding style typedef issue
Message-Id: <1435763285.12101.100.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5593EDBF.6010008@zoho.com> <5593EF8E.9020002@zoho.com>
	 <20150701143132.GZ28762@mwanda>
In-Reply-To: <20150701143132.GZ28762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sohny Thomas <sohnythomas@zoho.com>, gregkh@linuxfoundation.org, arve@android.com, riandrews@android.com, sumit.semwal@linaro.org, carlos@cgarcia.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, 2015-07-01 at 17:31 +0300, Dan Carpenter wrote:
> On Wed, Jul 01, 2015 at 07:17:58PM +0530, Sohny Thomas wrote:
> > 
> > As per checkpatch.pl remove unnecessary typedef
> > Here ion_user_handle_t was used only in the header .
> > 
> > Signed-of-by: Sohny Thomas <sohnythomas@zoho.com>
> 
> The original code was correct.

because the typedef is exposed to user-space. (uapi)

> Checkpatch.pl is not the king of the
> world, which you must obey or die.

As Dan once said, "it's less sentient than a squirrel".

> It is just a perl script.

Don't be a squirrel.
Please engage your brain when using the stupid little tool.


