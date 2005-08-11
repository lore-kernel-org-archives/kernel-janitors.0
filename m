From: Gabriel Devenyi <ace@staticwave.ca>
Date: Thu, 11 Aug 2005 22:39:48 +0000
Subject: Re: [KJ] Output of make buildcheck
Message-Id: <200508111839.48493.ace@staticwave.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42FBB9EE.5040307@staticwave.ca>
In-Reply-To: <42FBB9EE.5040307@staticwave.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On August 11, 2005 17:22, Nish Aravamudan wrote:
> Consider using make help (or read the Makefile):
> 
> Static analysers
>   buildcheck      - List dangling references to vmlinux discarded sections
>                               and init sections from non-init sections

The problem is that means nothing to me, what do the numbers mean? Whats a
sample bug and fix? I try to google and read available documentation before posting
a question, so telling me to read documentation doesn't help much.

> Why have we been having this rash of cross-postings to KJ and KN? They
> are very different lists with different purposes. If you have a
> janitorial patch or question, it goes to KJ; if you have a general
> kernel question, it goes to KN.

This *is* in fact a question that applies to both KJ and KN, as this is a newbie question (I'm just starting)
and make buildcheck is something suggested by KJ to list errors that need fixing.

-- 
Gabriel Devenyi
ace@staticwave.ca
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
