From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 10 Jan 2005 18:10:16 +0000
Subject: Re: [KJ] [announce] 2.6.10-bk13-kj
Message-Id: <20050110181016.GD3099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82975786258292694=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050110164703.GD14307@nd47.coderock.org>
In-Reply-To: <20050110164703.GD14307@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============82975786258292694==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2005 at 05:47:03PM +0100, Domen Puncer wrote:
> Patchset of 171 patches is at http://coderock.org/kj/2.6.10-bk13-kj/
> 
> Quick patch summary: about 30 new, 30 merged, 30 dropped.
> Seems like most external trees are merged in -linus, so i'll start
> (re)sending old patches.

<snip>

> msleep-drivers_scsi_imm.patch

This patch should be dropped. The msleep() call will ignore waitqueue events
set up by prepare_to_wait().

Thanks,
Nish

--===============82975786258292694==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82975786258292694==--
