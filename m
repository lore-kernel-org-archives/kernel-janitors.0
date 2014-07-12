From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 12 Jul 2014 01:39:27 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <20140712013927.GA30781@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
In-Reply-To: <1405128087.6751.12.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Fri, Jul 11, 2014 at 06:21:27PM -0700, Joe Perches wrote:
> A simple script to run checkpatch --fix for various types of
> of cleanups.
> 
> This script is useful primarily for staging.
> 
> This reformats code to a more CodingStyle conforming style,
> compiles it, verifies that the object code hasn't changed,
> and git commits it too.
> 
> You must have the necessary development tools, git, and a
> recent git tree.  Ideally use Greg KH's staging-next, which
> can be retrieved via these commands:
> 
> git clone git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> git checkout staging-next
> 
> To use this script try a sequence of commands like:
> 
> 	cd <linux_repository>
> 	git checkout -b <your_branch>
> 	make allyesconfig
> 	mkdir patches
> 	./scripts/reformat_with_checkpatch.sh drivers/staging/<dir>/*.[ch]
> 	git format-patch --cover-letter -o patches/<your_branch> staging-next
> 	git send-email patches/<your_branch>
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  scripts/reformat_with_checkpatch.sh | 141 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100755 scripts/reformat_with_checkpatch.sh


No --help option?

How do I run this thing?

I ran it on a file that had no problems and got a mess, all I think due
to something odd in checkpatch itself right now:

$ ./scripts/checkpatch.pl --file  drivers/staging/lustre/include/linux/lnet/api.h 
Useless use of greediness modifier '+' in regex; marked by <-- HERE in m/(^\+.*) {8,8}+ <-- HERE \t/ at ./scripts/checkpatch.pl line 2217.
total: 0 errors, 0 warnings, 220 lines checked

What's with that 'Useless use..." error?  perl 5.20 in use, is that the issue?

Anyway, running this script on the file gave me this:

$ ./reformat_with_checkpatch  drivers/staging/lustre/include/linux/lnet/api.h 
file: <drivers/staging/lustre/include/linux/lnet/api.h> description: <whitespace neatening> types:<spacing,space_before_tab,pointer_location,trailing_whitespace,bracket_space>
Useless use of greediness modifier '+' in regex; marked by <-- HERE in m/(^\+.*) {8,8}+ <-- HERE \t/ at ./scripts/checkpatch.pl line 2217.
total: 0 errors, 0 warnings, 0 checks, 220 lines checked

NOTE: Used message types: BRACKET_SPACE POINTER_LOCATION SPACE_BEFORE_TAB SPACING TRAILING_WHITESPACE

drivers/staging/lustre/include/linux/lnet/api.h has no obvious style problems and is ready for submission.
file: <drivers/staging/lustre/include/linux/lnet/api.h> description: <remove spaces before tabs> types:<space_before_tab>
Useless use of greediness modifier '+' in regex; marked by <-- HERE in m/(^\+.*) {8,8}+ <-- HERE \t/ at ./scripts/checkpatch.pl line 2217.
total: 0 errors, 0 warnings, 0 checks, 220 lines checked

NOTE: Used message types: SPACE_BEFORE_TAB

drivers/staging/lustre/include/linux/lnet/api.h has no obvious style problems and is ready for submission.
file: <drivers/staging/lustre/include/linux/lnet/api.h> description: <fix label positions> types:<indented_label>
Useless use of greediness modifier '+' in regex; marked by <-- HERE in m/(^\+.*) {8,8}+ <-- HERE \t/ at ./scripts/checkpatch.pl line 2217.
total: 0 errors, 0 warnings, 0 checks, 220 lines checked

NOTE: Used message types: INDENTED_LABEL

drivers/staging/lustre/include/linux/lnet/api.h has no obvious style problems and is ready for submission.
file: <drivers/staging/lustre/include/linux/lnet/api.h> description: <align arguments to parenthesis> types:<parenthesis_alignment>
Useless use of greediness modifier '+' in regex; marked by <-- HERE in m/(^\+.*) {8,8}+ <-- HERE \t/ at ./scripts/checkpatch.pl line 2217.
total: 0 errors, 0 warnings, 0 checks, 220 lines checked

NOTE: Used message types: PARENTHESIS_ALIGNMENT

drivers/staging/lustre/include/linux/lnet/api.h has no obvious style problems and is ready for submission.
file: <drivers/staging/lustre/include/linux/lnet/api.h> description: <fix brace positions> types:<open_brace,braces,else_after_brace,while_after_brace>
Useless use of greediness modifier '+' in regex; marked by <-- HERE in m/(^\+.*) {8,8}+ <-- HERE \t/ at ./scripts/checkpatch.pl line 2217.
total: 0 errors, 0 warnings, 0 checks, 220 lines checked

NOTE: Used message types: BRACES ELSE_AFTER_BRACE OPEN_BRACE WHILE_AFTER_BRACE

drivers/staging/lustre/include/linux/lnet/api.h has no obvious style problems and is ready for submission.
file: <drivers/staging/lustre/include/linux/lnet/api.h> description: <fix blank lines> types:<line_spacing>
Useless use of greediness modifier '+' in regex; marked by <-- HERE in m/(^\+.*) {8,8}+ <-- HERE \t/ at ./scripts/checkpatch.pl line 2217.
total: 0 errors, 0 warnings, 0 checks, 220 lines checked

NOTE: Used message types: LINE_SPACING

drivers/staging/lustre/include/linux/lnet/api.h has no obvious style problems and is ready for submission.
file: <drivers/staging/lustre/include/linux/lnet/api.h> description: <use standard attributes> types:<prefer_packed,prefer_aligned>
Useless use of greediness modifier '+' in regex; marked by <-- HERE in m/(^\+.*) {8,8}+ <-- HERE \t/ at ./scripts/checkpatch.pl line 2217.
total: 0 errors, 0 warnings, 0 checks, 220 lines checked

NOTE: Used message types: PREFER_ALIGNED PREFER_PACKED

drivers/staging/lustre/include/linux/lnet/api.h has no obvious style problems and is ready for submission.
file: <drivers/staging/lustre/include/linux/lnet/api.h> description: <remove unnecessary externs> types:<avoid_externs>
Useless use of greediness modifier '+' in regex; marked by <-- HERE in m/(^\+.*) {8,8}+ <-- HERE \t/ at ./scripts/checkpatch.pl line 2217.
total: 0 errors, 0 warnings, 0 checks, 220 lines checked

NOTE: Used message types: AVOID_EXTERNS

drivers/staging/lustre/include/linux/lnet/api.h has no obvious style problems and is ready for submission.
file: <drivers/staging/lustre/include/linux/lnet/api.h> description: <update c90 comment style> types:<c99_comments>
Useless use of greediness modifier '+' in regex; marked by <-- HERE in m/(^\+.*) {8,8}+ <-- HERE \t/ at ./scripts/checkpatch.pl line 2217.
total: 0 errors, 0 warnings, 0 checks, 220 lines checked

NOTE: Used message types: C99_COMMENTS

drivers/staging/lustre/include/linux/lnet/api.h has no obvious style problems and is ready for submission.


Is that expected?

thanks,

greg k-h
