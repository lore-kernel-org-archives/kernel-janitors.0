From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 13 Jul 2004 01:55:39 +0000
Subject: Re: [Kernel-janitors] [PATCH] remove check_region specialix
Message-Id: <20040712185539.66507169.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71064084214532652=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
In-Reply-To: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============71064084214532652==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Jul 2004 09:11:51 -0700 (PDT) Kristen Carlson wrote:

| Thanks!  For my benefit, what's the easiest way to check for trailing spaces?
| I thought I had gotten all of them by just looking at the patch and noting
| which lines shouldn't have needed modifications but I obviously missed some,
| especially on the lines that I was modifying anyway.  Do you have a more 
| foolproof method?


Every time that I apply a patch (similar to what max suggested),
I have a script that does 'patch --dry-run' and also greps for
trailing spaces.

This is my 'dryrun' script:

#! /bin/sh
patch -sp1 --dry-run -i $1 $2 $3 $4 $5 $6 $7 $8 $9
echo "===== trailing spaces? ====="
grep -n "^+.* $" $1 | more


--
~Randy

--===============71064084214532652==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71064084214532652==--
