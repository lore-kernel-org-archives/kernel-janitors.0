From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Oct 2010 03:54:49 +0000
Subject: Re: [PATCH 8/14] drivers/platform/x86/thinkpad_acpi.c: delete
Message-Id: <20101027035449.GB6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk> <1288088743-3725-9-git-send-email-julia@diku.dk> <20101027010908.GA29299@khazad-dum.debian.net>
In-Reply-To: <20101027010908.GA29299@khazad-dum.debian.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Julia Lawall <julia@diku.dk>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, kernel-janitors@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 26, 2010 at 11:09:08PM -0200, Henrique de Moraes Holschuh wrote:
> On Tue, 26 Oct 2010, Julia Lawall wrote:
> > From: Julia Lawall <julia@diku.dk>
> > 
> > Delete successive assignments to the same location.
> 
> There are often results of mismerges or other assorted screw ups, often
> done by the maintainer itself (e.g. me in thinkpad-acpi's case) during
> development.
> 
> The patch is correct, and I thank you for the head's up.  But let me
> track down what caused it first, hmm?  I also highly recommend that this
> should be done in all cases you find, instead of just blindly fixing the
> assignment.

I've reviewed the entire patchset per your suggestion and Julia
obviously didn't do it blindly.  It all looks good.  The patcheset fixes
a number of bugs.

regards,
dan carpenter

