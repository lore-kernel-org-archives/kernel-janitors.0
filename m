From: Godmar Back <godmar@gmail.com>
Date: Wed, 02 Feb 2005 00:04:29 +0000
Subject: Re: [KJ] question regarding global symbols & namespace.pl script
Message-Id: <719dced305020116041f3b1ea4@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14329071801726645=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <719dced3050201104324e53747@mail.gmail.com>
In-Reply-To: <719dced3050201104324e53747@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============14329071801726645==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Regarding the namespace.pl issue, it seems that this script is not
intended to be run from the command line without setting the srctree
and objtree environment variables first.

The reason is that File::Find apparently chdir's into the directory
where the file is located, so the test on line 176: if (! -e
"$source.c" fails because $source is set to
arch/i386/process/kernel.c, but the current directory is already
./arch/i386/kernel. I saw in an strace that stat64("process.o")
succeeded right before stat64("arch/i386/process/kernel.c") failed. It
works fine with setting objtree and srctree beforehand.

The problem with GNU vs GCC might be an unrelated issue, but since the
.c file existed, it should not have executed the code that failed.

Thanks!

 - Godmar

ps: I apologize for the linebreaks in this email - does anybody know
how to use gmail with a monospace font in a htmlarea?

--===============14329071801726645==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14329071801726645==--
