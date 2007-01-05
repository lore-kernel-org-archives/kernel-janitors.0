From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 05 Jan 2007 13:54:28 +0000
Subject: [KJ] proper casting (if any) in copy_to_user() calls?
Message-Id: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  if you run the following recursive search:

  $ grep -Er "copy_to_user ?\( ?\(" * | less

you'll notice that numerous calls to copy_to_user() insist on casting
the pointer type of the first argument, despite the fact that that
first pointer is declared as being of type "void __user *" for the
routine itself, so it would seem no pointer is casting is required.

  and yet, you can see that calls to copy_to_user() are casting the
first argument to (among other types) "char *" and "char __user *" and
"void *" and "void __user *" and "unsigned long *" and ... well, you
get the idea.  (the same can be said for the second argument to
copy_from_user().)

  what is the proper rule for casting in this situation?  one would
think most of those casts are totally superfluous, no?

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
