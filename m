From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 17 Feb 2005 00:13:18 +0000
Subject: Re: [KJ] RE: [PATCH 14/21] net/s2io: replace schedule_timeout() with
Message-Id: <20050217001318.GA2323@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80930906675917225=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200501172315.j0HNFAaH027053@guinness.s2io.com>
In-Reply-To: <200501172315.j0HNFAaH027053@guinness.s2io.com>
To: kernel-janitors@vger.kernel.org

--===============80930906675917225==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 16, 2005 at 03:54:06PM -0800, Ravinandan Arakali wrote:
> Domen,
> Thanks for pointing that out. As you mention, the intention is
> indeed to wait for Ctrl+C.
> Nishanth, are you planning to modify it to msleep_interruptible().
> If so, pls note that I submitted a Multicast fix after your below
> patch. Pls apply multicast patch before changing to msleep_interruptible().

I would be happy to send an incremental fix, but I don't seem to have a
copy of your multicast patch at hand. Could you send me one?

Thanks,
Nish

--===============80930906675917225==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80930906675917225==--
