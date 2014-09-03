From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Sep 2014 09:57:42 +0000
Subject: re: target: target_core_transport.c: Cleaning up missing null-terminate in conjunction with strncpy
Message-Id: <20140903095742.GA5058@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rickard_strandqvist@spectrumdigital.se, Nicholas Bellinger <nab@linux-iscsi.org>
Cc: target-devel@vger.kernel.org, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The patch 6cfa853ceee4: "target: target_core_transport.c: Cleaning up
missing null-terminate in conjunction with strncpy" from Aug 3, 2014,
leads to the following static checker warning:

	drivers/target/target_core_transport.c:956 transport_dump_vpd_ident_type()
	error: potentially dereferencing uninitialized 'len'.

drivers/target/target_core_transport.c
   955          default:
   956                  len = strlen(len);
                        ^^^^^^^^^^^^^^^^^

This was obviously supposed to be strlen(buf) and no one compile tested
it...  But the patch is called "missing null-terminate" when actually
the original code was fine as far as I can see.

Apparently, as a safety measure we're trying to replace every strncpy()
with:

	strncpy(foo, bar, sizeof(foo));
	foo[sizeof(foo) - 1] = '\0';

We should have a function for this.  We used to use strlcpy() but people
complained that it could read beyond the end of the src string.  Also it
doesn't pad the string with zeros.  So now we're open coding NUL
terminators everywhere so the code is easier to audit.

That sucks and makes the code messier.

Rickard, please, let's find a cleaner way to do this.

regards,
dan carpenter
