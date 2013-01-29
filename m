From: Valdis.Kletnieks@vt.edu
Date: Tue, 29 Jan 2013 15:55:16 +0000
Subject: Re: [patch] TTY: synclink, small cleanup in dtr_rts()
Message-Id: <9561.1359474916@turing-police.cc.vt.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="==_Exmh_1359474915_2191P"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130127194039.GA18787@elgon.mountain> <1359317078.14406.12.camel@joe-AO722>
            <20130127201947.GO16282@mwanda>
In-Reply-To: Your message of "Sun, 27 Jan 2013 23:19:47 +0300."
             <20130127201947.GO16282@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, Paul Fulghum <paulkf@microgate.com>, David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--==_Exmh_1359474915_2191P
Content-Type: text/plain; charset="us-ascii"
Content-Id: <9446.1359474907.1@turing-police.cc.vt.edu>

On Sun, 27 Jan 2013 23:19:47 +0300, Dan Carpenter said:

> Yeah.  I think it would be, but adding bitflags together instead of
> doing bitwise ORs is very common as well.

The fact it's common doesn't mean it's good programming practice,
or even correct.  Consider:

#define F_FOO 0x01
#define F_BAR 0x02
#define F_BAZ 0x04

unsigned int flags = F_FOO;
...
      flags |= F_BAR;

Now some time later, another code path does this:

      flags += F_FOO;

If it was another |, it would be a no harm no foul class of bug.
But how long is it going to take you to figure out who set F_BAZ?

I wonder if there's a way to write a coccinelle patch to find places
where we do arithmetic operations on bitmasks....

--==_Exmh_1359474915_2191P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iQIVAwUBUQfw4wdmEQWDXROgAQLg3g/8DWhxyP0rsFHav/81uCMSTkGKsyac8wI6
T9E/WBDECTwJBqanOukJyieIEs2yTz5h2Yk6MEh8jCiXBykIIi9hvbS6dZu1Citf
XgYCnkyr0wEQqC1DOLrh/hTm246R3CO5Hbbx8s8te1eGstINkS8ka4rES7Z6R6b2
Ya1avL0zKC4tFYCek5mNsDIT+HKIIboB9mu+K4HfhJZHX/PVSizujfYLETHP3ZhY
O70RCu6kxs5ROfLwjkLbQGnWCM/GzvZNqRAi/GHM8QX5NMogN7/CtT9F9EmOV1WR
h+hGX2j9aNwaWVw2WHJNQcp2jauqfcAtMqHEiGTXTjfTJMfeaUIsgz0nUvl20D5y
9Y7bsPM/JmYbq4E7y00/iNR7Gz9WOWc/gb2LEvvPzT/P0SNTLSiHXV5fHR2H7QDo
q+q9rMeuoisPsMN0t6+CO4ObdjvRNZW1TUfl+MBPbRDSk7c/BWNLOrk8EHPFjD88
Qqd3oxYn9Sy9toHHjfxBmHc+ep17tLHafaFQO9J9iCbgYwWW2rIddcq/skcGolRM
fYIPT6gil6tm1zt5jXxNOhK/jLBm4tCOkbiZdlsrPtvEBOHiarHRHfx7r63FbmOk
W+AznoCeemburE4FaS7hqGMxeOtWP97MR4CHYoMWi66iTSe36t+X/7UmZunZqDqc
3gXq1O7jWpI=
=hJOs
-----END PGP SIGNATURE-----

--==_Exmh_1359474915_2191P--

