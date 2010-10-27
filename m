From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Date: Wed, 27 Oct 2010 01:09:08 +0000
Subject: Re: [PATCH 8/14] drivers/platform/x86/thinkpad_acpi.c: delete
Message-Id: <20101027010908.GA29299@khazad-dum.debian.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
 <1288088743-3725-9-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-9-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, kernel-janitors@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 26 Oct 2010, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Delete successive assignments to the same location.

There are often results of mismerges or other assorted screw ups, often
done by the maintainer itself (e.g. me in thinkpad-acpi's case) during
development.

The patch is correct, and I thank you for the head's up.  But let me
track down what caused it first, hmm?  I also highly recommend that this
should be done in all cases you find, instead of just blindly fixing the
assignment.  I suggest using git --blame to track down what added the
duplicated assignments, and check if it looks sane...

It is often a VERY BAD IDEA to remove such markers of potential
brokennes without checking out if they're actually helpfully trying to
warn you of worse badness :p

But hey, maybe you've already done that.  If you did, I apologise for
preaching to the choir.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
