From: "Ronald S. Bultje" <R.S.Bultje@students.uu.nl>
Date: Wed, 28 Jul 2004 18:54:32 +0000
Subject: [Kernel-janitors] Re: [PATCH] video/zoran_device: replace
Message-Id: <1091040872.18502.8.camel@shrek.bitfreak.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76995438602970179=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76995438602970179==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Nish,

On Tue, 2004-07-27 at 01:11, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list.
[..]
> Description: Uses msleep() instead of schedule_timeout() so the task
> is guaranteed to delay the desired time.

Can you explain some more to a relative scheduling newbie? Is the use of
schedule_timeout() discouraged? Or is its use here wrong? And why
exactly?

Thanks,

Ronald


--===============76995438602970179==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76995438602970179==--
