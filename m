From: JOUANNE Mickael <grigouze@noos.fr>
Date: Sun, 25 Jan 2004 12:38:28 +0000
Subject: [Kernel-janitors]
Message-Id: <20040125123828.GB21585@noos.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ZPt4rx8FFjLCG7dd"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200401162245.33097.domen@coderock.org>
In-Reply-To: <200401162245.33097.domen@coderock.org>
To: kernel-janitors@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I forget the patch :)

--=20
Micka=EBl GRIGOUZE	      grigouze@noos.fr	        ICQ : 42799256
*** \-/ ***  In a World Without Fences Who Needs Gates *** \-/ ***

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="kj.patch"

--- kj.pl	2004-01-05 21:04:37.000000000 +0100
+++ kj-new.pl	2004-01-25 11:38:08.000000000 +0100
@@ -109,7 +109,7 @@
 			print "$filename:$linenr:$line\n\n";
 		}
 
-		if ($line=~/MOD_{INC,DEC}_USE_COUNT/) {
+		if ($line=~/MOD_(INC|DEC)_USE_COUNT/) {
 			print "Net drivers should call SET_MODULE_OWNER instead of MOD_{INC,DEC}_USE_COUNT\n";
 			print "$filename:$linenr:$line\n\n";
 		}

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--ZPt4rx8FFjLCG7dd--
