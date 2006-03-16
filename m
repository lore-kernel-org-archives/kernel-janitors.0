From: Matt Helsley <matthltc@us.ibm.com>
Date: Thu, 16 Mar 2006 21:03:52 +0000
Subject: Re: [KJ] Re: [PATCH] bug fix to include/linux/cn_proc.h for 2.6.16-rc5
Message-Id: <1142543033.24621.209.camel@stark>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52741915647905646=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1142312124.24621.82.camel@stark>
In-Reply-To: <1142312124.24621.82.camel@stark>
To: kernel-janitors@vger.kernel.org

--===============52741915647905646==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2006-03-16 at 10:44 -0800, Nishanth Aravamudan wrote:
> On 16.03.2006 [09:56:13 -0800], Narasimha Sharoff wrote:
<snip>
> > I do not know how the header files end up in /usr/include/linux
> > directory. Is there a standard process followed while packaging or is
> > this distro specific? Can someone forward me a pointer?
> 
> Distro specific, there's probably a package you can find that put the
> header there (apt-file search filename or dpkg -S filename can help on
> Debian-based distros). I would figure out why it's there (and if it
> should be). Complain to the connector folks about it, as well (or just
> bring it to their attention).

	Perhaps contacting the package maintainer is the correct approach. Have
them remove the #include line from cn_proc.h.

	cn_proc.h should be available to userspace in some form. The event
structures it sends to userspace are defined there. That structure
includes a struct timespec as a timestamp.

	The way I see it, this issue isn't related to connectors. It's related
to process events which send a timestamp with the event to userspace. It
happens to use a connector to send the events. I included time.h because
I needed the timespec struct and getnstimestamp().

Cheers,
	-Matt Helsley


--===============52741915647905646==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52741915647905646==--
