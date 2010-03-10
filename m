From: Dan Carpenter <error27@gmail.com>
Date: Wed, 10 Mar 2010 10:12:24 +0000
Subject: smatch_scripts/whitespace_only.sh
Message-Id: <20100310101224.GC6321@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, gregkh@suse.de, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org

I wrote a script to check that a patch only changes white space.
It compiles the files before and after the patch is applied and 
verifies that they are the same.

You'll need to compile smatch:
	git pull git://repo.or.cz/smatch.git
	make
	cd /path/to/kernel/src/
	/path/to/smatch_scripts/whitespace_only.sh <patch>

Adding or removing parenthesis and curly braces counts as a code 
change.  Changes to comments, #if 0, white space changes do not.

You can fix a lot of style violations if you limit yourself to 
adding and removing tabs, spaces and new lines.  Then the next 
patch could remove unneeded parenthesis.  It would be easier to
audit that way instead of everything mixed together.

regards,
dan carpenter

PS.  I feel really bad slagging the newbies trying to help.  
Could we fix checkpatch.pl to not complain about line lengths?
Also could we tell them to stay in staging where no one cares
about git blame?

