From: <postfail@hushmail.com>
Date: Sat, 28 Jul 2007 04:33:04 +0000
Subject: ioremap / iounmap balancing between init and cleanup functions
Message-Id: <20070728043305.40320DA82D@mailserver7.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I was peeking at some function balancing for ioremap / iounmap
functions per one of the ongoing work items listed:

* ioremap() must be balanced by an iounmap() (this causes a memory
leak).

A preliminary review leads to some strange things, including cases
where there is an ioremap called in an _init function but no
iounmap called (ever), including in the _cleanup function.  An
example of this can be found in :
linux/sound/oss/dmasound/dmasound_awacs.c  as of the 2.6.22 source.

I *assume* that these should be taken care of, just wanted the
'list take' here before patching efforts take place in case of some
nuance I'm not familiar with.

- --postfail@hushmail.com
-----BEGIN PGP SIGNATURE-----
Note: This signature can be verified at https://www.hushtools.com/verify
Version: Hush 2.5

wpwEAQECAAYFAkaqxloACgkQ5iui/yAtoVl3HwQAkjo5Yb4x/bGGucjIg1mhyE93eCbS
lGc/gjxQuvX1vcjVcGH9s8Zd3LLNC9NUzB8AK4WUz4aPHAsybvnO580BSgnFAjszWCt5
fryBa2eIlorx+kRDz4PgcfpECXfPRFY8NHrcgERc8dpEi76m/3QJ3JKFaUtoCvWE/7EQ
3zjUbJA=GaXL
-----END PGP SIGNATURE-----

--
Give back to your community.  Click here to start a new career as a Police officer.
http://tagline.hushmail.com/fc/Ioyw6h4dFmXnEfllCSSPzqWTdT9g1QZUbovy5HQ15jgZvSzrFcFPhM/


