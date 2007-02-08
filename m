From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 08 Feb 2007 06:16:53 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <20070208061652.GA5441@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 08, 2007 at 01:51:45AM +0200, Ahmed S. Darwish wrote:
> It seems that no one is assigned the Min and Max macro job. I'll take
> it if no one seems interested.
> 
> Well, I hope this to become my last brain-dead patch series :).

Be very very careful to not add integer overflows.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
