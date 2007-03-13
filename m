From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Tue, 13 Mar 2007 10:32:29 +0000
Subject: Re: [KJ] how to generate a multi-part patch?
Message-Id: <Pine.LNX.4.58.0703130327500.13997@shark.he.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703130343080.10772@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703130343080.10772@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 13 Mar 2007, Robert P. J. Day wrote:

>
>   what's the canonical way to generate a multi-part patch?  that is,
> starting from "PATCH [0/n]" and so on.  a list of bullet points will
> do fine, i can take it from there.
>
>   from what i read, i'd use quilt to generate the patch set, then
> "git-send-email"?  is that it?  thanks.

As usual, there isn't only one answer for this.  You can use git tools
for the patches and email, or you can use quilt tools for the patches
and email (see 'quilt mail -h').

Or you can use quilt or your own patch management for the patch
series and then use sendpatchset by Paul Jackson:
  http://www.speakeasy.org/~pj99/sgi/sendpatchset

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
