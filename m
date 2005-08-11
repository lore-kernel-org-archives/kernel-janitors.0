From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Thu, 11 Aug 2005 21:22:42 +0000
Subject: Re: [KJ] Output of make buildcheck
Message-Id: <29495f1d05081114225ef92917@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42FBB9EE.5040307@staticwave.ca>
In-Reply-To: <42FBB9EE.5040307@staticwave.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 8/11/05, Gabriel A. Devenyi <ace@staticwave.ca> wrote:
> Hello All,
> 
> I was wondering if anyone knew what the output of make buildcheck
> actually means, or where documentation is that describes the output.
> Here's an example:
> Error: ./mm/slab.o .data refers to 00000158 R_386_32          .init.text

Consider using make help (or read the Makefile):

Static analysers
  buildcheck      - List dangling references to vmlinux discarded sections
                              and init sections from non-init sections

> Thanks for your help!

Why have we been having this rash of cross-postings to KJ and KN? They
are very different lists with different purposes. If you have a
janitorial patch or question, it goes to KJ; if you have a general
kernel question, it goes to KN.

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
