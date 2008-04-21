From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 21 Apr 2008 20:02:01 +0000
Subject: Re: ehci tests unsigned variables against 0
Message-Id: <20080421200201.GF20637@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080419145812.GN20637@parisc-linux.org>
In-Reply-To: <20080419145812.GN20637@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 21, 2008 at 12:26:10PM -0700, David Brownell wrote:
> On Saturday 19 April 2008, Matthew Wilcox wrote:
> > These tests will never trigger and should simply be removed. ?Linux's
> > kernel snprintf function conforms to C99 and never returns 0.
> 
> I think you mean "never returns negative" ?

True.

> -ENOPATCH

Yeah ... I didn't bother with one.  Let's try now:

diff --git a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
index 64ebfc5..55a2c73 100644
--- a/drivers/usb/host/ehci-dbg.c
+++ b/drivers/usb/host/ehci-dbg.c
@@ -454,9 +454,7 @@ static void qh_lines (
 				(scratch >> 16) & 0x7fff,
 				scratch,
 				td->urb);
-		if (temp < 0)
-			temp = 0;
-		else if (size < temp)
+		if (size < temp)
 			temp = size;
 		size -= temp;
 		next += temp;
@@ -465,9 +463,7 @@ static void qh_lines (
 	}
 
 	temp = snprintf (next, size, "\n");
-	if (temp < 0)
-		temp = 0;
-	else if (size < temp)
+	if (size < temp)
 		temp = size;
 	size -= temp;
 	next += temp;

> ... although if that's the case, I'd think that the *snprintf()
> signatures are incorrect:  they should return "unsigned" not "int".
> If that were done, I think even GCC could be made to report such
> issues; one wouldn't need less-common tools like coccinelle.

We can take it up with ANSI, but I'm not sure they'll be interested in
changing the return type of snprintf ...

> (What I've seen of coccinelle makes me glad it's being applied to
> the kernel sources, by the way.)

Me too!

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
