From: MJK <mkemp@cs.nmsu.edu>
Date: Sun, 06 Jun 2004 03:28:26 +0000
Subject: Re: [Kernel-janitors] [PATCH]
Message-Id: <Pine.LNX.4.58.0406052127001.17840@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28268327674917337=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0406052118390.17753@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0406052118390.17753@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============28268327674917337==
Content-Type: TEXT/PLAIN; charset=US-ASCII


	Oh, yeah; compiles just fine as module or built-in.

On Sat, 5 Jun 2004, MJK wrote:

>
> 	So, I'm wondering if this is the best choice or not. Shutting down
> the whole i2o system because we can't spawn a kernel thread may not be
> totally fair to the other IOP's. Then again, if we can't spawn a kernel
> thread we probably have other, bigger things to worry about.
> 	Opinions?

--===============28268327674917337==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28268327674917337==--
