From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 18 Jul 2015 11:30:43 +0000
Subject: Re: [PATCH v3 ] Staging: Android: Fixes for TODO file
Message-Id: <alpine.DEB.2.02.1507181330070.2042@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55940BF7.8020104@zoho.com>
In-Reply-To: <55940BF7.8020104@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 18 Jul 2015, Sohny Thomas wrote:

> 
> 
> On Wednesday 15 July 2015 04:20 AM, Greg KH wrote:
> > On Wed, Jul 01, 2015 at 09:19:11PM +0530, Sohny Thomas wrote:
> >> Removed non-existent issue from TODO file
> >> No instance of kuid_t or uid_t as mentioned by the file is present in staging/android directory
> >>
> >> Signed-off-by: Sohny Thomas <sohnythomas@zoho.com>
> >> ---
> >>  drivers/staging/android/TODO | 7 -------
> >>  1 file changed, 7 deletions(-)
> >>
> >> diff --git a/drivers/staging/android/TODO b/drivers/staging/android/TODO
> >> index 06954cd..b15fb0d 100644
> >> --- a/drivers/staging/android/TODO
> >> +++ b/drivers/staging/android/TODO
> >> @@ -5,13 +5,6 @@ TODO:
> >>         - make sure things build as modules properly
> >>         - add proper arch dependencies as needed
> >>         - audit userspace interfaces to make sure they are sane
> >> -       - kuid_t should never be exposed to user space as it is
> >> -          kernel internal type. Data structure for this kuid_t is:
> >> -          typedef struct {
> >> -               uid_t val;
> >> -          } kuid_t;
> >> -       - This bug is introduced by Xiong Zhou in the patch bd471258f2e09
> >> -       - ("staging: android: logger: use kuid_t instead of uid_t")
> >>
> >>  Please send patches to Greg Kroah-Hartman <greg@kroah.com> and Cc:
> >>  Brian Swetland <swetland@google.com>
> > 
> > Doesn't apply to the tree :(
> Uh, Sorry to reply late, you mean this snippet is not part of the tree?

It means something has changed in the code you have modified, and you need 
to redo the patch in some way so that it applies to the latest version.

julia
