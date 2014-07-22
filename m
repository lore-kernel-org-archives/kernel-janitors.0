From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Jul 2014 07:47:21 +0000
Subject: Re: [PATCH 4/5] kernel/debug/kdb/kdb_bp.c: drop negativity check on unsigned value
Message-Id: <20140722074721.GM25880@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405697692-23816-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405697692-23816-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net, dcb314@hotmail.com, jason.wessel@windriver.com

On Fri, Jul 18, 2014 at 06:34:52PM +0300, Andrey Utkin wrote:
>  static char *kdb_bptype(kdb_bp_t *bp)
>  {
> -	if (bp->bp_type < 0 || bp->bp_type > 4)
> +	if (bp->bp_type > 4)
>  		return "";

With Smatch, I ignore negative checks in this format.  It's obvious what
the intent is and they are harmless.  Patching them requires a little
review to make sure that someone isn't introducing a bug and can't be
done directly in the email client.

On the other hand, in Smatch I do complain about checks like:

	if (bp->bp_type > 4 || bp->bp_type < 0)

Because only backwards thinking people write checks like that.

regards,
dan carpenter

