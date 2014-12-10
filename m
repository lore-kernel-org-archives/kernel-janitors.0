From: Daniel Borkmann <dborkman@redhat.com>
Date: Wed, 10 Dec 2014 23:18:15 +0000
Subject: Re: [PATCH] scripts: coccinelle: add uses of memzero_explicit
Message-Id: <5488D4B7.5010200@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1418242123-8610-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1418242123-8610-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/10/2014 09:08 PM, Julia Lawall wrote:
> Memzero_explicit is a version of memset that is resistent to compiler
> optimizations when the set region is about to go out of scope.
>
> This was suggested by Daniel Borkmann
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

This looks great, thanks a lot Julia!
