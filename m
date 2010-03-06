From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Mar 2010 10:59:34 +0000
Subject: [patch] dynamic_debug: small clean up in ddebug_proc_write()
Message-Id: <20100306105934.GA4958@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Baron <jbaron@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Greg Banks <gnb@melbourne.sgi.com>, =?iso-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This the doesn't change behavior at all.  In the original code, if nwords
was zero then ddebug_parse_query() would return -EINVAL, now we just do 
it earlier.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f935029..4482f9d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -455,7 +455,7 @@ static ssize_t ddebug_proc_write(struct file *file, const char __user *ubuf,
 			__func__, (int)len);
 
 	nwords = ddebug_tokenize(tmpbuf, words, MAXWORDS);
-	if (nwords < 0)
+	if (nwords <= 0)
 		return -EINVAL;
 	if (ddebug_parse_query(words, nwords-1, &query))
 		return -EINVAL;
