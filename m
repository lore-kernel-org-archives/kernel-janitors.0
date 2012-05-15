From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 May 2012 14:44:43 +0000
Subject: Re: [patch] brcm80211: brcmu_pkt_buf_free_skb() should handle NULL
Message-Id: <20120515144443.GH16999@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120515090027.GG30265@elgon.mountain>
 <4FB26664.2080008@broadcom.com>
In-Reply-To: <4FB26664.2080008@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arend van Spriel <arend@broadcom.com>
Cc: Brett Rudley <brudley@broadcom.com>, Roland Vossen <rvossen@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 15, 2012 at 04:21:24PM +0200, Arend van Spriel wrote:
> On 05/15/2012 11:00 AM, Dan Carpenter wrote:
> > This is potentially called with NULL pointers, for example, look at
> > brcmf_c_prec_enq().  Since it's a free() function, probably people
> > expect it to handle NULL pointers.
> 
> Acked-by: Arend van Spriel <arend@broadcom.com>
> 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/net/wireless/brcm80211/brcmutil/utils.c b/drivers/net/wireless/brcm80211/brcmutil/utils.c
> > index b45ab34..3e6405e 100644
> 
> Is the diff command filtered properly here. In most patches I usually
> see '---' immediatly after the Signed-off-by line.
> 

Yeah.  Normally git puts the diffstat there, but my scripts leave
it out.  All my patches are tiny anyway.  ;)

regards,
dan carpenter

