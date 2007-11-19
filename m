From: David Ronis <ronis@ronispc.chem.mcgill.ca>
Date: Mon, 19 Nov 2007 16:19:00 +0000
Subject: 2.6.23.1->2.6.23.8 breaks root Makefile
Message-Id: <1195489140.21337.10.camel@ronispc.chem.mcgill.ca>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi

The current main Makefile incorrectly identified my ld as one that
supports --build-id (it didn't).  The problem is fixed by upgrading to
the latest binutils, version 2.18, which does, but somehow  I suspect
that this wasn't what was intended.  For what it's worth, I was running
with slackware's binutils-2.17.50.0.17.

David

