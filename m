From: Domen Puncer <domen@coderock.org>
Date: Thu, 16 Dec 2004 11:03:07 +0000
Subject: [KJ] Re: riscom8: replace cli()/sti() with
Message-Id: <20041216110307.GA4853@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36780779603674629=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36780779603674629==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 15/12/04 23:45 -0600, james4765@verizon.net wrote:
> This is an attempt to get the riscom8 driver working on SMP.  I think I did it
> properly (per what Documentation/cli-sti-removal.txt details).

rc_interrupt also needs to protect data with locks (on UP it was ok,
because interrupts were disabled).

Around line 1130 there are two msleep_interruptible calls under lock
(this was wrong before too).

Some functions don't need to save flags, because you know they are
never called from interrupt (all from riscom_ops?).

IMHO it would be nice to notice somewhere what is protected by lock
(rc_board and rc_port structures); and it would probably be better to
have a lock per board in riscom_board struct.


	Domen

--===============36780779603674629==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36780779603674629==--
