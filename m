From: randy_dunlap <rdunlap@xenotime.net>
Date: Sat, 28 May 2005 17:41:12 +0000
Subject: Re: [KJ] Getting started.
Message-Id: <20050528104112.2e4b94ef.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57975768675414896=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200505281647.54075.jason@jcorcoran.net>
In-Reply-To: <200505281647.54075.jason@jcorcoran.net>
To: kernel-janitors@vger.kernel.org

--===============57975768675414896==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 28 May 2005 16:47:53 +0100 Jason Corcoran wrote:

| Ok,
| 
| I have now got some free time, after lurking on the list for a week or so. 
| Should I be looking at rc5 or rc4 of 2.6.12, I noticed there is a patch on 
| the janitors website?

(maybe the KJ maintainer would like to comment :)


You should be making patches to latest "linus" (kernel.org)
kernels, e.g., linux-2.6.12-rc5.
However, you generally also need to check that patches for what you
are working on have not already been made by looking at:
- the -mm patchset
- the -kj patchset

You could go even further and check the current kernel git archive
or mailing lists that are appropriate for the area that you are
patching, but that's probably asking too much.

The current kernel git archive is viewable at:
http://www.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=summary

---
~Randy

--===============57975768675414896==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57975768675414896==--
