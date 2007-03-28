From: Alan Cox <alan@redhat.com>
Date: Wed, 28 Mar 2007 08:46:20 +0000
Subject: Re: [KJ] Patch:replace with time_after in drivers/net/eexpress.c
Message-Id: <20070328084620.GB21357@devserv.devel.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1175058871.11584.33.camel@shani-win>
In-Reply-To: <1175058871.11584.33.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shani <shani.moideen@wipro.com>
Cc: philb@gnu.org, alan@redhat.com, netdev@vger.kernel.org, kernel-janitors@osdl.org

On Wed, Mar 28, 2007 at 10:44:31AM +0530, Shani wrote:
> Hi,
> 
> Replacing with time_after in drivers/net/eexpress.c
> Applies and compiles clean on latest tree.Not tested.
> 
> thanks.
> 
> Signed-off-by: Shani Moideen <shani.moideen@wipro.com>

NAK as not tested. The existing code is known to work so ugly or not
it is better than untested changes


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
