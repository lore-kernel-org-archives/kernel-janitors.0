From: Benoit Boissinot <bboissin@gmail.com>
Date: Thu, 19 May 2005 06:00:40 +0000
Subject: Re: [KJ] (Re: Fix gcc 4 warnings) error: incomplete array element type
Message-Id: <40f323d00505182300758282e6@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <428C2734.7060501@cs.pdx.edu>
In-Reply-To: <428C2734.7060501@cs.pdx.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/19/05, Jesse Millan <jessem@cs.pdx.edu> wrote:
> 
> GCC 4 is rejecting decorations like the following:
> 
> Should I post patches that make this change as I come across them?

I have been compiling -mm kernels with gcc-4 for a while now, and
since gcc-4 errors on such thinks i don't think there are any more
(since make allyesconfig is almost fine).

regards,
Benoit

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
