From: Valdis.Kletnieks@vt.edu
Date: Fri, 13 Nov 2009 21:23:16 +0000
Subject: Re: [PATCH 3/4] security/selinux: decrement sizeof size in strncmp
Message-Id: <19857.1258147396@turing-police.cc.vt.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="==_Exmh_1258147396_3022P"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911120849050.16627@ask.diku.dk> <alpine.LRH.2.00.0911121857110.31071@tundra.namei.org> <20091112145314.GA24682@us.ibm.com> <Pine.LNX.4.64.0911121556390.19779@ask.diku.dk> <4AFC3620.2020809@schaufler-ca.com> <alpine.LRH.2.00.0911130833220.5497@tundra.namei.org>
            <4AFCC06B.1030302@schaufler-ca.com>
In-Reply-To: Your message of "Thu, 12 Nov 2009 18:11:55 PST."
             <4AFCC06B.1030302@schaufler-ca.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: James Morris <jmorris@namei.org>, Julia Lawall <julia@diku.dk>, "Serge E. Hallyn" <serue@us.ibm.com>, Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

--==_Exmh_1258147396_3022P
Content-Type: text/plain; charset=us-ascii

On Thu, 12 Nov 2009 18:11:55 PST, Casey Schaufler said:
> James Morris wrote:
> > Do you see potential for a buffer overrun in this case?

> No, but I hate arguing with people who think that every time
> they see strcmp that they have found a security flaw.

How do you feel about people who think every time they see strcmp()
"Oh crap, something that needs auditing"? ;)

The biggest problem with strcmp() is that even if it got audited when that code
went in, it's prone to unaudited breakage when somebody changes something in
some other piece of code, quite often in some other .c file in some other
directory.

Julia, is there a way to use coccinelle to detect unsafe changes like that?  Or
is expressing those semantics too difficult?



--==_Exmh_1258147396_3022P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFK/c5EcC3lWbTT17ARAtzSAJ4zRrjfCDH9OiVnNIwb11O2VStmUgCgwgGp
3FRC6DGlT8ojgdYTaf5hsdI=
=WBd9
-----END PGP SIGNATURE-----

--==_Exmh_1258147396_3022P--

