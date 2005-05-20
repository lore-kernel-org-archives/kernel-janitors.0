From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 20 May 2005 19:41:49 +0000
Subject: Re: [KJ] [PATCH] Fix gcc4 warning,
Message-Id: <200505202341.49477.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <428E3224.8030307@cs.pdx.edu>
In-Reply-To: <428E3224.8030307@cs.pdx.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Friday 20 May 2005 22:53, Jesse Millan wrote:
> This patch eliminates the warning that is generated when passing an
> uninitialized variable to a function, and in that function it 'looks'
> like you may read the contents.
> 
> In this case, the address of a local variable 'idx' is passed to the
> function bvec_alloc_bs(). Inside bvec_alloc_bs(), it is possible that
> no value will be assigned to idx, in which case the function immediately
> returns null and does not go on to read it. Human eyes can see that its
> safe.

I think this should go straight to http://gcc.gnu.org/bugzilla/enter_bug.cgi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
