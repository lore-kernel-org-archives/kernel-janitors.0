From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Fri, 27 May 2005 05:15:21 +0000
Subject: [KJ] strings declaration test and results with size(1)
Message-Id: <20050527021521.059a7445.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69261537577775378=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============69261537577775378==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

In the quest to clean up some strings, and sending some broken patches, I
decided to be sure of a good way to declare constant strings, while keeping
them in compiler scope.

I've marked the best results (at least the ones that seem the best).  I'm
*really* impressed with the results, they're truly unexpected to me.  They
make me believe that gcc goes for the commom usage (char * and 
const char *).

I'd expect the best results always for static const [].  Any comments?


The test consisted of 8 _files_ with one of the following declarations:
	char		  *s1	= "1234567890";
	char		  s2[]	= "2345678901";
	const char	  *s3	= "3456789012";
	const char	  s4[]	= "4567890123";
	static char	  *s5	= "5678901234";
	static char	  s6[]	= "6789012345";
	static const char *s7	= "7890123456";
	static const char s8[]	= "8901234567";

Here are the results, compiled with 'gcc -c' only:
$ size s?.o
   text    data     bss     dec     hex filename
     41       0       0      41      29 s1.o
     57       0       0      57      39 s2.o
     41       0       0      41      29 s3.o
     57       0       0      57      39 s4.o
     34       4       0      38      26 s5.o
     23      11       0      34      22 s6.o (*)
     34       4       0      38      26 s7.o
     34       0       0      34      22 s8.o (*)

Results with 'gcc -c -O':
$ size s?.o
   text    data     bss     dec     hex filename
     18       0       0      18      12 s1.o (*)
     67       0       0      67      43 s2.o
     18       0       0      18      12 s3.o (*)
     67       0       0      67      43 s4.o
     29       4       0      33      21 s5.o
     18      11       0      29      1d s6.o
     29       4       0      33      21 s7.o
     29       0       0      29      1d s8.o

Results with 'gcc -c -O2':
$ size s?.o
   text    data     bss     dec     hex filename
     15       0       0      15       f s1.o (*)
     64       0       0      64      40 s2.o
     15       0       0      15       f s3.o (*)
     64       0       0      64      40 s4.o
     26       4       0      30      1e s5.o
     15      11       0      26      1a s6.o
     26       4       0      30      1e s7.o
     26       0       0      26      1a s8.o

Results with 'gcc -c -O3':
$ size s?.o
   text    data     bss     dec     hex filename
     15       0       0      15       f s1.o (*)
     66       0       0      66      42 s2.o
     15       0       0      15       f s3.o (*)
     66       0       0      66      42 s4.o
     26       4       0      30      1e s5.o
     15      11       0      26      1a s6.o
     26       4       0      30      1e s7.o
     26       0       0      26      1a s8.o

And finally with 'gcc -c -Os':
$ size s?.o
   text    data     bss     dec     hex filename
      7       0       0       7       7 s1.o (*)
     44       0       0      44      2c s2.o
      7       0       0       7       7 s3.o (*)
     44       0       0      44      2c s4.o
     18       4       0      22      16 s5.o
      7      11       0      18      12 s6.o
     18       4       0      22      16 s7.o
     18       0       0      18      12 s8.o


My environment:
Linux sauron 2.4.30 #1 Fri May 6 14:03:24 BRT 2005 i686 unknown unknown GNU/
Linux 
Gnu C                  3.3.5
Gnu make               3.80
binutils               2.15.92.0.2
util-linux             2.12p
mount                  2.12p
module-init-tools      3.1
e2fsprogs              1.35
jfsutils               1.1.6
reiserfsprogs          3.6.18
reiser4progs           line
nfs-utils              1.0.7
Linux C Library        2.3.5
Dynamic linker (ldd)   2.3.5
Linux C++ Library      5.0.7
Procps                 3.2.3
Net-tools              1.60
Kbd                    1.12
Sh-utils               5.2.1
udev                   054
Modules Loaded         nvidia


-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

    How long a minute is depends on which 
    side of the bathroom door you're on.


--===============69261537577775378==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69261537577775378==--
