From: Zach Brown <zab@zabbo.net>
Date: Mon, 26 Jul 2004 23:01:30 +0000
Subject: [Kernel-janitors] Re: [PATCH] radio/radio-maestro: replace
Message-Id: <41058D4A.9090208@zabbo.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32808830606110151=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41058881.1080406@zabbo.net>
In-Reply-To: <41058881.1080406@zabbo.net>
To: kernel-janitors@vger.kernel.org

--===============32808830606110151==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> Yeah. Just to make sure, the change from TASK_INTERRUPTIBLE in
> sleep125ms() to TASK_UNINTERRUPTIBLE in msleep() is ok?

I suspect so, but I don't know for sure.  I wasn't really involved in
the radio bits.

--===============32808830606110151==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32808830606110151==--
