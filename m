From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sun, 27 Mar 2005 19:31:28 +0000
Subject: Re: [KJ][PATCH] kj-devel.pl - comments
Message-Id: <42470A10.8060904@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200503271134.15777.vicente.feito@gmail.com>
In-Reply-To: <200503271134.15777.vicente.feito@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Vicente Feito wrote:
> Great!
> I'll implement those, I was also thinking on implementing this kind of 
> checking:
> if (p)
>     kfree(p);
> (since kfree deals with null pointers as well)
> 
> I'm not sure because some people think that is more expensive to make the call 
> than the check, arguing between branch prediction vs stack overhead is common 
> in lkml afaik, which one do you think is better?(Other people is free to go 
> here as well:)

That debate is still raging, but it would be OK to check for it
and print a warning IMO.

> I'm thinking on adding checks for intermodule and taskqueues, I don't know how 
> people feel about it but I believe is time to do it, since they are 
> deprecated but still in some places.

If it's deprecated, I agree that a warning should be printed.

Here's another common problem/misuse (from a patch today):

this patch fix 3 calls to module_param_string() in
driver/media/video/tuner-core.c and drivers/media/video/tda9887.c.
In all three places, the len and the perm parameter was switched.

Patch is against 2.6.12-rc1.

Signed-off-by: Bert Wesarg <wesarg@informatik.uni-halle.de>

diff -uprN linux-2.6.12-rc1.orig/drivers/media/video/tda9887.c 
linux-2.6.12-rc1/drivers/media/video/tda9887.c
--- linux-2.6.12-rc1.orig/drivers/media/video/tda9887.c	2005-03-27 
14:44:23.000000000 +0200
+++ linux-2.6.12-rc1/drivers/media/video/tda9887.c	2005-03-27 
14:48:06.000000000 +0200
@@ -478,9 +478,9 @@ static int tda9887_set_pinnacle(struct t
  /* 
---------------------------------------------------------------------- */

  static char pal[] = "-";
-module_param_string(pal, pal, 0644, sizeof(pal));
+module_param_string(pal, pal, sizeof(pal), 0644);
  static char secam[] = "-";
-module_param_string(secam, secam, 0644, sizeof(secam));
+module_param_string(secam, secam, sizeof(secam), 0644);

  static int tda9887_fixup_std(struct tda9887 *t)
  {
diff -uprN linux-2.6.12-rc1.orig/drivers/media/video/tuner-core.c 
linux-2.6.12-rc1/drivers/media/video/tuner-core.c
--- linux-2.6.12-rc1.orig/drivers/media/video/tuner-core.c	2005-03-27 
14:44:23.000000000 +0200
+++ linux-2.6.12-rc1/drivers/media/video/tuner-core.c	2005-03-27 
14:47:17.000000000 +0200
@@ -162,7 +162,7 @@ static void set_type(struct i2c_client *
  }

  static char pal[] = "-";
-module_param_string(pal, pal, 0644, sizeof(pal));
+module_param_string(pal, pal, sizeof(pal), 0644);



-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
