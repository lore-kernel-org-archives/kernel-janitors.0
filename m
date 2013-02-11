From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Feb 2013 07:14:32 +0000
Subject: Smatch 1.58 released
Message-Id: <20130211071432.GM4937@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, smatch@vger.kernel.org

Smatch is a C static analysis tool, but with a lot of kernel
specific checks.

The big thing in this release is that the type information has now
been pushed to the lowest levels.  It broke a bunch of stuff
including to compiles on older versions of GCC but Emil Tantilov
fixed that (thanks!).  It should be Ok now.

Other changes are that the cross function tracking has been
improved (this requires the database).  There is a new check for
sprintf() overflows.

The way to use Smatch is:

	git clone git://repo.or.cz/smatch.git
	cd smatch
	make
	cd ~/path/to/kernel

	[ This next step is optional if you want to build the
	  database.  If you build it several times the database
  	  becomes more complete. ]
  	~/path/to/smatch/smatch_scripts/build_kernel_data.sh

	~/path/to/smatch/smatch_scripts/test_kernel.sh

It creates warns.txt file with all the warnings.  Or alternatively
if you just want to check one file then the command is:

	~/progs/smatch/devel/smatch_scripts/kchecker drivers/file.c

regards,
dan carpenter
