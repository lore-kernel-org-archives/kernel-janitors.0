From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Aug 2013 20:53:02 +0000
Subject: Re: Updated FarSync driver
Message-Id: <20130830205302.GK19256@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD5E2@SOLO.hq.farsitecommunications.com>
In-Reply-To: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD5E2@SOLO.hq.farsitecommunications.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 30, 2013 at 02:50:13PM +0100, Kevin Curtis wrote:
> Hi Dan,
>     I have been working on getting the patches in to shape over the last month, and I think I have something that I hope will be acceptable.  I have reduced the 
> 
> total: 692 errors, 907 warnings
> 
> to
> 
> total: 0 errors, 52 warnings.
> 
> I thought I'd run it by the Janitors one more time before I formally submit it.
> 
> There is now a set of 7 patches.
> 
> 1 for the pci_ids.h file to add our new ids.
> And then 5 files that modify existing files and create new ones.
> And then 1 to update the Kconfig and Makefile.
> 

Much better, but there are still issues.

Anyway, the first trivial thing is that these need to be sent inline as
a patch series.  Everyone has macros to apply patches automatically from
email so these need to be in the normal format for "git am".  Mail them
to yourself.  Save the raw text including headers.
`cat email.txt | git am`.  There are tuturials on how to mail git patch
series online.

Next, also very trivial, is that the patches are in the wrong order so the
compile breaks if I only apply the first two.  That's not allowed.

I help review staging patches so when I see something like
farsync_patch_1 and farsync_patch_2 the patch is supposed to be adding a
feature.  There are a lot of lines which start with '-' in the changelog
and I would question those.  A lot of them are trivial white space
changes.  If this were a staging patch I might ask that the white space
changes be pulled out into a separate patch.  You can do this easily
with "git citool".  Highlight the white space changes and right click
and select "stage lines for commit".

The other thing to be aware of is that we are coming up on a merge
window so it might already be too late to get this merged in the up
coming v3.12 kernel in November so you'll have to target v3.13 in Feb.
Maybe just submit it to the netdev ASAP and see what people say.

I think they will say that you need to reuse normal kernel CRC
functions and FIFO api.  They might say that farsync_patch_1 needs to be
a separate patch for each paragraph in the changelog.  They probably
have other comments as well.

But basically you've reached the end of kernel-janitor review.  :)  Good
luck.

regards,
dan carpenter

