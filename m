From: "Ravinandan Arakali" <ravinandan.arakali@neterion.com>
Date: Thu, 17 Feb 2005 00:24:20 +0000
Subject: RE: [KJ] RE: [PATCH 14/21] net/s2io: replace schedule_timeout() with
Message-Id: <001601c51487$06d48a60$4510100a@pc.s2io.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83780679869382202=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200501172315.j0HNFAaH027053@guinness.s2io.com>
In-Reply-To: <200501172315.j0HNFAaH027053@guinness.s2io.com>
To: kernel-janitors@vger.kernel.org

--===============83780679869382202==
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Will forward you the patch.

Ravi

-----Original Message-----
From: Nishanth Aravamudan [mailto:nacc@us.ibm.com]
Sent: Wednesday, February 16, 2005 4:13 PM
To: Ravinandan Arakali
Cc: 'Domen Puncer'; 'Raghavendra Koushik';
kernel-janitors@lists.osdl.org; leonid.grossman@neterion.com
Subject: Re: [KJ] RE: [PATCH 14/21] net/s2io: replace schedule_timeout()
with msleep()


On Wed, Feb 16, 2005 at 03:54:06PM -0800, Ravinandan Arakali wrote:
> Domen,
> Thanks for pointing that out. As you mention, the intention is
> indeed to wait for Ctrl+C.
> Nishanth, are you planning to modify it to msleep_interruptible().
> If so, pls note that I submitted a Multicast fix after your below
> patch. Pls apply multicast patch before changing to
msleep_interruptible().

I would be happy to send an incremental fix, but I don't seem to have a
copy of your multicast patch at hand. Could you send me one?

Thanks,
Nish


--===============83780679869382202==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83780679869382202==--
