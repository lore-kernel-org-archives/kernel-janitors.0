From: walter harms <wharms@bfs.de>
Date: Wed, 27 Oct 2010 07:18:16 +0000
Subject: Re: [PATCH 8/14] drivers/platform/x86/thinkpad_acpi.c: delete double
Message-Id: <4CC7D238.9010903@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk> <1288088743-3725-9-git-send-email-julia@diku.dk> <20101027010908.GA29299@khazad-dum.debian.net>
In-Reply-To: <20101027010908.GA29299@khazad-dum.debian.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Henrique de Moraes Holschuh schrieb:
> On Tue, 26 Oct 2010, Julia Lawall wrote:
>> From: Julia Lawall <julia@diku.dk>
>>
>> Delete successive assignments to the same location.
> 
> There are often results of mismerges or other assorted screw ups, often
> done by the maintainer itself (e.g. me in thinkpad-acpi's case) during
> development.
> 
> The patch is correct, and I thank you for the head's up.  But let me
> track down what caused it first, hmm?  I also highly recommend that this
> should be done in all cases you find, instead of just blindly fixing the
> assignment.  I suggest using git --blame to track down what added the
> duplicated assignments, and check if it looks sane...
> 
> It is often a VERY BAD IDEA to remove such markers of potential
> brokennes without checking out if they're actually helpfully trying to
> warn you of worse badness :p
> 
> But hey, maybe you've already done that.  If you did, I apologise for
> preaching to the choir.
> 

IMHO that goes beyond what to expect from a kernel janitor. They try to
identify minor problems like double inits; why they occur is part of the
"maintainer job". The people (should) have much better understand of the
code and can identify omissions in there work flow much more easy. To be
fair some problems are hard to identify/fix but you can not move that to
the janitor.

just my 2 cents,
 wh
