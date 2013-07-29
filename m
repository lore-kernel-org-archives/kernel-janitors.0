From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 29 Jul 2013 11:10:06 +0000
Subject: Re: Updated FarSync driver
Message-Id: <20130729111006.GE5053@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD5E2@SOLO.hq.farsitecommunications.com>
In-Reply-To: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD5E2@SOLO.hq.farsitecommunications.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

So the main and worst news that I have is that this patch is going
to need to be broken up into about 10-20 little patches that each do
one thing and have description of what they are doing.  The kernel
still has to compile and work correctly after each little patch is
applied (we call that bisectability because it helps "git bisect" to
work).

I know that breaking the patch up into tons of little patches is a
lot of work.  Also you should know that I don't maintain any network
drivers so if you want you could try sending a huge patch and maybe
they will apply it, but probably there is no way.  Anyway, sorry to
be the bearer of bad news here.

> The drivers have been derived from a version that we distribute
> with our cards and these drivers were originally written to
> support all known kernel versions.

Obviously, it's important for hardware vendors to care about
supporting older code, but for the mainline kernel we don't care
about that.  We do have linux-backports-modules (have you looked at
this?  It's the modern way of supporting new hardware with old
kernels.)  Anyway, I haven't looked through the code enough to say
how much is compat layers for older kernels, it's just that I don't
want you to be surprised if the compat code is not accepted.

Next, the format of the patch needs to be something which "git am"
can apply automatically.  The subject needs to be:
[patch 1/xx] farsync: blah blah blah.
There needs to be a patch description and a signed off by.  The
patch needs to be inline instead of as an attachment.  Verify that
it applies correctly before you send it to the list.  Email it to
yourself, save the raw email as text, cat it to "git am".

There are a lot of scripts/checkpatch.pl warnings which will all
need to be fixed.
total: 692 errors, 907 warnings, 17158 lines checked
These are trivial formatting things so they are easy to fix.

I will look through the diff as well and see if I spot anything
obvious.  I'm not a networking guy so I will miss a lot of things.

regards,
dan carpenter

