From: MJK <mkemp@cs.nmsu.edu>
Date: Tue, 08 Jun 2004 14:27:12 +0000
Subject: Re: [Kernel-janitors] [REDIFF] new.linux-2.6.7-rc2/fs/cifs/cifsfs.c
Message-Id: <Pine.LNX.4.58.0406080824150.32262@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4615872536431227=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0406080152230.31755@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0406080152230.31755@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============4615872536431227==
Content-Type: TEXT/PLAIN; charset=US-ASCII



On Tue, 8 Jun 2004, Matthew Wilcox wrote:

>
> But you didn't actually test it, did you?

	No, I didn't. No CIFS volumes to mount. mkfs didn't seem to be
able to anyways. I guess that's my problem: no hardware to test anything
out and only one machine to do it on. Maybe one day that'll change.

> Your conditions are inverted.  !rc means rc == 0, so you're erroring
> out on success.

	Um, whops. :) I wanted to change as little code as possible and it
was late. I just wasn't thinking. Sorry.

--MJK

--===============4615872536431227==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4615872536431227==--
