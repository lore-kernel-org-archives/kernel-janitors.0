From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 17 Mar 2004 18:13:43 +0000
Subject: Re: [Kernel-janitors] [PATCH 0/3] - De-uglification work for
Message-Id: <20040317101343.6766d9eb.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1078342448.14557.36.camel@telecentrolivre>
In-Reply-To: <1078342448.14557.36.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, 17 Mar 2004 14:59:28 -0300 Luiz Fernando Capitulino wrote:

|=20
| Em Qua, 2004-03-17 =E0s 14:08, Randy.Dunlap escreveu:
|=20
| > 1.  email number 0 is usually reserved for introduction/background,
| > not actually a patch.  I would prefer to have seen patch numbers
| > 1 thru 4 in this case.
|=20
|  Ok (is the first time I sent more than one), it will not happen
| again.
|=20
| > 2.  Someone should be able to apply deuglification patches 0 thru 3
| > in order without having patch failures/errors, but I can't do that.
|=20
|  There are two possible errors for that. The first is the kernel
| version (I saw the floppy driver changed after I did the patch).
|=20
|  The second reason is a question: Should I make incremental patches
| (which I think is what you said above), or should I make all the
| patches against the some (original) tree ?

Yes, a patch series should be incremental.

| > Some of the patches have different spacing (like around parens or
| > before '{') than they should have.  (patch log at end of email)
| >=20
| > 3.  (#1) some parens are misued (fixed)
|=20
|  I will play more attention for that.
|=20
| > 4.  for a future patch:  jiffies comparisons should use
| > time_before() / time_after()
|=20
|  Ok, but I will not change such things in a style patch
| (which fixes braces and tabs). Right ?

Right.

| > 5.  Did/can you verify that the object code didn't change at all
| > as a result of the deuglification patches?
|=20
|  Yes, I will.
| =20
| > 6.  What about floppy98.c ?  Later?
|=20
|  Maybe, Its better I learn how to do the right things first. :-)

Sure.

| > I like these patches in general, so I fixed up the problems that
| > I had applying them.  Please be more careful in the future.
|=20
|  Yes, I will.
|=20
|  Some things I realy don't know, others was a bad work. :-(
|=20
|  Many thanks in poiting this for me Randy,
|=20
| --=20

--
~Randy

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
