From: Tobias Klauser <tklauser@access.unizh.ch>
Date: Sat, 13 Aug 2005 18:05:21 +0000
Subject: Re: [KJ] register_chrdev could be replaced by cdev_init
Message-Id: <20050813180506.GA1137@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96751925532822258=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42FA9B4D.1020202@zarb.org>
In-Reply-To: <42FA9B4D.1020202@zarb.org>
To: kernel-janitors@vger.kernel.org

--===============96751925532822258==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2005-08-11 at 02:26:53 +0200, trem <trem@zarb.org> wrote:
> I've investigated about char device, and I discover that "register_chrdev"
> is an old way to register char driver. The new way (good one ?) is 
> "cdev_init".

The LDD3 book [1] also provides some valuable information about this issue
in chapter 3, p. 55-57

In case this is added to KJ TODO, a pointer to [2] (the PDF of the third
chapterof LDD3) might be useful.

Cheers, Tobias

[1] http://lwn.net/Kernel/LDD3
[2] http://lwn.net/images/pdf/LDD3/ch03.pdf

--===============96751925532822258==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96751925532822258==--
