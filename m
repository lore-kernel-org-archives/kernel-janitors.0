From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 22 Feb 2005 17:37:33 +0000
Subject: [KJ] Re: [PATCH] 18/34: ieee1394/video1394: replace
Message-Id: <20050222173733.GB2711@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39580334017599128=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050215002049.GH9231@conscoop.ottawa.on.ca>
In-Reply-To: <20050215002049.GH9231@conscoop.ottawa.on.ca>
To: kernel-janitors@vger.kernel.org

--===============39580334017599128==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 22, 2005 at 12:29:02PM -0500, Jody McIntyre wrote:
> Please add a Signed-off-by: line.

Will do, I just wanted to get you a patch to test first. If it works,
I'll send an "official" one :)

> (more comments below)

<snip>

> > +			if (signal_pending(current)) {
> 
> Extra {.

Whoops, thanks for the catch. Let us know how the testing goes...

-Nish

--===============39580334017599128==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39580334017599128==--
