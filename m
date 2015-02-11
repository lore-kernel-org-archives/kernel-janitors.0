From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Feb 2015 11:30:54 +0000
Subject: Re: [PATCH] fs: btrfs: free-space-cache.c: remove two unnecessary checks before calling kfree()
Message-Id: <54DB3D6E.5000304@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1423646233-16637-1-git-send-email-baspeters93@gmail.com>
In-Reply-To: <1423646233-16637-1-git-send-email-baspeters93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bas Peters <baspeters93@gmail.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.cz>, Josef Bacik <jbacik@fb.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> kfree checks whether the pointer it is passed is NULL. The two foregoing
> checks are therefore unnecessary.
> 
> This issue was detected using Coccinelle.

Would you like to integrate my update suggestion "btrfs: Deletion of
unnecessary checks before six function calls"?
https://lkml.org/lkml/2014/10/31/606
http://article.gmane.org/gmane.linux.kernel/1818924
https://systeme.lip6.fr/pipermail/cocci/2014-October/001321.html

Regards,
Markus

