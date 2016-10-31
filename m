From: Richard Cochran <richardcochran@gmail.com>
Date: Mon, 31 Oct 2016 09:30:21 +0000
Subject: Re: [PATCH 12/15] ptp: use permission-specific DEVICE_ATTR variants
Message-Id: <20161031093021.GA10489@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
 <1477769829-22230-13-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1477769829-22230-13-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Oct 29, 2016 at 09:37:06PM +0200, Julia Lawall wrote:
> Use DEVICE_ATTR_RO for read only attributes.  This simplifies the
> source code, improves readbility, and reduces the chance of
> inconsistencies.

Acked-by: Richard Cochran <richardcochran@gmail.com>
