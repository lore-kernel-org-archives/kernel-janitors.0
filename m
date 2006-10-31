From: Steve Fox <drfickle@us.ibm.com>
Date: Tue, 31 Oct 2006 16:57:36 +0000
Subject: Re: [KJ] [PATCH] driver core: handle ignored error codes,
Message-Id: <1162313856.12718.9.camel@flooterbu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061027184103.GB26056@silverwood.ncultra.org>
In-Reply-To: <20061027184103.GB26056@silverwood.ncultra.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2006-10-27 at 14:41 -0400, Mike D. Day wrote:
>  	if ((error = device_pm_add(dev)))
> -		goto PMError;
> +		goto pme_rror;
[snip]
> - PMError:
> +pme_rror:
>  	device_remove_groups(dev);

Shouldn't these be pm_error?

-- 

Steve Fox
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
