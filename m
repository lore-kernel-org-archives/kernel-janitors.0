From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 17 Mar 2004 17:08:30 +0000
Subject: Re: [Kernel-janitors] [PATCH 0/3] - De-uglification work for
Message-Id: <20040317090830.76a81e13.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1078342448.14557.36.camel@telecentrolivre>
In-Reply-To: <1078342448.14557.36.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 03 Mar 2004 16:34:09 -0300 Luiz Fernando Capitulino wrote:

| Hi all,
| 
|  I did some de-uglification work, here is the patches.
| 
|  I don't know if the split was good enough, but is what I did: the first
| patch is for attribuitions and blank lines; the second is for if()
| stataments and loops; the third only for switch()s; the last is a better
| definition for debugt.
| 
|  There is a extra patch for better error handling in floppy_init(). I
| will also send it, but it is not "de-uglification" work.
| 
|  All of then was tested.
| 
|  Here goes the first:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I have tried to apply these 4 patches (numbered 0 thru 3)
and I have a few comments about them.

1.  email number 0 is usually reserved for introduction/background,
not actually a patch.  I would prefer to have seen patch numbers
1 thru 4 in this case.

2.  Someone should be able to apply deuglification patches 0 thru 3
in order without having patch failures/errors, but I can't do that.
Some of the patches have different spacing (like around parens or
before '{') than they should have.  (patch log at end of email)

3.  (#1) some parens are misued (fixed)

4.  for a future patch:  jiffies comparisons should use
time_before() / time_after()

5.  Did/can you verify that the object code didn't change at all
as a result of the deuglification patches?

6.  What about floppy98.c ?  Later?

7.  (#2) lots of trailing spaces/tabs: fixed;



I like these patches in general, so I fixed up the problems that
I had applying them.  Please be more careful in the future.

I'm still checking the floppy_audit patch.

--
~Randy



[rddunlap@gargoyle block]$ patch -p3 -bs  < ~/kj-patches/265-rc1/inputs/floppy_deugli_00.patch

[rddunlap@gargoyle block]$ patch -p3 -bs  < ~/kj-patches/265-rc1/inputs/floppy_deugli_01.patch
1 out of 80 hunks FAILED -- saving rejects to file floppy.c.rej

[rddunlap@gargoyle block]$ patch -p3 -bs  < ~/kj-patches/265-rc1/inputs/floppy_deugli_02.patch
5 out of 9 hunks FAILED -- saving rejects to file floppy.c.rej

[rddunlap@gargoyle block]$ patch -p3 -bs  < ~/kj-patches/265-rc1/inputs/floppy_deugli_03.patch
3 out of 10 hunks FAILED -- saving rejects to file floppy.c.rej
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
