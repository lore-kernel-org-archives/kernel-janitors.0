From: Carlo Perassi <carlo@linux.it>
Date: Thu, 04 Nov 2004 09:35:09 +0000
Subject: Re: [KJ] [PATCH] driver/net/tg3.c: some s/int/unsigned int
Message-Id: <20041104093509.GA4270@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80706213060678467=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041102101835.GA4083@voyager>
In-Reply-To: <20041102101835.GA4083@voyager>
To: kernel-janitors@vger.kernel.org

--===============80706213060678467==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Actually, the existing tests are wrong and have an off-by-1
> error as well, they should all be "if (limit < 0)"

When I wrote "tested" I mean I used (and I'm still using) for some days
a kernel with these changes without finding weakness in its behavior or
something alike.

You are right about the actual errors and my errors too (and the snippet
you talked about is the only non that trivial part of the patch, and it
was wrong :P)

Please let me know if you'd like a new version without the "if"s or not.

Thanks for your email.

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--===============80706213060678467==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80706213060678467==--
