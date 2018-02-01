From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Feb 2018 10:25:01 +0000
Subject: Re: [PATCH] coccinelle: reduce false positives
Message-Id: <20180201102501.kc5pfxojn7fhxat4@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1517478532-5444-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1517478532-5444-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Thu, Feb 01, 2018 at 10:48:52AM +0100, Julia Lawall wrote:
> Some files use both a non-devm allocation and a devm_allocation.  Don't
> complain about a free when the same function contains a non-devm
> allocation.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 

That's surprising...  Do you have an example false positive?

regards,
dan carpenter

