From: Dan Carpenter <error27@gmail.com>
Date: Wed, 26 May 2010 22:34:17 +0000
Subject: smatch 1.55 released
Message-Id: <20100526223417.GP22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Smatch is a static checker for C.  The core parts basically do flow
analysis and then there are project specific checks as well.  The
website is:  http://smatch.sf.net

To use it do:
	git clone git://repo.or.cz/smatch.git
	cd smatch ; make ; cd /usr/src/kernel
	make CHECK="~/path/to/smatch/smatch -p=kernel" C=1 \
                   bzImage modules | tee warns.txt

Things that have changed since 1.54:
* The array overflow check is now useful.
* There is a new check for precedence bugs caused by macro expansion.
* The checks for null pointer dereferences were rewritten and now have
    fewer false positives.
* Some kernel specific tests were added for kunmap(),
    release_resource(), resource_size(), and mod_timer().

Major Bugs:
* Smatch doesn't handle loops correctly.
* It doesn't do cross function analysis.
* It doesn't understand code like this:
	foo->bar = NULL;
	foo = not_null();
	foo->bar->baz;  // <- Smatch complains about a null dereference.
* Too many false positives generally.

Anyway, please test it out.  :)

regards,
dan carpenter
