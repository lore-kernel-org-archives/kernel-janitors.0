From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Mon, 23 Nov 2015 19:13:44 +0000
Subject: Re: [PATCH] nfsd: constify nfsd4_callback_ops structure
Message-Id: <20151123191344.GD12032@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448143059-3523-1-git-send-email-Julia.Lawall@lip6.fr>
 <20151122175742.GA21902@infradead.org>
In-Reply-To: <20151122175742.GA21902@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Jeff Layton <jlayton@poochiereds.net>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Nov 22, 2015 at 09:57:42AM -0800, Christoph Hellwig wrote:
> Thanks, this looks good.  I should have add the const from the start.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks, applying for 4.5.--b.
