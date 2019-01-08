From: Juergen Gross <jgross@suse.com>
Date: Tue, 08 Jan 2019 06:58:07 +0000
Subject: Re: [PATCH 13/20] xenbus: drop useless LIST_HEAD
Message-Id: <168d6809-80e0-d639-19a1-eab2ee47765e@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
 <1545555435-24576-14-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1545555435-24576-14-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org

On 23/12/2018 09:57, Julia Lawall wrote:
> Drop LIST_HEAD where the variable it declares is never used.
> 
> The declarations were introduced with the file, but the declared
> variables were not used.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> identifier x;
> @@
> - LIST_HEAD(x);
>   ... when != x
> // </smpl>
> 
> Fixes: 1107ba885e46 ("xen: add xenfs to allow usermode <-> Xen interaction")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
