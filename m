From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Mon, 31 Oct 2016 06:27:57 +0000
Subject: Re: [PATCH] cxl: Fix error handling
Message-Id: <c134d1f1-e1a2-7721-0356-1e7e3e27e39e@au1.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030214047.25037-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030214047.25037-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, imunsie@au1.ibm.com, fbarrat@linux.vnet.ibm.com
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On 31/10/16 08:40, Christophe JAILLET wrote:
> 'cxl_dev_context_init()' returns an error pointer in case of error, not
> NULL. So test it with IS_ERR.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

> ---
> un-compiled because I don't have the required  cross build environment.

Builds for me.


-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

