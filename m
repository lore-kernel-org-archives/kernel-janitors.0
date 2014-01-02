From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Thu, 02 Jan 2014 15:16:55 +0000
Subject: Re: [PATCH 4/25] UBI: fix error return code
Message-Id: <1388675815.25123.91.camel@sauron.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
 <1388357260-4843-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388357260-4843-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org

On Sun, 2013-12-29 at 23:47 +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Set the return variable to an error code as done elsewhere in the function.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)

Pushed to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy

