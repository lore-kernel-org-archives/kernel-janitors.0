From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Feb 2017 12:17:03 +0000
Subject: [bug report] rhashtable: Add nested tables
Message-Id: <20170216121703.GA26276@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Herbert Xu,

This is a semi-automatic email about new static checker warnings.

The patch 40137906c5f5: "rhashtable: Add nested tables" from Feb 11, 
2017, leads to the following Smatch complaint:

lib/rhashtable.c:149 bucket_table_free()
	 warn: variable dereferenced before check 'tbl' (see line 146)

lib/rhashtable.c
   145	{
   146		if (tbl->nest)
                    ^^^^^^^^^
New unchecked dereference.

   147			nested_bucket_table_free(tbl);
   148	
   149		if (tbl)
                    ^^^
Old code checked for NULL.

   150			kvfree(tbl->locks);
   151	

regards,
dan carpenter
