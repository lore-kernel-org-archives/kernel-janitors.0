From: "David S. Miller" <davem@davemloft.net>
Date: Tue, 21 Sep 2004 22:18:01 +0000
Subject: [Kernel-janitors] Re: [PATCH][ATM]: [drivers] use msleep() instead
Message-Id: <20040921151801.3ccd21cd.davem@davemloft.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============021048770006671713=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200409212029.i8LKTINv010576@ginger.cmf.nrl.navy.mil>
In-Reply-To: <200409212029.i8LKTINv010576@ginger.cmf.nrl.navy.mil>
To: chas3@users.sourceforge.net
Cc: chas@cmf.nrl.navy.mil, netdev@oss.sgi.com, davem@redhat.com, nacc@us.ibm.com, kernel-janitors@lists.osdl.org

--===============021048770006671713==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Sep 2004 16:29:19 -0400
"chas williams (contractor)" <chas@cmf.nrl.navy.mil> wrote:

> this patch (from nacc@us.ibm.com) replaces assorted schedule_timeout()'s
> with msleep()'s.  please apply to 2.6.

Applied, thanks Chas and Nishanth.

--===============021048770006671713==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============021048770006671713==--
