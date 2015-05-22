From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 May 2015 10:49:46 +0000
Subject: Re: [PATCH v4 11/13] staging: lnet: o2iblnd: checkpatch.pl fixes
Message-Id: <20150522104946.GK4150@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
 <1432237849-53947-12-git-send-email-shuey@purdue.edu>
In-Reply-To: <1432237849-53947-12-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Shuey <shuey@purdue.edu>
Cc: oleg.drokin@intel.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org

On Thu, May 21, 2015 at 03:50:34PM -0400, Mike Shuey wrote:
> @@ -2758,7 +2763,7 @@ void kiblnd_shutdown(lnet_ni_t *ni)
>  		i = 2;
>  		while (atomic_read(&net->ibn_npeers) != 0) {
>  			i++;
> -			CDEBUG(((i & (-i)) = i) ? D_WARNING : D_NET, /* 2**n? */
> +			CDEBUG(((i & (-i)) = i) ? D_WARNING : D_NET,/* 2**n? */

The original was better.  I don't like this patch for the same reasons
that people complained about patch 10.  It does too many things as well.

regards,
dan carpenter

