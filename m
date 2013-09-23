From: Joe Perches <joe@perches.com>
Date: Mon, 23 Sep 2013 18:06:51 +0000
Subject: Re: checkpatch guide for newbies
Message-Id: <1379959611.3575.40.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130923090100.GE6192@mwanda>
In-Reply-To: <20130923090100.GE6192@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2013-09-23 at 12:01 +0300, Dan Carpenter wrote:
> I've written a checkpatch guide for newbies because it seems like they
> make the same mistakes over and over.  I intend to put it under
> Documentation/.  Could you look it over?
> 
> 
> 		Introduction
> 
> This document is aimed at new kernel contributors using "checkpatch.pl --file".
> 
> The first thing to remember is that the aim is not to get rid of every
> checkpatch.pl warning; the aim is to make the code cleaner and more readable.
> The other thing to remember is that checkpatch.pl is not a very smart tool and
> there are mistakes that it misses so keep your eyes open for those as well.

Maybe suggest using

	checkpatch.pl --file --fix --strict --types=<specific_type> <file>
	mv <file>.EXPERIMENTAL-checkpatch-fixes <file>
	git diff <file>

where <specific_types> is one of

For whitespace only changes
	SPACING
	SPACE_BEFORE_TAB
	POINTER_LOCATION
For code changes:
	C99_COMMENTS
	PREFER_PACKED
	PREFER_ALIGNED
	AVOID_EXTERNS
	PARENTHESIS_ALIGNMENT

> For example, checkpatch.pl could warn about a badly formatted warning message.
> Ask yourself, is the warning message is clear?  Is it needed?  Could a
> non-privileged user trigger the warning and flood the syslog?  Are there
> spelling mistakes?  Since Checkpatch.pl has flagged the line as sloppy code,
> there may be multiple mistakes.
> 
> In the Linux kernel, we take an enormous pride in our work and we want clean
> code.  But the one major drawback to cleanup patches is that they break
> "git blame" so it's not a good idea for newbies to send very trivial cleanup
> patches to the kernel/ directory.  It's better to get a little experience in the
> drivers/ directory first.  The drivers/staging/ directory in particular always
> needs cleanup patches.

I think suggesting working _only_ in the drivers/staging/
directory tree might be better.

Maybe I'll submit some auto-neatening script eventually
and see what you think.

