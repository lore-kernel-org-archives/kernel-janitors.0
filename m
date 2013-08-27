From: David Vrabel <david.vrabel@citrix.com>
Date: Tue, 27 Aug 2013 18:17:01 +0000
Subject: Re: [patch -next] xen/evtchn: double free on error
Message-Id: <521CED1D.30900@citrix.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130826161817.GF12428@elgon.mountain>
In-Reply-To: <20130826161817.GF12428@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 26/08/13 17:18, Dan Carpenter wrote:
> The call to del_evtchn() frees "evtchn".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch, thanks.

Reviewed-by: David Vrabel <david.vrabel@citrix.com>

This needs to be queued up for 3.12.

David
