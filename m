From: burns.ethan@gmail.com
Date: Tue, 13 Mar 2007 12:43:35 +0000
Subject: Re: [KJ] how to generate a multi-part patch?
Message-Id: <20070313124335.GA31357@bender.eaburns.mooo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703130343080.10772@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703130343080.10772@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 13, 2007 at 03:46:01AM -0400, Robert P. J. Day wrote:
>   what's the canonical way to generate a multi-part patch?  that is,
> starting from "PATCH [0/n]" and so on.  a list of bullet points will
> do fine, i can take it from there.
>
>   from what i read, i'd use quilt to generate the patch set, then
> "git-send-email"?  is that it?  thanks.

If you make your changes in a git repo, you can always use git-format-patch to
make the patch set from a set of commits.

		--Ethan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
