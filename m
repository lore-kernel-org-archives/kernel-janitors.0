From: Arnaldo Carvalho de Melo <acme@mandriva.com>
Date: Wed, 03 Jan 2007 12:08:19 +0000
Subject: Re: [KJ] a question about the patch application cycle
Message-Id: <20070103120819.GB3995@mandriva.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701030634470.30039@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701030634470.30039@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 03, 2007 at 06:36:39AM -0500, Robert P. J. Day wrote:
> 
>   am i correct in assuming that, once the -rc cycle starts for the
> kernel, only critical patches are applied, and non-critical (ie.,
> cleanup) patches are held over until the new release?  which suggests
> that, once 2.6.20 comes out, there would normally be a flurry of those
> cleanup patches applied to start the next cycle?  thanks.

Yes, that is right to assume, but there is no single rule for how each
maintainer works, there are some, like David Miller, that creates trees
for the next release, net-2.6.21 (this one didn't took place, but
net-2.6.20 happened when 2.6.19-rc1 was the current rc tree) and would
take most of the networking cleanups intended for the next non-rc phase.

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
