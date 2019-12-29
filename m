From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Sun, 29 Dec 2019 22:38:19 +0000
Subject: Re: [PATCH 1/4] misc: cxl: use mmgrab
Message-Id: <1d992f7f-25df-7195-14f3-a13c2dccbc96@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
 <1577634178-22530-2-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577634178-22530-2-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

On 30/12/19 2:42 am, Julia Lawall wrote:
> Mmgrab was introduced in commit f1f1007644ff ("mm: add new mmgrab()
> helper") and most of the kernel was updated to use it. Update a
> remaining file.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> <smpl>
> @@ expression e; @@
> - atomic_inc(&e->mm_count);
> + mmgrab(e);
> </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Thanks!

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
