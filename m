From: Vicente Feito <vicente.feito@gmail.com>
Date: Tue, 22 Mar 2005 10:13:39 +0000
Subject: [KJ][PATCH] kj-devel.pl
Message-Id: <200503221013.39315.vicente.feito@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_T/+PCcUkpwDcrdC"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_T/+PCcUkpwDcrdC
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

This patch goes against the original file here:=20
http://www.kerneljanitors.org/scripts/kj-devel.pl

Randy: The comment you've made about spinlocks, you can easily let them out=
 of=20
the checking by using --nospinlocks, but, I don't understand the comment on=
=20
using the nr line at the begining instead of using it at the end, I mean, a=
ny=20
special reason? (Also, I'm not a native english speaker so I really appreci=
ate=20
the corrections, since I've learned english from HBO, not kidding :).

I've added checks for the use of memset with backward parameters, because=20
ultimately a lot of these appeared.

I was about to rewrite some part of the code last night to make it more use=
r=20
friendly in order to allow other people add their regexes easily, but I don=
't=20
know if someone is even using this, so I've avoided that by now, if I get=20
some feedback on new things to check (besides the ones I already got to add=
)=20
I'll rewrite that part, I think it would help.

I'm still wondering wether or not to check for the use of task queues, I th=
ink=20
people still use them, so suggestions are more than welcome about this (and=
=20
anything else).

Now that ldd3 is out, people can even send more suggestions in order to che=
ck=20
for other things, but that's up to the janitors team members who hang in th=
e=20
channel 24/7 hardly speaking (how is this possible?they're always on profou=
nd=20
meditation states, shhh ;)

kj-devel.pl net/*/*.c - it's plagued of return ESOMETHING (it's plagued of=
=20
everything) instead of return -ESOMETHING; =A0(of course there are some fal=
se=20
positives because of the existance of i.e. return ETH_HLEN which is correct=
)=20
but some are wrong.

Vicente.

--Boundary-00=_T/+PCcUkpwDcrdC
Content-Type: text/x-diff;
  charset="us-ascii";
  name="kj-devel.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kj-devel.patch"

256,257c256,257
< 					print "Unlocking a lock that hasn't been aquired ".
< 						"yet(could be a false positive) - Line:$linenr\n\n";
---
> 					print "Unlocking a lock that hasn't been acquired ".
> 						"yet (could be a false positive) - Line:$linenr\n\n";
272,273c272,273
< 					print "Unlocking a lock that hasn't been aquired ".
< 						"yet(could be a false positive) - Line:$linenr\n\n";
---
> 					print "Unlocking a lock that hasn't been acquired ".
> 						"yet (could be a false positive) - Line:$linenr\n\n";
287,288c287,288
< 					print "Unlocking a lock that hasn't been aquired ".
< 						"yet(could be a false positive) - Line:$linenr\n\n";
---
> 					print "Unlocking a lock that hasn't been acquired ".
> 						"yet (could be a false positive) - Line:$linenr\n\n";
302c302
< 						"yet(could be a false positive) - Line:$linenr\n\n";
---
> 						"yet (could be a false positive) - Line:$linenr\n\n";
347c347,351
< 				print "Using foo[] it's recommended over *foo: saves memory references & code\n";
---
> 				print "Using foo[] is recommended over *foo: saves memory references & code\n";
> 				print "$filename:$linenr:$line\n\n";
> 			}
> 			if ($line=~/memset\((.*),( *sizeof.*),( *\d+)\)/) {
> 				print "Your memset parameters appears to be backwards\n";
359c363
< 			print "If you're building a module, be concious that you must use the". 
---
> 			print "If you're building a module, note that you must use the". 

--Boundary-00=_T/+PCcUkpwDcrdC
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_T/+PCcUkpwDcrdC--
