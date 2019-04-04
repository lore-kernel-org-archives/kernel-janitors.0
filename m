From: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 04 Apr 2019 19:10:44 +0000
Subject: Re: [PATCH 1/2] fsl_hypervisor: dereferencing error pointers in ioctl
Message-Id: <20190404121044.a38ba5895a485abcdc57f297@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181218082003.GD32567@kadam>
In-Reply-To: <20181218082003.GD32567@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Timur Tabi <timur@freescale.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mihai Caraman <mihai.caraman@freescale.com>, Kumar Gala <galak@kernel.crashing.org>

On Tue, 18 Dec 2018 11:20:03 +0300 Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The strndup_user() function returns error pointers on error, and then
> in the error handling we pass the error pointers to kfree().  It will
> cause an Oops.
> 

Looks good to me.

I guess we should fix this too?


From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm/util.c: fix strndup_user() comment

The kerneldoc misdescribes strndup_user()'s return value.

Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Timur Tabi <timur@freescale.com>
Cc: Mihai Caraman <mihai.caraman@freescale.com>
Cc: Kumar Gala <galak@kernel.crashing.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/util.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/mm/util.c~mm-utilc-fix-strndup_user-comment
+++ a/mm/util.c
@@ -204,7 +204,7 @@ EXPORT_SYMBOL(vmemdup_user);
  * @s: The string to duplicate
  * @n: Maximum number of bytes to copy, including the trailing NUL.
  *
- * Return: newly allocated copy of @s or %NULL in case of error
+ * Return: newly allocated copy of @s or an ERR_PTR() in case of error
  */
 char *strndup_user(const char __user *s, long n)
 {
_
