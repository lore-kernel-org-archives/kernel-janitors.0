From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 24 Apr 2006 04:03:42 +0000
Subject: [KJ] Fwd: Re: [PATCH] 'make headers_install' kbuild target.
Message-Id: <20060424040342.GB7750@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14762541376378069=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============14762541376378069==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm personally not following this l-k thread closely, but curious minds
may want to dig through it.

----- Forwarded message from David Woodhouse <dwmw2@infradead.org> -----

From: David Woodhouse <dwmw2@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: bunk@stusta.de, sam@ravnborg.org
Subject: Re: [PATCH] 'make headers_install' kbuild target.

On Sat, 2006-04-22 at 03:17 +0100, David Woodhouse wrote:
> Attached is the current patch from mainline to my working tree at
> git://git.infradead.org/~dwmw2/headers-2.6.git -- visible in gitweb at
> http://git.infradead.org/?p=users/dwmw2/headers-2.6.git;a=summary
>
> It adds a 'make headers_install' target to the kernel makefiles, which
> exports a subset of the headers and runs 'unifdef' on them to clean
> them up for installation in /usr/include.

I've now added a 'make headers_check' target which goes through the
resulting headers and checks that they are a closed set -- they don't
attempt to include any kernel header which isn't selected for export.
I've also committed enough header cleanups to ensure that the checks
pass, at least for ARCH=powerpc.

In time, I'd like to see additional checks added, such as checking for
namespace pollution and perhaps attempting to compile each header
standalone.

Now that we can see the mess we have when we export it, there should be
plenty of fun pickings for kernel janitor-types. There's no particular
reason why those cleanups should come through my tree, although I'm
happy enough to collect them and to give accounts on git.infradead.org
to anyone who's going to make a habit of sending them.


--===============14762541376378069==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14762541376378069==--
