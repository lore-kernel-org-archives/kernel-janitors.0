From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Wed, 01 Mar 2006 05:46:51 +0000
Subject: Re: [KJ] [PATCH] check request_region() return value in arch/ppc and
Message-Id: <200603010646.51479.tim@aapopfiets.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602272229.51950.tim@aapopfiets.nl>
In-Reply-To: <200602272229.51950.tim@aapopfiets.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 28 February 2006 22:48, Alexey Dobriyan wrote:
> OK, you've followed this route. One question they'll ask me is
>
> 	Can those calls ever fail?
>
> I mean, you're deeply in arch-specific setup code. And request_region()
> parameters are hardwired. And numbers are common among other subarchs in
> this patch.
That's a good question.  Jesper's e-mail explains it well, too.  So, no 
request_region checking in /arch?  Should it only be done in drivers?

Tim
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
