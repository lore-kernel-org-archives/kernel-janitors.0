From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sun, 27 Mar 2005 06:57:50 +0000
Subject: Re: [KJ][PATCH] kj-devel.pl
Message-Id: <4246596E.8020508@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200503221013.39315.vicente.feito@gmail.com>
In-Reply-To: <200503221013.39315.vicente.feito@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Vicente Feito wrote:
> This patch goes against the original file here: 
> http://www.kerneljanitors.org/scripts/kj-devel.pl
> 
> Randy: The comment you've made about spinlocks, you can easily let them out of 
> the checking by using --nospinlocks, but, I don't understand the comment on 
> using the nr line at the begining instead of using it at the end, I mean, any 
> special reason? (Also, I'm not a native english speaker so I really appreciate 
> the corrections, since I've learned english from HBO, not kidding :).
Wow, that's cool.  :)

Line nrs at beginning are just more common in some other tools,
like gcc and sparse.

> I've added checks for the use of memset with backward parameters, because 
> ultimately a lot of these appeared.

Yes, that's good.
Here's something else that I've seen a few patches for recently:
	if (condition);
or
	for (a; b; c);
or
	while (condition);

Of course, any of these may be valid, but several of them
probably are not.  Here's a patch from today that you can
use as an example:


Signed-off-by: Colin Leroy <colin@colino.net>
--- a/drivers/usb/net/zd1201.c	2005-03-24 12:24:23.000000000 +0100
+++ b/drivers/usb/net/zd1201.c	2005-03-24 12:24:41.000000000 +0100
@@ -673,7 +673,7 @@
  		return 0;

  	err = zd1201_docmd(zd, ZD1201_CMDCODE_ENABLE, 0, 0, 0);
-	if (!err);
+	if (!err)
  		zd->mac_enabled = 1;

  	if (zd->monitor)
@@ -690,7 +690,7 @@
  		return 0;
  	if (zd->monitor) {
  		err = zd1201_setconfig16(zd, ZD1201_RID_PROMISCUOUSMODE, 0);
-		if (err);Signed-off-by: Colin Leroy <colin@colino.net>
--- a/drivers/usb/net/zd1201.c	2005-03-24 12:24:23.000000000 +0100
+++ b/drivers/usb/net/zd1201.c	2005-03-24 12:24:41.000000000 +0100
@@ -673,7 +673,7 @@
  		return 0;

  	err = zd1201_docmd(zd, ZD1201_CMDCODE_ENABLE, 0, 0, 0);
-	if (!err);
+	if (!err)
  		zd->mac_enabled = 1;

  	if (zd->monitor)
@@ -690,7 +690,7 @@
  		return 0;
  	if (zd->monitor) {
  		err = zd1201_setconfig16(zd, ZD1201_RID_PROMISCUOUSMODE, 0);
-		if (err);
+		if (err)
  			return err;
  	}
+		if (err)
  			return err;
  	}


> I was about to rewrite some part of the code last night to make it more user 
> friendly in order to allow other people add their regexes easily, but I don't 
> know if someone is even using this, so I've avoided that by now, if I get 
> some feedback on new things to check (besides the ones I already got to add) 
> I'll rewrite that part, I think it would help.
> 
> I'm still wondering wether or not to check for the use of task queues, I think 
> people still use them, so suggestions are more than welcome about this (and 
> anything else).
> 
> Now that ldd3 is out, people can even send more suggestions in order to check 
> for other things, but that's up to the janitors team members who hang in the 
> channel 24/7 hardly speaking (how is this possible?they're always on profound 
> meditation states, shhh ;)
> 
> kj-devel.pl net/*/*.c - it's plagued of return ESOMETHING (it's plagued of 
> everything) instead of return -ESOMETHING;  (of course there are some false 
> positives because of the existance of i.e. return ETH_HLEN which is correct) 
> but some are wrong.
> 
> Vicente.


-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
