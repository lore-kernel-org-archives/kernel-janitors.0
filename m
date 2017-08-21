From: Jan Kara <jack@suse.cz>
Date: Mon, 21 Aug 2017 14:11:39 +0000
Subject: Re: [PATCH 3/4] isofs: One check less in isofs_read_inode() after error detection
Message-Id: <20170821141139.GD31870@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ed931e75-f443-6e19-ca56-4c1ad027dc25@users.sourceforge.net>
 <157aa252-0edb-1462-cb6e-44369e8f1645@users.sourceforge.net>
In-Reply-To: <157aa252-0edb-1462-cb6e-44369e8f1645@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Jan Kara <jack@suse.cz>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat 19-08-17 09:18:42, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 19 Aug 2017 08:10:40 +0200
> 
> * Adjust jump targets.
> 
> * Avoid a repeated check for the local variable "bh" after
>   a memory allocation failure in this function.
> 
> * Delete an initialisation for the local variable "ret"
>   which became unnecessary with this refactoring.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

I agree that

fail:
        goto out;

in the original code is awkward and we can get rid of it. However renaming
labels is IMO pointless and

>  	if (bh)
> +release_bh:
>  		brelse(bh);
>  	return ret;

is just disgusting.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
