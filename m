From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 21 May 2007 17:01:39 +0000
Subject: Re: [KJ] [PATCH] potential parse error in ifdef
Message-Id: <20070521170138.GA18519@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87fy5q5dxr.fsf@wanadoo.fr>
In-Reply-To: <87fy5q5dxr.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, May 21, 2007 at 06:39:12PM +0200, Yoann Padioleau wrote:
> I have made a tool to parse the kernel that does not pre-process the
> source. That means that my parser tries to parse all the code, including
> code in the #else branch or code that is not often compiled because
> the driver is not very used (or not used at all). So, my parser
> sometimes reports parse error not originally detected by gcc. 
> Here is my (first) patch.

These all look good to me.

Acked-by: Matthew Wilcox <matthew@wil.cx>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
