From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Sat, 25 Feb 2017 14:38:11 +0000
Subject: Re: [bug report] rhashtable: Add nested tables
Message-Id: <20170225143811.GA28272@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170216121703.GA26276@mwanda>
In-Reply-To: <20170216121703.GA26276@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, Thomas Graf <tgraf@suug.ch>

On Thu, Feb 16, 2017 at 03:17:03PM +0300, Dan Carpenter wrote:
> Hello Herbert Xu,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 40137906c5f5: "rhashtable: Add nested tables" from Feb 11, 
> 2017, leads to the following Smatch complaint:
> 
> lib/rhashtable.c:149 bucket_table_free()
> 	 warn: variable dereferenced before check 'tbl' (see line 146)
> 
> lib/rhashtable.c
>    145	{
>    146		if (tbl->nest)
>                     ^^^^^^^^^
> New unchecked dereference.
> 
>    147			nested_bucket_table_free(tbl);
>    148	
>    149		if (tbl)
>                     ^^^
> Old code checked for NULL.
> 
>    150			kvfree(tbl->locks);
>    151	

Thanks for catching this.  I checked all the callers and none
of them can provide a NULL pointer so let's just kill the check.

---8<---
Subject: rhashtable: Fix use before NULL check in bucket_table_free

Dan Carpenter reported a use before NULL check bug in the function
bucket_table_free.  In fact we don't need the NULL check at all as
no caller can provide a NULL argument.  So this patch fixes this by
simply removing it.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 lib/rhashtable.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/rhashtable.c b/lib/rhashtable.c
index 172454e..fac1a78 100644
--- a/lib/rhashtable.c
+++ b/lib/rhashtable.c
@@ -146,9 +146,7 @@ static void bucket_table_free(const struct bucket_table *tbl)
 	if (tbl->nest)
 		nested_bucket_table_free(tbl);
 
-	if (tbl)
-		kvfree(tbl->locks);
-
+	kvfree(tbl->locks);
 	kvfree(tbl);
 }
 
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
