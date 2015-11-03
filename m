From: "Simmons, James A." <simmonsja@ornl.gov>
Date: Tue, 03 Nov 2015 22:38:15 +0000
Subject: RE: [patch] staging: lustre: remove unused variable
Message-Id: <e882e5418520468ea1597a1719954b8b@EXCHCS32.ornl.gov>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151103221616.GD19280@mwanda>
In-Reply-To: <20151103221616.GD19280@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lustre-devel@lists.lustre.org


>The "->lr_lvb_data" struct member is never used.  Delete it.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
>I have compile tested this.  I looked through the history and it seems
>to never have been used.  I wonder if we can remove the locking as well.

This is used by the quota and ofd layer which are both server side. 
