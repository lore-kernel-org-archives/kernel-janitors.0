From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Wed, 14 Sep 2016 00:54:21 +0000
Subject: Re: [PATCH 24/26] ACPI / APD: constify local structures
Message-Id: <3479523.AUgAeqlLYs@vostro.rjw.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr> <1473599168-30561-25-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1473599168-30561-25-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org

On Sunday, September 11, 2016 03:06:06 PM Julia Lawall wrote:
> For structure types defined in the same file or local header files, find
> top-level static structure declarations that have the following
> properties:
> 1. Never reassigned.
> 2. Address never taken
> 3. Not passed to a top-level macro call
> 4. No pointer or array-typed field passed to a function or stored in a
> variable.
> Declare structures having all of these properties as const.
> 
> Done using Coccinelle.
> Based on a suggestion by Joe Perches <joe@perches.com>.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.

Thanks,
Rafael

