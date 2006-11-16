From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 16 Nov 2006 07:19:13 +0000
Subject: Re: [KJ] adds some more checks to values returned by function
Message-Id: <20061115231913.c969c889.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2aac3c260611081502t6f1f7d0atbc25d8f4e843c8@mail.gmail.com>
In-Reply-To: <2aac3c260611081502t6f1f7d0atbc25d8f4e843c8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 9 Nov 2006 00:02:36 +0100 Giangiacomo Mariotti wrote:

> adds some checks to values returned by calls to function copy_to_user()
> 
> Signed-off-by: Giangiacomo Mariotti <giangiacomo.mariotti@gmail.com>

> From f80156a683beb0d2e580cb95fc6c78f7934335e0 Mon Sep 17 00:00:00 2001
> From: Giangiacomo Mariotti <giangiacomo.mariotti@gmail.com>

What does the first From line mean?

Please see Documentation/SubmittingPatches for the expected
patch format.  (and no Date: line)
(don't repeat the Subject: line)
(several more [minor] problems, but it's not difficult to get
it right)

aurora.c:

+	if(copy_to_user(retinfo, &tmp, sizeof(tmp)))
+		return -EFAULT;

style:  space after "if"

68328serial.c:

+	if(copy_to_user(retinfo,&tmp,sizeof(*retinfo)))
+		return -EFAULT;

style:  space after "if", space after commas.

+			if(copy_to_user((struct m68k_serial *) arg,
+				    info, sizeof(struct m68k_serial)))
+				return -EFAULT;

space after "if"

hppfs:

+		err = copy_to_user(buf, &data->contents[off], count);
+		if(err){

space after "if" (except that the entire source file is like that)

+			printk("hppfs_read : copy_to_user failed, returned %d\n", err);

a.  printk() calls should use a KERN_* level.
b.  We try to limit source lines to <= 80 columns, so this one needs
	to be split.
c.  However, this is noise.  There shouldn't be a printk() call here
	at all.  Drop it.

+			return(err);

no parens around the return value. (ugh, uses source file style)

+		}


---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
