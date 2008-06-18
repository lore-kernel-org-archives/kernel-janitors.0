From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 18 Jun 2008 22:49:54 +0000
Subject: Re: [PATCH] firmware: convert tg3 driver to request_firmware()
Message-Id: <1213829394.26255.1350.camel@pmac.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1213799313.4794.20.camel@fc6.satnam>
In-Reply-To: <1213799313.4794.20.camel@fc6.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2008-06-18 at 15:42 -0700, David Miller wrote:
> And the default is to not use the in-kernel copy.
> 
> At least how things were previously, the dists had to at least think
> about patching out firmware and actually make a decision here.
> 
> Now they can just turn off their brains with the changes you've been
> proposing lately and from a user perspective I am sure the end result
> is going to suck.

Have you been testing the Fedora kernel builds with the new
'kernel-firmware' subpackage and actually found problems with it?

Why did you not report them?

Or even if you aren't talking about _real_ bugs, but just problems you
are imagining -- can you point them out explicitly? Other people on the
distro side with whom it's been discussed have not raised such issues.

The intention of the infrastructure I've developed, in particular the
ability to satisfy request_firmware() without calling out to userspace,
was to solve such issues. We believe they _are_ solved, so if you still
see problems then please actually point them out rather than just
spreading FUD.

-- 
dwmw2

