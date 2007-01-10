From: Martin Olsen <triplefault@gmail.com>
Date: Wed, 10 Jan 2007 11:50:56 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <200701101250.56371.triplefault@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_gMNpFWhqL4lNchQ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_gMNpFWhqL4lNchQ
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 10 January 2007 09:25, you wrote:
> On Tue, 9 Jan 2007, Martin Olsen wrote:
> > On Tuesday 09 January 2007 19:57, Robert P. J. Day wrote:
> > > so ... who's up for it?
> >
> > I'd love to take a crack on this.
> >
> > I have yet to submit my first patch to The Kernel so if anyone would
> > like to support me while doing this it would be great.
>
> to help you get things going, i've attached my style.sh script, which
> scans the source tree to find questionable constructs that might
> represent possible cleanups.  in the attached version, i've commented
> out every check except for the power of 2 stuff, so you can see the
> potential for cleanup.
>
> (note how i've specifically scanned for the four similar variations of
> the test, depending on the possibility for parentheses.  if someone
> knows a better way to express these patterns that would handle
> matching parentheses (without getting into perl, that is), i'd love to
> hear it.)
>
> note how almost all of the tests are just one of those variations.  a
> couple notes:
>
> 1) ignore the FIND_FIRST_BIT macro in cardbus.c -- i've already
> submitted a patch to delete that entirely, it's useless.
>
> 2) for the time being, don't mess with anything related to powerpc --
> i get the impression they do things differently there so just give
> that a pass for now.
>
>   first things first, though -- let's see a proposed power_of_2.h
> header file with inline functions:
>
>   is_power_of_2(x)
>   round_up_to_power_of_2(x)
>   round_down_to_power_of_2(x)
>
> rday

What do you say to this patch?

Martin

--Boundary-00=_gMNpFWhqL4lNchQ
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="patch"

diff -uprN -X linux-2.6.19-vanilla/Documentation/dontdiff linux-2.6.19-vanilla/include/linux/power_of_2.h linux-2.6.19-changed/include/linux/power_of_2.h
--- linux-2.6.19-vanilla/include/linux/power_of_2.h	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.19-changed/include/linux/power_of_2.h	2007-01-10 12:42:03.000000000 +0100
@@ -0,0 +1,20 @@
+static inline bool is_power_of_2(int i)
+{
+	return i > 0 && (i & (i - 1)) == 0;
+}
+
+static inline int round_up_to_power_of_2(int i)
+{
+	while ((i & (i - 1)) != 0)
+		i += i & ~(i - 1);
+	
+	return i;
+}
+
+static inline int round_down_to_power_of_2(int i)
+{
+	while (i & (i - 1))
+		i &= (i - 1);
+	
+	return i;
+}

--Boundary-00=_gMNpFWhqL4lNchQ
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_gMNpFWhqL4lNchQ--
