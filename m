From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 Aug 2017 09:46:02 +0000
Subject: [PATCH] lib/cmdline.c: add to the get_options() documentation
Message-Id: <20170821094602.baz6tv2v23sem3kw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ilya Matveychikov <matvejchikov@gmail.com>
Cc: Baoquan He <bhe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I wasn't sure how get_options() worked, so I looked at examples.  And by
sheer chance the first example I picked the only example which uses it
incorrectly...  I've added some comments that hopefully help.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/cmdline.c b/lib/cmdline.c
index 4c0888c4a68d..0eb8d0ab60db 100644
--- a/lib/cmdline.c
+++ b/lib/cmdline.c
@@ -73,14 +73,15 @@ EXPORT_SYMBOL(get_option);
 /**
  *	get_options - Parse a string into a list of integers
  *	@str: String to be parsed
- *	@nints: size of integer array
+ *	@nints: size of integer array (including the extra int at the start)
  *	@ints: integer array
  *
  *	This function parses a string containing a comma-separated
  *	list of integers, a hyphen-separated range of _positive_ integers,
  *	or a combination of both.  The parse halts when the array is
  *	full, or when no more numbers can be retrieved from the
- *	string.
+ *	string.  It stores the number of numbers as the first element in the
+ *	array.
  *
  *	Return value is the character in the string which caused
  *	the parse to end (typically a null terminator, if @str is
