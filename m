From: Christoph Hellwig <hch@infradead.org>
Date: Sun, 22 Nov 2015 17:57:42 +0000
Subject: Re: [PATCH] nfsd: constify nfsd4_callback_ops structure
Message-Id: <20151122175742.GA21902@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448143059-3523-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1448143059-3523-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, kernel-janitors@vger.kernel.org, Jeff Layton <jlayton@poochiereds.net>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org

Thanks, this looks good.  I should have add the const from the start.

Reviewed-by: Christoph Hellwig <hch@lst.de>
