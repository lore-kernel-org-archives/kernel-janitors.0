From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:57:53 +0000
Subject: [Kernel-janitors] Re: [PATCH] radio/radio-maestro: replace
Message-Id: <20040726225753.GT1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62812051766942334=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41058881.1080406@zabbo.net>
In-Reply-To: <41058881.1080406@zabbo.net>
To: kernel-janitors@vger.kernel.org

--===============62812051766942334==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 26, 2004 at 03:41:05PM -0700, Zach Brown wrote:
> 
> > I would appreciate any comments from the janitors list.
> 
> sure looks ok to me.
> 
> > -static void udelay2(void)
> > -{
> > -	udelay(2);
> > -}
> > -
> > -static void udelay4(void)
> > -{
> > -	udelay(4);
> > -}
> 
> wow.

Yeah. Just to make sure, the change from TASK_INTERRUPTIBLE in
sleep125ms() to TASK_UNINTERRUPTIBLE in msleep() is ok?

-Nish

--===============62812051766942334==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62812051766942334==--
