From: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>
Date: Wed, 29 Jul 2009 01:02:21 +0000
Subject: Re: [PATCH 6/12] drivers/platform/x86: Correct redundant test
Message-Id: <200907290050.n6T0oL0o024740@mercury.physics.adelaide.edu.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4A6F3AEA.7090102@grupopie.com>
In-Reply-To: <4A6F3AEA.7090102@grupopie.com> from "Paulo Marques" at Jul 28, 2009 06:52:42 PM
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paulo Marques <pmarques@grupopie.com>
Cc: Julia Lawall <julia@diku.dk>, jwoithe@physics.adelaide.edu.au, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi guys

> Julia Lawall wrote:
> > [...]
> > ---
> >  drivers/platform/x86/fujitsu-laptop.c          |    3 ---
> >  1 files changed, 0 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> > index 218b9a1..5306901 100644
> > --- a/drivers/platform/x86/fujitsu-laptop.c
> > +++ b/drivers/platform/x86/fujitsu-laptop.c
> > @@ -745,9 +745,6 @@ static int acpi_fujitsu_remove(struct acpi_device *device, int type)
> >  
> >  	fujitsu = acpi_driver_data(device);
> >  
> > -	if (!device || !acpi_driver_data(device))
> > -		return -EINVAL;
> > -
> 
> Shouldn't this still do a:
> 
>    if (!fujitsu)
>      return -EINVAL;
> 
> to avoid dereferencing a NULL pointer below?

Hmm, yes it should.  Well spotted.  And I'm not certain how the duplicate
test on "device" got in there in the first place.  I suspect it came about
due to some structural changes made a few versions ago and I failed to
notice that the second check became redundant.

So, combining this with the above patch we should instead do

Signed-off-by: jwoithe@physics.adelaide.edu.au <Jonathan Woithe>

--- a/drivers/platform/x86/fujitsu-laptop.c	2009-06-12 19:51:45.333234000 +0930
+++ b/drivers/platform/x86/fujitsu-laptop.c	2009-07-29 10:14:30.610249941 +0930
@@ -745,7 +745,7 @@ static int acpi_fujitsu_remove(struct ac
 
 	fujitsu = acpi_driver_data(device);
 
-	if (!device || !acpi_driver_data(device))
+	if (!fujitsu)
 		return -EINVAL;
 
 	fujitsu->acpi_handle = NULL;

Regards
  jonathan
