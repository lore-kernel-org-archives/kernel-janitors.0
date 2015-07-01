From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Jul 2015 14:31:32 +0000
Subject: Re: [PATCH v2 3/3] Staging: android: uapi: Fix coding style typedef issue
Message-Id: <20150701143132.GZ28762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5593EDBF.6010008@zoho.com>
 <5593EF8E.9020002@zoho.com>
In-Reply-To: <5593EF8E.9020002@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sohny Thomas <sohnythomas@zoho.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, riandrews@android.com, sumit.semwal@linaro.org, carlos@cgarcia.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jul 01, 2015 at 07:17:58PM +0530, Sohny Thomas wrote:
> 
> As per checkpatch.pl remove unnecessary typedef
> Here ion_user_handle_t was used only in the header .
> 
> Signed-of-by: Sohny Thomas <sohnythomas@zoho.com>

The original code was correct.  Checkpatch.pl is not the king of the
world, which you must obey or die.  It is just a perl script.

regards,
dan carpenter

