From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Thu, 26 May 2005 17:21:10 +0000
Subject: Re: [KJ] [PATCH 2.6.11.10] arch/cris: fixes static strings declaration
Message-Id: <20050526142110.71f90a5e.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83073690805590894=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050526122502.7aa13915.rnsanchez@terra.com.br>
In-Reply-To: <20050526122502.7aa13915.rnsanchez@terra.com.br>
To: kernel-janitors@vger.kernel.org

--===============83073690805590894==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Alexey Dobriyan <adobriyan@gmail.com>
Sent on  Thu, 26 May 2005 20:35:55 +0400

> What's the difference in .text and .data sizes?

It's small, but as there are lots of occurences which may be corrected
(there are about 475 in total, including those which must be done that
way -- ie, correct).

From the TODO:

=====
From: Jeff Garzik <jgarzik at mandrakesoft dot com>

1) The string form

        [const] char *foo = "blah";

creates two variables in the final assembly output, a static string, and
a char pointer to the static string.  The alternate string form

        [const] char foo[] = "blah";

is better because it declares a single variable.
...
=====


-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

    How long a minute is depends on which 
    side of the bathroom door you're on.


--===============83073690805590894==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83073690805590894==--
