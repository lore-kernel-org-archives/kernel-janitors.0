From: vicente.feito@gmail.com
Date: Sun, 13 Feb 2005 18:27:57 +0000
Subject: [KJ]kj-devel.pl - spinlock rewrite
Message-Id: <200502131827.58047.vicente.feito@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18632536721062554=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============18632536721062554==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello, I've fixed/added some things, including my name an email inside of the 
source for future reference, I hope not to bother somebody with that.
Also, Dave, would you mind uploading this as the kj-devel.pl in the kernel 
janitors page?This way more people can take a look and even contact to add 
more features/checks, and also, it would be easier for me cause I can start 
sending patches instead of the full source each time I sent an Email, thank 
you, and if not, thank you also!

sleep_on threw false positives with interruptible_sleep_on, fixed
check_unlock() function removed completely, spinlock code rewritten, the lines 
are now correct, and it's no anymore necessary to read several times portions 
of the file, just one it's enough.
The code now checks for extra unlocks that hasn't been locked, but that may 
give false positives
There's no more problem with the spinlock_t function declaration nor 
definitions, that's not cracking the code anymore, I also added some checks 
in order to avoid throwing false positives cause of code like this in the .h 
files i.e.(which are now optionally included):
#define spin_lock(x)    __spin...etc

It has to be taken into account that you can obtain a lock twice in a file 
without unlocking, like global locks or thinks like that, and that cannot be 
checked cause the script only checks syntax, so, this is a problem but it's 
not an easy to fix, although this isn't a frequently issue, it exists.
Another thing is that we can call functions sending a spinlock_t, imagine this 
scenario, f1() {spinlock_t myspin; f2(&my_spin); return 0; } f2(spinlock_t 
*my_spin) { spin_unlock(my_spin); return 0;} if this is the case and you 
maintain the same name, there's not gonna be a problem, this has been fixed 
and it's perfectly allowed, as long as you don't change the name, I repeat.

There's three hashes now to check spin_locks, spin_locks_bh and 
spin_locks_irqsave, in the future that maybe unified if there are more 
spin_lock types checks, for now, having three hashes of arrays it's not a 
problem, but having a hash of hashes of arrays can make the code a little 
obscure.
Added skipping of C++ style comments //
Fixed the use of panic only in drivers and prevent to give false positives in 
declarations like this:NORET_TYPE void panic(...)

In conclusion, a similar approach may be given to balance checks, so I'll 
lookup forward to that next, this way we can check allocation/freed's the 
same way as we check for lock/unlock.

Vicente.

--===============18632536721062554==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18632536721062554==--
