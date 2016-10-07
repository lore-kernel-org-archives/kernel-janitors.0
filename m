From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 07 Oct 2016 08:37:17 +0000
Subject: Re: md-cluster: Delete unnecessary braces in unlock_all_bitmaps()
Message-Id: <9e1de37a-d98d-c885-b4ff-5a8b2aa1f7a8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3a03df66-92ce-20fb-17f3-fb79b9d43c8e@users.sourceforge.net>
 <ba60b210-40c6-b021-780c-33ecea7bee9e@users.sourceforge.net>
 <20161007074646.GA6039@mwanda>
In-Reply-To: <20161007074646.GA6039@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-raid@vger.kernel.org, Guoqing Jiang <gqjiang@suse.com>, Shaohua Li <shli@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> Do not use curly brackets at one source code place
>> where a single statement should be sufficient.
> 
> The original style was correct and this is wrong.  I have explained this before.

Did I change a bit too much in the proposed step according to the following
update suggestion?

elfring@Sonne:~/Projekte/Linux/next-patched> git checkout d6385db94196b253ae5eb3678fa95cdf1f839fcc && scripts/checkpatch.pl --types BRACES -f drivers/md/md-cluster.c
…
WARNING: braces {} are not necessary for single statement blocks
#1228: FILE: drivers/md/md-cluster.c:1228:
+			if (cinfo->other_bitmap_lockres[i]) {
+				lockres_free(cinfo->other_bitmap_lockres[i]);
+			}
…


How do you think about to adjust this source code place a bit?

Regards,
Markus
