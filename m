From: MJK <mkemp@cs.nmsu.edu>
Date: Fri, 28 May 2004 12:11:34 +0000
Subject: Re: [Kernel-janitors] [PATCH] kernel_thread() audit
Message-Id: <Pine.LNX.4.58.0405280611120.26957@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56386447760348934=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============56386447760348934==
Content-Type: TEXT/PLAIN; charset=US-ASCII


	Oh, yeah: compiled but no hardware to test it.

On Thu, 27 May 2004, MJK wrote:

>
> 	Took suggestions (Thanks Randy, Mark!). I also noticed that else
> where in aac_rx_init() there are error returns but no iounmapping. Should
> I also fix that behavior?
>
> 	Signed-off-by: MJK <mkemp@cs.nmsu.edu>

--===============56386447760348934==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56386447760348934==--
